#!/bin/bash

#SBATCH -p general*
#SBATCH -N 1
#SBATCH --mem 192g
#SBATCH -n 1
#SBATCH -t 23:00:00
#SBATCH --mail-user dnpl@unc.edu
#SBATCH --mail-type=ALL
#SBATCH -c 20
[ -z "$sourcefilestart" ] && echo "No sourcefilestart env variable passed in" && exit 1
[ -z "$incrementby" ] && echo "No incrementby env variable passed in" && exit 1
[ -z "$epoch" ] && echo "No epoch env variable passed in" && exit 1

#fid=$( basename "$sourcefile" )
#export filename=$fid

cd ../ #sbatch scripts live in subdirectory
R CMD BATCH --no-save --no-restore meg_medusa_mixed_by_wholebrain_ll.R time_freq_${epoch}_${sourcefilestart}_$(date +%s).Rout
