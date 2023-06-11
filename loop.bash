#!/bin/bash
#SBATCH -J proj7
#SBATCH -A cs475-575
#SBATCH -p classmpifinal
#SBATCH -N 4 # number of nodes
#SBATCH -n 4 # number of tasks
#SBATCH --constraint=ib
#SBATCH -o proj7.out
#SBATCH -e proj7.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=estradma@oregonstate.edu
module load  slurm 
module load openmpi
mpic++ proj7.cpp -o proj7 -lm

for np in 1 2 4 6 8; do
    mpiexec -np $np proj7
done