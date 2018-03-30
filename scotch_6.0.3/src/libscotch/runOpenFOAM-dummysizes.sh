#!/bin/bash -evx
#COBALT -O flowSolvus
#COBALT -t 00:30:00
#COBALT -n 1
#COBALT -A Catalyst

. $HOME/JUST4KIX/OpenFOAM/OpenFOAM-4.x/etc/bashrc.ThetaGcc
#LD_LIBRARY_PATH=${FOAM_LIBBIN}:${FOAM_LIBBIN}/dummy

solver="./dummysizes"
#solverOptions="library.h scotch.h"
solverOptions="library_f.h scotchf.h"
now=$(date "+%m.%d.%Y-%H.%M.%S")
#solverLogFile="log.${solver}-${now}"
solverLogFile=

rpn=1
hpc=1
nodes=$COBALT_JOBSIZE

aprun -n $((nodes*rpn)) -N ${rpn} -j ${hpc} ${solver} ${solverOptions}
