#!/bin/bash
##
## A Stankovic's ChiP-seq run
##
## Izaskun Mallona
## 16 sept 2021

SP=/home/imallona/miniconda3/envs/snakePipes/lib/python3.9/site-packages/snakePipes
WD='/home/imallona/cenp_chip'
NTHREADS=30

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


mkdir -p ~/cenp_chip/indices
cd $_

# mm10 - using the precompilled one
wget https://zenodo.org/record/4468065/files/GRCm38_gencode_release19.tar.gz

tar xzvf GRCm38_gencode_release19.tar.gz

ll "$WD"/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml

cp /home/imallona/miniconda3/envs/snakePipes/lib/python3.9/site-packages/snakePipes/shared/defaults.yaml{,.backup}

cat << EOF > /home/imallona/miniconda3/envs/snakePipes/lib/python3.9/site-packages/snakePipes/shared/defaults.yaml
clusterConfig: shared/cluster.yaml
configMode: manual
emailSender: null
oldConfig: null
onlySSL: false
organismsDir: /home/imallona/cenp_chip/indices
smtpPassword: null
smtpPort: 0
smtpServer: null
smtpUsername: null
snakemakeOptions: ' --use-conda --conda-prefix /home/imallona/miniconda3/envs '
tempDir: /home/imallona/tmp
toolsVersion: true
EOF

cp "$WD"/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml{,.backup}

cat << EOF > "$WD"/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml
blacklist_bed: ''
bowtie2_index: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/BowtieIndex/genome
bwa_index: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/BWAIndex/genome.fa
bwameth_index: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/BWAmethIndex/genome.fa
extended_coding_regions_gtf: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/annotation/genes.slop.gtf
genes_bed: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/annotation/genes.bed
genes_gtf: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/annotation/genes.gtf
genome_2bit: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/genome_fasta/genome.2bit
genome_dict: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/genome_fasta/genome.dict
genome_fasta: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/genome_fasta/genome.fa
genome_index: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/genome_fasta/genome.fa.fai
genome_size: 2652783500
hisat2_index: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/HISAT2Index/genome
ignoreForNormalization: ''
known_splicesites: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/HISAT2Index/splice_sites.txt
rmsk_file: ''
spikein_blacklist_bed: ''
spikein_genes_gtf: ''
star_index: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/STARIndex/
EOF


# bam2fastqs, and start from the beginning - fastqs

mkdir -p "$WD"/mapping
snakemake --snakefile "$SP"/workflows/DNA-mapping/Snakefile \
          --config "$WD"/conf/mapping_config.yaml \
          --directory "$WD"/mapping \
          --cores "$NTHREADS"

# DNA-mapping -i "$WD"/data/fq -o "$WD"/mapping --mapq 30 -j "$NTHREADS" --dedup mm10 \
#             --trim True \
#             --trimmer trimgalore \
#             --bwBinSize 25 \
#             --plotFormat both

DNA-mapping -c "$WD"/conf/mapping_config.yaml \
            -i "$WD"/data/fq -o "$WD"/mapping --mapq 5 -j "$NTHREADS" --dedup \
            --trim \
            --local \
            --trimmer trimgalore \
            --bwBinSize 25 \
            --plotFormat png \
            --aligner Bowtie2 \
            "$WD"/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml


# mkdir -p "$WD"/chip           
# snakemake --snakefile "$SP"/workflows/ChIP-seq/Snakefile \
#           --config "$WD"/conf/chip_config.yaml \
#           --directory "$WD"/chip \
#           --cores "$NTHREADS"

cd $WD

ChIP-seq -d "$WD"/mapping \
         --local \
         -j "$NTHREADS" \
         -c "$WD"/conf/chip_config.yaml \
         "$WD"/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml \
         "$WD"/conf/chip_dict.yaml
