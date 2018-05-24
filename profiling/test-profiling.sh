#!/bin/bash
# call milonga tests for profiling information
# This script uses valgrind as profiling tool (callgrind)


for i in tet hex; do
    for j in elements volumes; do
	for k in diffusion; do
#	    start=`date +%s` s2
	    cd cylinder-$i-$j-$k;
	    echo "---------- Cylinder-$i-$j-$k"; # >> cylinder-$i-$j-$k-time.txt;
	    # -a antes do -o faz fazer o append no arquivo.
	    /usr/bin/time -f "%e Elapsed Real Time (secs)\n%S CPU-seconds (secs)\nTotal memory used: %M (Kb)\nAverage memory used: %K (Kb)" -o cylinder-$i-$j-$k-time.txt milonga ../profiling.mil --$j --$k cylinder-$i-$j-$k > cylinder-$i-$j-$k-result.txt	    
	    cd ..;
	    
	    #	    end=`date +%s`
	    #	    runtime=$((end-start))
	    #	    echo $runtime > cylinder-$i-$j-$k-time.txt;
	done
    done
done



