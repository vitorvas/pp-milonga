#!/bin/bash
# call gmsh to generate meshes based on .geo files

for i in tet hex; do
    for j in elements volumes; do
	for k in s2 diffusion; do
	    cd cylinder-$i-$j-$k;
	    start=`date +%s`
	    gmsh -3 ../cylinder-$i.geo -o cylinder-$i-$j-$k.msh > /dev/null

	    # Apply 3 refinements. Ugly, but faster than change the meshes
	    # based on extrusions.
#	    gmsh -refine cylinder-$i-$j-$k.msh -o cylinder-$i-$j-$k.msh > /dev/null
#	    gmsh -refine cylinder-$i-$j-$k.msh -o cylinder-$i-$j-$k.msh > /dev/null
#	    gmsh -refine cylinder-$i-$j-$k.msh -o cylinder-$i-$j-$k.msh > /dev/null
	    end=`date +%s`
	    runtime=$((end-start))
	    cd ..
	    echo "Done with cylinder-$i-$j-$k in ${runtime} seconds."
	done
    done
done



