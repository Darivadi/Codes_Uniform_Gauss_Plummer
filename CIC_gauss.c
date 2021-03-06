#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
#include <time.h>
//#include <fftw3.h>

#define CIC /* Preprocessor directive for the selection of the distribution
	       scheme in the routine windowFunction. 
	       Distribution schemes could be Nearest Grid Point (NGP), 
	       Cloud in Cell (CIC) and Triangular Shaped Cloud (TSC).
	    */

#define INDEX(i,j,k) (k)+GV.NGRID*((j)+GV.NGRID*(i)) /* Index preprocessor 
							for the C-Order 
						     */
#include "structures.h"
#include "functions.h"
#include "readWrite.h"

double randn(double mu, double sigma){
  double U1, U2, W, mult;
  static double X1, X2;
  static int call = 0;

  if(call == 1){
    call = !call;
    return (mu + sigma * (double) X2);
  }

  do{
    U1 = -1 + ((double) rand () / RAND_MAX) * 2;
    U2 = -1 + ((double) rand () / RAND_MAX) * 2;
    W = pow (U1, 2) + pow (U2, 2);
  }while (W >= 1 || W == 0);
  
  mult = sqrt ((-2 * log (W)) / W);
  X1 = U1 * mult;
  X2 = U2 * mult;

  call = !call;

  return (mu + sigma * (double) X1);
}

double gauss(double x, double mean, double std){
  double C; // constant of normalization
  double z; // standard variable

  z = (x-mean)/std;
  C = 1.0/(std*sqrt(2.0*M_PI));
  
  return C*exp(-0.5*z*z);
}

double randGauss(double mean, double std, double min, double max){
  double x,y,f;
  do{
    x = min + drand48()*(max - min);
    y = drand48();
    f = gauss(x, mean, std);
  }while(f>y);

  return x;
}


