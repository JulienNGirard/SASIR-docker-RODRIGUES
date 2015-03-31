# SASIR-docker
# RODRIGUES COMPATIBLE


This is a docker image:

* Based on radioastro/base
* Supplementary packages in debian_packages
* Build CEA SASIR Compressed Sensing libraries (from github.com/JulienNGirard/SASIR-library)
* Builds LWimager (from github.com/JulienNGirard/LWimager-SASIR)


So, the SASIR CS imager consist of three parts which are all under my github account (https://github.com/JulienNGirard) but one only needs the docker image to have a working imager.

On the github:
1) CEA Compressed Sensing libraries (SASIR)
https://github.com/JulienNGirard/SASIR-library.git

==> output:    libCEA_comp_sens.a  /  CEA_comp_sens.h       which contains de CS libraries

2) Patched LWimager:
https://github.com/JulienNGirard/LWimager-SASIR.git (based on lwimager in ska-sa repository)

==> output:  lwimager  binary  with a new operation "compsens" that trigger the CS reconstruction with additionnal parameters

3) the Docker image:
https://github.com/JulienNGirard/SASIR-docker.git

==> build the docker, and refers to 1) and 2) for linking to the CS libraries and building LWimager.

to build it, we just need to clone the SASIR-docker and do a make in the folder.


_____________________________

The docker image (and build.sh) will refer to 1) to build the SASIR libraries, and 2) ,to build the patched version of LWimager.

