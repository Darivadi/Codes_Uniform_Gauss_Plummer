CC = gcc
#CFLAGS = -g -Wall -I/home/$(USER)/local/include/ -I/usr/include/ -DCIC -DBINARYDATA
CFLAGS = -c -O3 -I/home/$(USER)/local/include/ -I/usr/include/ -DCIC -DBINARYDATA
#CFLAGS = -g -I/home/$(USER)/local/include/ -I/usr/include/ -DCIC -DBINARYDATA
LFLAGS = -L/home/$(USER)/local/lib 
PROGRAM = CIC_uniform
#PROGRAM = CIC_plummer
#PROGRAM = CIC_plot_dens

$(PROGRAM):
	echo Compiling $@.c
	$(CC) $(CFLAGS) $@.c -o $@.o
	$(CC) $@.o $(LFLAGS) -lm -o $@.x
	#$(CC) $@.o $(LFLAGS) -lgsl -lgslcblas -lm -o $@.x

	#$(CC) -c -save-temps $@.c $(CFLAGS)
	#$(CC) $@.o -lgsl -lgslcblas -lm -lfftw3 $(LFLAGS) -o $@.x
	#$(CC) $@.o -lgsl -lgslcblas -lm $(LFLAGS) -o $@.x

clean:
	rm -rf *.out
	rm -rf *-
	rm -rf *.out
	rm -rf *#
	rm -rf *.o
	rm -rf *.a
	rm -rf *.so
	rm *~
	rm *.x
