#!/bin/bash
##
## A Stankovic's ChiP-seq run
##
## Izaskun Mallona
## 16 sept 2021

source ~/miniconda3/bin/activate

which python
python --version

conda --version

conda create -n snakePipes -c mpi-ie -c conda-forge -c bioconda snakePipes==2.4.3

## run till here

conda activate snakePipes

export PATH="/path/to/miniconda3/bin:$PATH"

snakePipes info

snakePipes createEnvs


mkdir -p ~/cenp/indices
cd $_

# mm10 - using the precompilled one
wget https://zenodo.org/record/4468065/files/GRCm38_gencode_release19.tar.gz?download=1
