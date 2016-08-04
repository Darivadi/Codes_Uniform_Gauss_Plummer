//#include "allvars.h"

/*********************************/
//	Save and read data
/*********************************/

//Convert data file text in plain text 

int conf2dump( char filename[] )
{
    char cmd[100];
    sprintf( cmd, 
    "grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump", 
	filename, filename );
    system( cmd );

    return 0;
}

/*************************************************************/



/*************************************************************/

			//Read file with and load information  

int read_parameters( char filename[] )
{
    char cmd[100], filenamedump[100];
    int i=0;
    FILE *file;

    //Loading the file
    file = fopen( filename, "r" );
    if( file==NULL ){
	printf( "  * The file '%s' doesn't exist!\n", filename );
	return 1;}
    fclose(file);
    
    //Converting to plain text
    conf2dump( filename );
    sprintf( filenamedump, "%s.dump", filename );
    file = fopen( filenamedump, "r" );
    
    //Reading
    /*
    while( getc( file ) != EOF ){
	fscanf( file, "%f", &parameters[i] );
	i++;}
    */
    fscanf(file, "%d", &GV.NGRID);
    fscanf(file, "%s", GV.FILENAME);    

    fclose( file );
    
    printf( "  * The file '%s' has been loaded!\n", filename );

    sprintf( cmd, "rm -rf %s.dump", filename );
    system( cmd );
    
    return 0;
}


int write_binary(void)
{
  int i, nread;
  double pos_aux[3];
  double momentum_aux[3];
  FILE *outFile=NULL;
  //outFile = fopen("./../../Processed_data/CIC_DenCon_field_256.bin", "w");                                    
  outFile = fopen("./../../Processed_data/CIC_DenCon_uniform_256.bin", "w");

  /*+++++ Saving Simulation parameters +++++*/
  fwrite(&GV.L, sizeof(double), 1, outFile);  //Box Size                                                        
  fwrite(&GV.OmegaM0, sizeof(double), 1, outFile);  //Matter density parameter                                  
  fwrite(&GV.OmegaL0, sizeof(double), 1, outFile);  //Cosmological constant density parameter                   
  fwrite(&GV.zRS, sizeof(double), 1, outFile);  //Redshift                                                      
  fwrite(&GV.HubbleParam, sizeof(double), 1, outFile);  //Hubble parameter                                      

  printf("Ntotalgrid=%15d\n", GV.NGRID3);

  for(i=0; i<GV.NGRID3; i++ )
    {
      /*----- Positions -----*/
      pos_aux[X] = cells[i].pos[X];
      pos_aux[Y] = cells[i].pos[Y];
      pos_aux[Z] = cells[i].pos[Z];

      fwrite(&pos_aux[0], sizeof(double), 3, outFile);

      /*----- Momentum -----*/
      momentum_aux[X] = cells[i].velx;
      momentum_aux[Y] = cells[i].vely;
      momentum_aux[Z] = cells[i].velz;
      
      fwrite(&momentum_aux[0], sizeof(double), 3, outFile);
      
      /*----- Density contrast -----*/
      fwrite(&cells[i].denCon, sizeof(double), 1, outFile);
    }//for i                                                                                                    

  fclose(outFile);
  return 0;
}//write_binary         

/*************************************************************/

		//Write file with the Field 
/*
int Write_out_file( struct Cell *CELLS,float *prm )
{
  int N_celda, l, m, n, N_celda1; 
  FILE *fp;

  //Create document to write out
  fp = fopen("./CIC_density.dat","w"); 
*/
  /*fprintf( fp, " 5 first raws: Divisions Grid N, Box length L(kpc), Size cells, Number Particles, density_contrast\n");*/
  //fprintf( fp, " mass($10^{12}M_{sun}$) \n ");
  
  //Some parameters are stored
  /*fprintf( fp, "%lf\n%lf\n%lf\n%lf\n", prm[N],
	   prm[L],
	   prm[delta_x],
	   prm[N_part]);*/
/*
  fprintf( fp, "#CellID\t NcellParts\t x\t y\t z\t vx\t vy\t vz\t Density Contrast\n");

  
  //Position and mass assigned is stored per cell
  for (n = 0; n < prm[N]; n++){
    for (m = 0; m < prm[N]; m++){
      for (l = 0; l < prm[N]; l++){
	//N_celda = l+prm[N]*(m+prm[N]*n); //Analogously to the p ID in my FFT code: p = (i * ny + j) * nz + k, where k is the fast runing index (the innermost for) and i is the index of the outermost for.
	N_celda = n + prm[N]*(m+prm[N]*l); //Analogously to the m ID in my code before FFT.
	N_celda1 = l + prm[N]*(m+prm[N]*n);
	fprintf( fp, "%12d %12d %16.8lf %16.8lf %16.8lf %16.8lf %16.8lf %16.8lf %16.8lf\n",
		 N_celda1,
		 CELLS[N_celda].Np_cell,
		 CELLS[N_celda].xc + prm[delta_x]/2.0,
		 CELLS[N_celda].yc + prm[delta_x]/2.0,
		 CELLS[N_celda].zc + prm[delta_x]/2.0,
		 CELLS[N_celda].vxcm,
		 CELLS[N_celda].vycm,
		 CELLS[N_celda].vzcm,
		 CELLS[N_celda].den_con);
      }//for l
    }//for m
  } //for n
  
  
  fclose(fp);
  
  return 0;
}
*/
