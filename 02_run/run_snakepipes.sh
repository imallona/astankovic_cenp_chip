#!/bin/bash
##
## A Stankovic's ChiP-seq run
##
## Izaskun Mallona
## 16 sept 2021

SP=/home/imallona/miniconda3/envs/snakePipes/lib/python3.9/site-packages/snakePipes
WD='/home/imallona/cenp_chip'
NTHREADS=20

source ~/miniconda3/bin/activate

which python
python --version

conda --version

conda create -n snakePipes -c mpi-ie -c conda-forge -c bioconda snakePipes==2.4.3


conda activate snakePipes

export PATH="/path/to/miniconda3/bin:$PATH"

snakePipes info

snakePipes createEnvs

## run till here


mkdir -p ~/cenp/indices
cd $_

# mm10 - using the precompilled one
wget https://zenodo.org/record/4468065/files/GRCm38_gencode_release19.tar.gz?download=1


# bam2fastqs, and start from the beginning - fastqs

mkdir -p "$WD"/mapping
snakemake --snakefile "$SP"/workflows/DNA-mapping/Snakefile \
          --configFile "$WD"/conf/mapping_config.yaml \
          --directory "$WD"/mapping \
          --cores "$NTHREADS"

mkdir -p "$WD"/chip           
snakemake --snakefile "$SP"/workflows/ChIP-seq/Snakefile \
          --configFile "$WD"/conf/chip_config.yaml \
          --directory "$WD"/chip \
          --cores "$NTHREADS"
