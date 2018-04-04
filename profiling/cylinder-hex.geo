//
// radius of a critical sphere
rc = 7.428998;
// cylinder radius to maintain the same volume as the critical sphere
a = (2/3)^(1/3) * rc;

lc = a/50;        // element characteristic length

Point(1) = {0,  0, 0, lc};
Point(2) = {a,  0, 0, lc};
Point(3) = {0,  a, 0, lc};
Point(4) = {-a, 0, 0, lc};
Point(5) = {0, -a, 0, lc};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};
Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};

// Generate hexahedra
Recombine Surface {6};

Extrude {0, 0, 2*a} {
  Surface{6}; Layers{Round(420*lc)}; Recombine;
}

// Mesh.Algorithm
//
//    2D mesh algorithm (1=MeshAdapt, 2=Automatic, 5=Delaunay, 6=Frontal, 7=BAMG, 8=DelQuad)
//    Default value: 2
//    Saved in: General.OptionsFileName

Mesh.Algorithm = 5; 
Mesh.RecombineAll = 0;

Physical Volume("fuel") = {1};
Physical Surface("external") = {23, 28, 6, 27, 15, 19};
