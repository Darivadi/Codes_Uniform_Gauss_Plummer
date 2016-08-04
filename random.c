#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
//#include <fftw3.h>

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
  int i;
  int N;
  N = 128 * 128 * 128;

  for(i=0; i<10000; i++){
    printf("%lf\n",randGauss(200.0, 50.0, 0.0, 400.0));
  }
  
  return 0;
}
