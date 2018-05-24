#!/bin/bash
# call milonga tests for profiling information
# This script uses valgrind as profiling tool (callgrind)


for i in s m g; do
    # Initialize files before looping
    rm hex-$i-times.txt;
    rm hex-$i-results.txt;
    for j in elements volumes; do
	for k in diffusion s2; do
	    echo "---------- hex-$i-$j-$k";
	    echo "---------- hex-$i-$j-$k" >> hex-$i-times.txt;
	    # -a antes do -o faz fazer o append no arquivo.
	    /usr/bin/time -f "%e Elapsed Real Time (secs)\n%S CPU-seconds (secs)\nTotal memory used: %M (Kb)\nAverage memory used: %K (Kb)" -a -o hex-$i-times.txt milonga profiling.mil --$j --$k hex-$i $j $k>> hex-$i-results.txt	    
	done
    done
done



