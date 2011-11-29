#!/bin/bash

#==================================================================================#
#                                                                                  #
# Upper level script submitting a sequence of jobs                                 #
#                                                                                  #
# Run it by doing
# source master_script.sh
#==================================================================================#


BOUTINP=BOUT.inp
BOUTEXE=blob
GRIDFILE=grid.nc


ngrid_list=(0 1 2 3) ##-grid size parameter
##ngrid_list=(0) ##-grid size parameter

##advopt_list=(1 2 3)   ##-advection option
advopt_list=(U1 C2)   ##-advection option



rm -fr Run*

for nxparam in ${ngrid_list[@]}
  do
    echo "nxparam=$nxparam"

    let "nx=128*(2**$nxparam)+4" ##-radial grid
    let "ny=128*(2**$nxparam)+1" ##-toroidal grid
    let "nxpe=32*(2**$nxparam)" ##-number x-domains

    echo "nx=$nx, ny=$ny, nxpe=$nxpe"


    for advparam in ${advopt_list[@]}
    do
	echo "advparam=$advparam"


	dirname=Run_$nx.$ny.$advparam
        mkdir $dirname
        mkdir $dirname/data



    done

done

#----------------------------------------------------------------------#
