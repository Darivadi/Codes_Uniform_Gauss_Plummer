/*
  
  INITCOND 
  PSHERN.c
  
  This routine build the density field elliptical [HERN]. His output is in
  posHERN.initc.
  
*/

#include "protos.h"
#include "nrutil.h"
#include "variables.h"

int PSHERN(void)
{
  
  double X,V,Rfin,Rini,dens,PDF_max,MAXIMA_COMPARATION,comparation;
  double teta,phi,EPS,desp[3],*param,q;
  float *arr;
  int i,k,count,NPBIN=100,*index;
  
  struct HERNpart *temp; 
  FILE *pos_pf;    
  FILE *aux_pf;    
  
  for(i=0; i<NPHERN; i++) 
    HERN[i].eps = HERNeps; 
  
  EPS=0.0; 
  
  for(i=0; i<NPHERN; i++)
    HERN[i].mass = M_HERN/(1.0*NPHERN); 
  
  printf("The maximum of rhoNB is at %f\n",PDF_max);
  
  for(i=0; i<NPHERN; i++) 
    { 
      if((i%1000) == 0) 
	printf(" - %d Particles in HERN\n",i); 
      
      q = 0.98*ran1(idum);
      X = (-aH*q - aH*sqrt(q))/(q-1);
      
      phi = 2.0*M_PI*ran1(idum);      
      teta = acos(1.0 - 2.0*ran1(idum)); 
      
      HERN[i].pos[0] = X*sin(teta)*cos(phi); 
      HERN[i].pos[1] = X*sin(teta)*sin(phi); 
      HERN[i].pos[2] = X*cos(teta); 	
      HERN[i].dist = X;  
    } 
  
  correcCM(NPHERN,4,desp); 
  
  for(i=0; i<NPHERN; i++)   
    HERN[i].dist = dist(0,0,0,HERN[i].pos[0],HERN[i].pos[1],HERN[i].pos[2],EPS);   
  
  
  /* Sorting particles by increasing radius */
  
  arr = (float *) malloc((size_t) NPHERN*sizeof(float));
  index = (int *) malloc((size_t) NPHERN*sizeof(int));
  temp = (struct HERNpart *) malloc((size_t) NPHERN*sizeof(struct HERNpart));
  
  for(i=0; i<NPHERN; i++)
    {
      arr[i] = HERN[i].dist;
      index[i] = i;
      
      temp[i].pos[0] = HERN[i].pos[0];
      temp[i].pos[1] = HERN[i].pos[1];
      temp[i].pos[2] = HERN[i].pos[2];
      temp[i].mass = HERN[i].mass;
      temp[i].dist = HERN[i].dist;
      temp[i].eps = HERN[i].eps;
    }
  
  gsl_fisort(NPHERN,arr,index);
  
  for(i=0; i<NPHERN; i++)
    {
      HERN[i].pos[0] = temp[index[i]].pos[0];
      HERN[i].pos[1] = temp[index[i]].pos[1];
      HERN[i].pos[2] = temp[index[i]].pos[2];
      HERN[i].mass = temp[index[i]].mass;
      HERN[i].dist = temp[index[i]].dist;
      HERN[i].eps = temp[index[i]].eps;
    }
  
  free(index);
  free(temp);
  
  ///////density binning 
  
  Rini=0.0; 
  count=0; 
  
  aux_pf=fopen("HERN_density.dat","w"); 
  
  for(k=0; k<NPHERN; k++) 
    { 
      count = count+1; 
      
      if((count % NPBIN)== 0) 
	{ 
	  Rfin = arr[k]; 
	  V = (4.0/3.0)*M_PI*(pow(Rfin,3) - pow(Rini,3));	  
	  dens = (HERN[2].mass*NPBIN)/V; 
	  fprintf(aux_pf,"%g %g \n",Rini+((Rfin-Rini)/2.0), dens); 
	  Rini = Rfin; 
	} 
    } 
  
  fclose(aux_pf);  
  
  free(arr);
  
  if((pos_pf=fopen("posHERN.initc","w"))==NULL) 
    { 
      printf(" --> Not Can open posHERN.initc file"); 
      exit(0); 
    } 
  
  for(i=0; i<NPHERN; i++) 
    {        
      fprintf(pos_pf,"%g %g %g %g %g %g\n",HERN[i].pos[0],HERN[i].pos[1],HERN[i].pos[2],HERN[i].mass, 
	      HERN[i].dist,rhoHERN(HERN[i].dist));       
    } 
  
  fclose(pos_pf); 
  
  printf("\n---------------------PSHERN-------------------------------\n"); 
  printf(" *-* Positions for HERN particles in posHERN.initc file\n"); 
  printf(" *-* Positions for %d HERN particles \n",NPHERN); 
  printf(" *-* The HERN mass is %g \n",M_HERN); 
  printf(" *-* The mass of a HERN particle is %g\n",HERN[2].mass);   
  printf(" *-* Maximum radius of HERN is %g \n",HERN[NPHERN-1].dist);
  printf(" *-* Corrections for the CM X=%g Y=%g Z=%g \n",desp[0],desp[1],desp[2]); 
  printf("\n---------------------PSHERN-------------------------------\n"); 
  
  return 0; 
  
} 


