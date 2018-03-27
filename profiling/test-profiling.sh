#!/bin/bash
# call milonga tests for profiling information

for i in tet hex; do
    cd cylinder-$i-1;
    milonga ../profiling.mil cylinder-$i > cylinder-$i.dat;
    gprof /usr/bin/milonga > cylinder-$i-gprof.txt
    cd ..
    echo "Done with cylinder-$i."
    
done



