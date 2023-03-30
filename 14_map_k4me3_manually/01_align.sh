#!/bin/bash
##
## aligns K4me3 mouse data to mm10
##
## 30th March 2023
## Izaskun Mallona
##
## GSE85873

# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE85873


WD=/home/imallona/cenp_chip/public/k4me3
mkdir -p $WD/align
cd $_


cut -f1,38- -d"," ../fastqs/selected.txt 
TAB="$(printf '\t')"

cat << EOF > "$WD"/align/mapping_conditions.conf
name${TAB}condition
SRR4045612"${TAB}"ctrl
SRR4045613"${TAB}"ctrl
SRR4045616"${TAB}"novel_enviornment
SRR4045617"${TAB}"novel_environment
EOF

# rather, merge the two fastqs

cd ../fastqs
cat SRR4045612_1.fastq.gz SRR4045613_1.fastq.gz > k4me3_ctrl_1.fastq.gz
cat SRR4045616_1.fastq.gz SRR4045617_1.fastq.gz > k4me3_novel_environment_1.fastq.gz

rm SRR*sra SRR*fastq.gz

cd ../align

cat << EOF > "$WD"/align/mapping_config.yaml
## General/Snakemake parameters, only used/set by wrapper or in Snakemake cmdl, but not in Snakefile
pipeline: dna-mapping
outdir: /home/imallona/cenp_chip/public/k4me3/align
configFile: /home/imallona/cenp_chip/public/k4me3/conf/conditions_sample_swap.conf
clusterConfigFile:
local: True
maxJobs: 5
## directory with fastq files
indir: /home/imallona/cenp_chip/public/k4me3/fastqs
## preconfigured target genomes (mm9,mm10,dm3,...) , see /path/to/snakemake_workflows/shared/organisms/
## Value can be also path to your own genome config file!
genome: mm10
## FASTQ file extension (default: ".fastq.gz")
ext: '.fastq.gz'
## paired-end read name extension (default: ['_R1', "_R2"])
reads: [_1, _2]
## mapping mode
mode: mapping
aligner: Bowtie2
## Number of reads to downsample from each FASTQ file
downsample:
## Options for trimming
trim: True
trimmer: cutadapt
trimmerOptions:
## Bin size of output files in bigWig format
bwBinSize: 25
## Run FASTQC read quality control
fastqc: false
## Run computeGCBias quality control
GCBias: false
## Retain only de-duplicated reads/read pairs
dedup: true
## Retain only reads with at least the given mapping quality
mapq: 5
## Retain only reads mapping in proper pairs
properPairs: false
## Mate orientation in paired-end experiments for Bowtie2 mapping
## (default "--fr" is appropriate for Illumina sequencing)
mateOrientation: --fr
## other Bowtie2 stuff
insertSizeMax: 1000
alignerOpts:
plotFormat: png
UMIBarcode: False
bcPattern: NNNNCCCCCCCC #default: 4 base umi barcode, 8 base cell barcode (eg. RELACS barcode)
UMIDedup: False
UMIDedupSep: "_"
UMIDedupOpts:
## Median/mean fragment length, only relevant for single-end data (default: 200)
fragmentLength: 200
qualimap: true
verbose: false
EOF




SP=/home/imallona/miniconda3/envs/snakePipes/lib/python3.9/site-packages/snakePipes
NTHREADS=30

source ~/miniconda3/bin/activate

conda activate snakePipes

DNA-mapping -c "$WD"/align/mapping_config.yaml \
            -i "$WD"/fastqs \
            -o "$WD" \
            --mapq 5 \
            -j "$NTHREADS" \
            --dedup \
            --trim \
            --local \
            --trimmer trimgalore \
            --bwBinSize 25 \
            --plotFormat png \
            --aligner Bowtie2 \
            ~/cenp_chip/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml


# ChIP-seq -d "$WD" \
#          --local \
#          -j "$NTHREADS" \
#          --qval 0.05 \
#          --mfold "5 50" \
#          -c "$WD"/conf/chip_config_sample_swap_skip_third_replica_without_dupes.yaml \
#          "$WD"/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml \
#          "$WD"/conf/chip_dict_sample_swap_skip_third_replica.yaml
