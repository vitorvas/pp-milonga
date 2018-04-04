#!/bin/bash
# to copy meshes generated in buril-lx to caprara-lx to run milonga
# in the workstation

for i in tet hex; do
    for j in elements volumes; do
        for k in s2 diffusion; do
            start=`date +%s`
            scp /home/vitors/papers-work/milonga-parallel/profiling/cylinder-$i-$j-$k/cylinder-$i-$j-$k.msh cfx@caprara-lx://home/cfx/workspace/pp-milonga/profiling/cylinder-$i-$j-$k/
            end=`date +%s`
            runtime=$((end-start))
            cd ..
            echo "cylinder-$i-$j-$k scopied in ${runtime} seconds."
        done
    done
done
