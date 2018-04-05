#!/bin/bash
# call milonga tests for profiling information
# This script uses valgrind as profiling tool (callgrind)

for i in tet hex; do
    for j in elements volumes; do
	for k in s2 diffusion; do
	    start=`date +%s`
	    cd cylinder-$i-$j-$k;
	    valgrind --tool=callgrind milonga ../profiling.mil --$j --$k cylinder-$i-$j-$k;
#	    gprof /usr/bin/milonga > cylinder-$i-$j-$k-gprof.txt;
	    cd ..
	    end=`date +%s`
	    runtime=$((end-start))
	    echo "Done with cylinder-$i-$j-$k in ${runtime} seconds."
	done
    done
done



