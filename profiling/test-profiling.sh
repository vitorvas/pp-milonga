#!/bin/bash
# call milonga tests for profiling information

for i in tet hex; do
    for j in elements volumes; do
	for k in s2 dif; do
	    cd cylinder-$i-$j-$k;
	    milonga ../profiling.mil --$j --$k cylinder-$i-$j-$k > cylinder-$i-$j-$k.dat;
	    gprof /usr/bin/milonga > cylinder-$i-$j-$k-gprof.txt
	    cd ..
	    echo "Done with cylinder-$i-$j-$k."
	done
    done
done