int main(){
  
  int i, j, k, l, index, indexaux, Np, idPart;
  int ii, jj, kk;
  int icor, jcor, kcor;
  int suma = 0;
  double xc, yc, zc, vxc, vyc, vzc; // Positions and velocities of the cells
  double xp, yp, zp, vxp, vyp, vzp; // Positions and velocities of the particles
  FILE *outfile;
  double foo = 0.0;
  double mass;
  double prom=0;
  

  //////////////////////////////////
  //* READING GADGET BINARY FILE *//
  //////////////////////////////////
  read_parameters("./parameters_file.dat");
  GV.NpTot = 100000000;
  /* Simulation parameters */
  GV.L = 400.0;
  GV.NGRID3 = GV.NGRID * GV.NGRID * GV.NGRID;
  GV.mass = 1.0;
  GV.rhoMean = (GV.mass * GV.NpTot) / pow(GV.L,3); // Mean density in 1e10M_sun/Mpc^3
  GV.dx = GV.L / ((double) GV.NGRID);
  GV.volCell = GV.dx*GV.dx*GV.dx;

  part = (struct particle *) calloc((size_t) GV.NpTot,sizeof(struct particle));

  for(i=0; i<GV.NpTot; i++){
    do{
      part[i].posx = randn(GV.L * 0.5, GV.L * 0.125);
    }while(part[i].posx<0 || part[i].posx>GV.L);
    do{
      part[i].posy = randn(GV.L * 0.5, GV.L * 0.125);
    }while(part[i].posy<0 || part[i].posy>GV.L);
    part[i].posz = drand48() * GV.L;
    
    part[i].velx = 0.0;
    part[i].vely = 0.0;
    part[i].velz = 0.0;

    part[i].id = i;
    
    part[i].mass = 1.0;
  }
  

  /* Cosmological parameters */  
  //GV.OmegaM0 = Header.Omega0;
  //GV.OmegaL0 = Header.OmegaLambda;
  //GV.zRS = Header.redshift;
  //GV.HubbleParam = Header.HubbleParam;

  

  /*
    printf("-----------------------------------------------\n");
    printf("Cosmological parameters:\n");
    printf("OmegaM0=%lf OmegaL0=%lf redshift=%lf HubbleParam=%lf\n",
    GV.OmegaM0,
    GV.OmegaL0,
    GV.zRS,
    GV.HubbleParam);
    printf("-----------------------------------------------\n");
  */
  printf("Simulation parameters:\n");
  printf("NGRID=%d NGRID3=%d Particle_Mass=%lf NpTotal=%lf rhoMean=%lf L=%lf volCell=%lf dx=%lf Filename=%s\n",
	 GV.NGRID,
	 GV.NGRID3,
	 GV.mass,
	 GV.NpTot,
	 GV.rhoMean,
	 GV.L,
	 GV.volCell,
	 GV.dx,
	 GV.FILENAME);
  printf("-----------------------------------------------\n");


  //////////////////////////////
  //* FROM PARTICLES TO GRID *//
  //////////////////////////////

  /* Array of structure Cell, size NGRID^3 */
  cells = (struct Cell *)calloc( GV.NGRID3, sizeof( struct Cell) );

  // Setting values to zero at the beggining
  for(i=0; i<GV.NGRID3; i++){
    cells[i].Np_cell = 0;
    cells[i].denCon = 0.0;
    cells[i].rho = 0.0;
    cells[i].velx = 0.0;
    cells[i].vely = 0.0;
    cells[i].velz = 0.0;
  }
  
  /* Locating cells */
  for(i=0; i<GV.NpTot; i++){
    locateCell(part[i].posx, part[i].posy, part[i].posz, i, cells);
  }

  printf("Particles located in the grid\n");
  printf("-----------------------------------------------\n");

  /* Distribution scheme  */
  for(i=0; i<GV.NGRID; i++){
    for(j=0; j<GV.NGRID; j++){
      for(k=0; k<GV.NGRID; k++){
	
	/* Index of the cell  */
	index = INDEX(i,j,k); // C-order
	
	/* coordinates in the center of the cell */
	xc = GV.dx*(0.5 + i);
	yc = GV.dx*(0.5 + j);
	zc = GV.dx*(0.5 + k);
	
	/* Number of particles in the cell */
	Np = cells[index].Np_cell;
	if(Np == 0){
	  cells[index].velx = 0.0;
	  cells[index].vely = 0.0;
	  cells[index].velz = 0.0;
	  continue;  
	}

	for(l=0; l<Np; l++){
	  /* Particle ID */
	  idPart = cells[index].id_part[l];
	  
	  /* Coordinates of the particle  */
	  xp = part[idPart].posx;
	  yp = part[idPart].posy;
	  zp = part[idPart].posz;
	  
	  /* Velocities of the particle  */
	  vxp = part[idPart].velx;
	  vyp = part[idPart].vely;
	  vzp = part[idPart].velz;
	  
	  /* 
	     Cell velocity assignment:
	     At the end of the for at l-index we are going 
	     to toke the ratio with respect to Np, in order 
	     to get the mean of the volocities in each cell.
	   */
	  cells[index].velx += vxp;
	  cells[index].vely += vyp;
	  cells[index].velz += vzp;

	  
	  for(ii=-1; ii<=1; ii++){
	    for(jj=-1; jj<=1; jj++){
	      for(kk=-1; kk<=1; kk++){
		indexaux = INDEX(mod(i+ii,GV.NGRID),mod(j+jj,GV.NGRID),mod(k+kk,GV.NGRID));
		xc = GV.dx*(0.5 + i+ii);
		yc = GV.dx*(0.5 + j+jj);
		zc = GV.dx*(0.5 + k+kk);
		cells[indexaux].rho += GV.mass*W(xc-xp, yc-yp, zc-zp, GV.dx);
	      }
	    }
	  }
	  
	}//for l
	
	/* 
	   Cell velocity assignment:
	   At the end of the for at l-index we are going 
	   to toke the ratio with respect to Np, in order 
	   to get the mean of the volocities in each cell.
	*/
	cells[index].velx = cells[index].velx / ((double) Np);
	cells[index].vely = cells[index].vely / ((double) Np);
	cells[index].velz = cells[index].velz / ((double) Np);
	
      }//for k
    }//for j
  }//for i

    /*
      for(i=0; i<GV.NGRID; i++){
      for(j=0; j<GV.NGRID; j++){
      for(k=0; k<GV.NGRID; k++){
      index = INDEX(i,j,k); // C-order
      cells[index].rho /= GV.NpTot;
      prom += cells[index].rho;
      }
      }
      }
    */
  
  outfile = fopen("dens_gauss.dat","w");

  fprintf(outfile,
	  "%s%9s %12s %12s %12s %12s %12s %12s %12s %12s %12s\n", 
	  "#", "Index", "x", "y", "z",
	  "vx", "vy", "vz",
	  "rho", "DenCon", "Np_cell");
  
  for(i=0; i<GV.NGRID; i++){
    for(j=0; j<GV.NGRID; j++){
      for(k=0; k<GV.NGRID; k++){
	index = INDEX(i,j,k); // C-order
	/* coordinates of the cell (in the center of) */
	xc = GV.dx * (0.5 + i);
	yc = GV.dx * (0.5 + j);
	zc = GV.dx * (0.5 + k);
	/* Calculating the final density in the cell */
	cells[index].rho = cells[index].rho / GV.volCell;
	/* Calculating the final density contrast in the cell */
	cells[index].denCon = (cells[index].rho/GV.rhoMean) - 1.0;
	/* Writting in the file  */
	fprintf(outfile,
		"%10d %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %10d\n", 
		index, xc, yc, zc, 
		cells[index].velx, cells[index].vely, cells[index].velz, 
		cells[index].rho, cells[index].denCon, cells[index].Np_cell);
      }//for k
    }// for j
  }// for i
  fclose(outfile);

  //printf("%lf\n",prom);
  
  /* Freeing up memory allocation */
  free(part);
  free(cells);
  
  return 0;
}