int PS_gasHERN(void)
{
  
  double X,V,Rfin,Rini,dens,PDF_max,MAXIMA_COMPARATION,comparation;
  double teta,phi,EPS,desp[3],*param,q;
  float *arr;
  int i,k,count,NPBIN=100,*index;
  
  struct Gpart *temp; 
  FILE *pos_pf;    
  FILE *aux_pf;    
  
  for(i=0; i<NPG; i++) 
    GP[i].eps = Geps; 
  
  EPS=0.0; 
  
  MG = 0.2*M_HERN;
  
  for(i=0; i<NPG; i++)
    GP[i].mass = MG/(1.0*NPG); 
  
  printf("The maximum of rhoNB is at %f\n",PDF_max);
  
  for(i=0; i<NPG; i++) 
    { 
      
      if((i%1000) == 0) 
	printf(" - %d Particles in HERN\n",i); 
      
      q = 0.98*ran1(idum);
      X = (-aH*q - aH*sqrt(q))/(q-1);
      
      phi = 2.0*M_PI*ran1(idum);      
      teta = acos(1.0 - 2.0*ran1(idum)); 
      
      GP[i].pos[0] = X*sin(teta)*cos(phi); 
      GP[i].pos[1] = X*sin(teta)*sin(phi); 
      GP[i].pos[2] = X*cos(teta); 	
      GP[i].dist = X;   
    } 
  
  correcCM(NPG,0,desp); 
  
  for(i=0; i<NPG; i++)   
    GP[i].dist = dist(0,0,0,GP[i].pos[0],GP[i].pos[1],GP[i].pos[2],EPS);   
  
  /* Sorting particles by increasing radius */
  
  arr = (float *) malloc((size_t) NPG*sizeof(float));
  index = (int *) malloc((size_t) NPG*sizeof(int));
  temp = (struct Gpart *) malloc((size_t) NPG*sizeof(struct Gpart));
  
  for(i=0; i<NPG; i++)
    {
      arr[i] = GP[i].dist;
      index[i] = i;
      
      temp[i].pos[0] = GP[i].pos[0];
      temp[i].pos[1] = GP[i].pos[1];
      temp[i].pos[2] = GP[i].pos[2];
      
      temp[i].mass = GP[i].mass;
      temp[i].dist = GP[i].dist;
      temp[i].eps = GP[i].eps;
    }
  
  gsl_fisort(NPG,arr,index);
  
  for(i=0; i<NPG; i++)
    {
      GP[i].pos[0] = temp[index[i]].pos[0];
      GP[i].pos[1] = temp[index[i]].pos[1];
      GP[i].pos[2] = temp[index[i]].pos[2];
      GP[i].mass = temp[index[i]].mass;
      GP[i].dist = temp[index[i]].dist;
      GP[i].eps = temp[index[i]].eps;
      
    }
  
  free(index);
  free(temp);
  
  ///////density binning 
  
  Rini=0.0; 
  count=0; 
  
  aux_pf=fopen("gas_density.dat","w"); 
  
  for(k=0; k<NPG; k++) 
    { 
      count = count+1; 
      
      if((count % NPBIN)== 0) 
	{ 
	  Rfin = arr[k]; 
	  V = (4.0/3.0)*M_PI*(pow(Rfin,3) - pow(Rini,3));	  
	  dens = (GP[2].mass*NPBIN)/V; 
	  fprintf(aux_pf,"%g %g \n",Rini+((Rfin-Rini)/2.0), dens); 
	  Rini = Rfin; 
	} 
    } 
  
  fclose(aux_pf);  
  
  free(arr);
  
  if((pos_pf=fopen("posgas.initc","w"))==NULL) 
    { 
      printf(" --> Not Can open posgas.initc file"); 
      exit(0); 
    } 
  
  for(i=0; i<NPG; i++) 
    {        
      fprintf(pos_pf,"%g %g %g %g %g %g\n",GP[i].pos[0],GP[i].pos[1],GP[i].pos[2],GP[i].mass, 
	      GP[i].dist,rhoHERN(GP[i].dist));       
    } 
  
  fclose(pos_pf); 
  
  printf("\n---------------------PSHERN-------------------------------\n"); 
  printf(" *-* Positions for HERN particles in posHERN.initc file\n"); 
  printf(" *-* Positions for %d HERN particles \n",NPG); 
  printf(" *-* The HERN mass is %g \n",0.2*M_HERN); 
  printf(" *-* The mass of a HERN particle is %g\n",GP[2].mass);   
  printf(" *-* Maximum radius of HERN is %g \n",GP[NPG-1].dist);
  printf(" *-* Corrections for the CM X=%g Y=%g Z=%g \n",desp[0],desp[1],desp[2]); 
  printf("\n---------------------PSHERN-------------------------------\n"); 
  
  return 0; 
  
} 
