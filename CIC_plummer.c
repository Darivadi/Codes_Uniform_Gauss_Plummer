#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>
#include <time.h>


#define INDEX(i,j,k) (k)+GV.NGRID*((j)+GV.NGRID*(i)) /* Index preprocessor for the C-Order  */

#include "structures.h"
#include "functions.h"
#include "readWrite.h"


double Plummer(double rad, double aSL, double Mass)
{
  double f_plummer, factor1, factor2, factor3;
  
  factor1 = (3.0*Mass)/ (4 * M_PI * aSL * aSL * aSL);
  factor3 = (rad - (GV.L/2.0)) * (rad - (GV.L/2.0));
  factor2 = (1 +  factor3) / (aSL*aSL) ;
  f_plummer = factor1 * pow(factor2, -5.0/2.0);

  return f_plummer;
}//Plummer


double Plummer_inv(double Plum, double aSL, double Mass)
{
  double Plum_pos, factor1, factor2;
  
  factor1 = (3.0*Mass)/ (4 * M_PI * aSL * aSL * aSL * Plum);
  factor1 = pow(factor1, 2.0/5.0);
  factor2 = aSL * sqrt(factor1 - 1.0);
  Plum_pos = GV.L + factor2;

  return Plum_pos;
}//Plummer



int main()
{
  
  int i, j, k, l, index, indexaux, Np, idPart;
  int ii, jj, kk;
  int icor, jcor, kcor;
  int suma = 0;
  double xc, yc, zc, vxc, vyc, vzc; // Positions and velocities of the cells
  double xp, yp, zp, vxp, vyp, vzp; // Positions and velocities of the particles
  FILE *outfile;
  double foo = 0.0;
  double mass;
  /*GSL*/
  const gsl_rng_type * T; /*Define el tipo de generador de números aleatorios. No hay que liberarlo*/
  gsl_rng * r; /*Análogo al w. Puntero que contiene la info sobre cual generador se va a usar,cantidad de memoria a usar, etc.*/  
  long seed;  
  
  /*Plummer*/
  double aux_x, aux_y, aux_z, aux_rad;
  double ux, uy, uz, phi, theta;
  int count_n = 0;
  double Plummer_max, TMass, aSL;
  FILE *outFile=NULL;
  
  //////////////////////////////////
  //* READING GADGET BINARY FILE *//
  //////////////////////////////////
  printf("Reading parameters file\n");
  read_parameters("./Parameters_files/parameters_file.dat");
  GV.NpTot *= GV.NpTot*GV.NpTot;
  //GV.NpTot = 1000.0;
  
  printf("Parameters file read. Let's work with N=%d particles\n", GV.NpTot);

  /* Simulation parameters */
  GV.L = 400.0;
  GV.NGRID3 = GV.NGRID * GV.NGRID * GV.NGRID;
  GV.mass = 1.0;
  GV.rhoMean = (GV.mass * GV.NpTot) / pow(GV.L,3); // Mean density in 1e10M_sun/Mpc^3
  GV.dx = GV.L / (1.0* GV.NGRID);
  GV.volCell = GV.dx*GV.dx*GV.dx;
  
  part = (struct particle *) calloc((size_t) GV.NpTot,sizeof(struct particle));
  printf("Memory Allocated\n");
  

  /*+++++ Initializing random generation of numbers +++++*/
  gsl_rng_env_setup();//Inicializa las rutinas de generación
  T = gsl_rng_default;/*Inicialización de T con esta variable de GSL que es la default*/
  r = gsl_rng_alloc(T);/*Alocación de memoria*/
  
  seed = time(NULL)*getpid(); 
  
  gsl_rng_set(r, seed);/*Recibe puntero de inicialización de generación y  un entero largo como semilla*/

  

  /*+++++ Rejection method +++++*/
  printf("Performing Rejection\n");
  /*----- Maximum value of the Plummer function -----*/
  TMass = 100.0;
  aSL = 10.0;
  Plummer_max = aSL * aSL * aSL;
  Plummer_max = 4 * M_PI * Plummer_max;
  Plummer_max = (3.0 * TMass) / Plummer_max;

  //outFile = fopen("./../../Processed_data/Plummer_parts.bin", "w");
  count_n = 0;
  
  while(count_n < GV.NpTot )
    {
      aux_rad = aSL * gsl_rng_uniform (r);
      ux = Plummer_max * gsl_rng_uniform (r);           
      
      phi = 2.0*M_PI * gsl_rng_uniform (r);
      theta = acos(1.0 - 2.0 * gsl_rng_uniform (r)); 
      
      if( ux < Plummer( aux_rad, aSL, TMass) )
	{
	  part[count_n].posx = aux_rad * sin(theta) * cos(phi);
	  part[count_n].posy = aux_rad * sin(theta) * sin(phi);
	  part[count_n].posz = aux_rad * cos(theta);
	  
	  part[count_n].id = count_n;
	  part[count_n].mass = 1.0;
	  
	  part[count_n].velx = 0.0;
	  part[count_n].vely = 0.0;
	  part[count_n].velz = 0.0;
	  
	  part[count_n].posx += 0.5*GV.L;
	  part[count_n].posy += 0.5*GV.L;
	  part[count_n].posz += 0.5*GV.L;
	  
	  count_n++;
	}//if
       
    }//while
  
  //fclose(outFile);

  printf("Rejection finished!\n");
  printf("Total number of parts GV.NpTot = %d, count_n=%d\n", 
	 GV.NpTot, count_n);

  printf("part i=0 has posx=%lf posy=%lf posz=%lf\n", 
	 part[0].posx, part[0].posy, part[0].posz);
  
  printf("part i=NpTot-1 has posx=%lf posy=%lf posz=%lf\n", 
	 part[GV.NpTot-1].posx, part[GV.NpTot-1].posy, part[GV.NpTot-1].posz); 
 
  
  gsl_rng_free (r);  
  
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
  printf("NGRID=%d NGRID3=%d NpTotal=%d L=%lf dx=%lf\n",
	 GV.NGRID,
	 GV.NGRID3,
	 GV.NpTot,
	 GV.L,
	 GV.dx);
  printf("-----------------------------------------------\n");


  //////////////////////////////
  //* FROM PARTICLES TO GRID *//
  //////////////////////////////

  /* Array of structure Cell, size NGRID^3 */
  cells = (struct Cell *)calloc((size_t) GV.NGRID3, sizeof( struct Cell) );
  printf("Memory allocated\n");

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
  printf("Locating particles\n");
  for(i=0; i<GV.NpTot; i++){
    locateCell(part[i].posx, part[i].posy, part[i].posz, i, cells);
    
    if(i%1000000==0)
      printf("particle i=%d located\n", i);
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
		cells[indexaux].rho += GV.mass * W(xc-xp, yc-yp, zc-zp, GV.dx);
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
  outfile = fopen("dens_uniform.dat","w");

  fprintf(outfile,
	  "%s%9s %12s %12s %12s %12s %12s %12s %12s %12s %12s\n", 
	  "#", "Index", "x", "y", "z",
	  "vx", "vy", "vz",
	  "rho", "DenCon", "Np_cell");
  */
  for(i=0; i<GV.NGRID; i++){
    for(j=0; j<GV.NGRID; j++){
      for(k=0; k<GV.NGRID; k++){
	index = INDEX(i,j,k); // C-order
	/* coordinates of the cell (in the center of) */
	xc = GV.dx * (0.5 + i);
	yc = GV.dx * (0.5 + j);
	zc = GV.dx * (0.5 + k);

	cells[index].pos[X] = xc;
	cells[index].pos[Y] = yc;
	cells[index].pos[Z] = zc;
	/* Calculating the final density in the cell */
	cells[index].rho = cells[index].rho / GV.volCell;
	/* Calculating the final density contrast in the cell */
	cells[index].denCon = (cells[index].rho/GV.rhoMean) - 1.0;
	/* Writting in the file  */
	/*fprintf(outfile,
		"%10d %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %12.6lf %10d\n", 
		index, xc, yc, zc, 
		cells[index].velx, cells[index].vely, cells[index].velz, 
		cells[index].rho, cells[index].denCon, cells[index].Np_cell);
	*/
      }//for k
    }// for j
  }// for i
  //fclose(outfile);

  /* Writting in the file  */
  write_binary();
  
  
  /* Freeing up memory allocation */
  free(part);
  free(cells);
  
  return 0;
}
