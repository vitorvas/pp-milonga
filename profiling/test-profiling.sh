#!/bin/bash
# call milonga tests for profiling information

for i in tet hex; do
    for j in elements volumes; do
	cd cylinder-$i-$j;
	milonga ../profiling.mil --$j cylinder-$i-$j > cylinder-$i-$j.dat;
	gprof /usr/bin/milonga > cylinder-$i-$j-gprof.txt
	cd ..
	echo "Done with cylinder-$i-$j."
    done
done



