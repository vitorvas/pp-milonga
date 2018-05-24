#!/bin/bash
# call milonga tests for profiling information
# This script uses valgrind as profiling tool (callgrind)


for i in s m g; do
    # Initialize files before looping
    rm tet-$i-times.txt;
    rm tet-$i-results.txt;
    for j in elements volumes; do
	for k in diffusion s2; do
	    echo "---------- tet-$i-$j-$k";
	    echo "---------- tet-$i-$j-$k" >> tet-$i-times.txt;
	    # -a antes do -o faz fazer o append no arquivo.
	    /usr/bin/time -f "%e Elapsed Real Time (secs)\n%S CPU-seconds (secs)\nTotal memory used: %M (Kb)\nAverage memory used: %K (Kb)" -a -o tet-$i-times.txt milonga profiling.mil --$j --$k tet-$i $j $k>> tet-$i-results.txt	    
	done
    done
done



