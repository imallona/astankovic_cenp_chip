#!/bin/bash
##
## A Stankovic's ChiP-seq design
##
## Izaskun Mallona
## 16 sept 2021


WD='/home/imallona/cenp_chip'
mkdir -p "$WD"
cd "$_"

mkdir conf
cd "$_"

cat << EOF > "$WD"/conf/conditions.conf
name	condition
input_HC_1	hc
input_PTZ_1	ptz
input_HC_2	hc
input_PTZ_2	ptz
input_HC_3	hc
input_PTZ_3	ptz
chip_HC_1	hc
chip_PTZ_1	ptz
chip_HC_2	hc
chip_PTZ_2	ptz
chip_HC_3	hc
chip_PTZ_3	ptz
EOF

cat << EOF > "$WD"/conf/chip_dict.yaml
chip_dict:
  chip_HC_1:
    control: input_HC_1
    broad: True
  chip_PTZ_1:
    control: input_PTZ_1
    broad: True
  chip_HC_2:
    control: input_HC_2
    broad: True
  chip_PTZ_2:
    control: input_PTZ_2
    broad: True
  chip_HZ_rep_3:
    control: input_HC_3
    broad: True
  chip_PTZ_3:
    control: input_PTZ_3
    broad: True
EOF


cat << EOF > "$WD"/conf/chip_config.yaml
## General/Snakemake parameters, only used/set by wrapper or in Snakemake cmdl, but not in Snakefile
pipeline: chip-seq
cutntag: False # if set to True, overwrites the peakCaller and peakCallerOptions.
configFile: /home/imallona/cenp/conf/chip_dict.yaml
local: true
maxJobs: 5
workingdir: '/home/imallona/cenp'
## preconfigured target genomes (mm9,mm10,dm3,...) , see /path/to/snakemake_workflows/shared/organisms/
## Value can be also path to your own genome config file!
genome: /home/imallona/cenp_chip/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml
## use spikein genome for normalization?
useSpikeInForNorm: false
getSizeFactorsFrom: genome
spikeinExt: _spikein
spikein_bin_size: 1000
## Which peak caller to use?
peakCaller: 'MACS2'
peakCallerOptions: --qvalue 0.001
##MACS2 specific options:
BAMPeaks: --mfold 0 50
BAMPEPeaks:
## paired end data?
pairedEnd: True
## Bin size of output files in bigWig format
bwBinSize: 25
## type of bigwig file to create
bigWigType: both
## Median/mean fragment length, only relevant for single-end data (default: 200)
fragmentLength: 150
verbose: false
# sampleSheet_DB
sampleSheet: /home/imallona/cenp/conf/conditions.conf
# windowSize
windowSize: 150
#### Flag to control the pipeline entry point
bamExt: '.bam'
fromBAM:
plotFormat: png
##dummy string to skip filtering annotation
filterGTF:
##parameters to filter DB regions on
fdr: 0.05
absBestLFC: 1
################################################################################
# Call snakemake directly, i.e. without using the wrapper script:
#
# Please save a copy of this config yaml file and provide an adjusted config
# via '--configFile' parameter!
# example call:
#
# snakemake --snakefile /path/to/snakemake_workflows/workflows/ChIP-seq/Snakefile
#           --configFile /path/to/snakemake_workflows/workflows/ChIP-seq/defaults.yaml
#           --directory /path/to/outputdir
#           --cores 32
################################################################################
EOF


cat << EOF > "$WD"/conf/mapping_config.yaml
## General/Snakemake parameters, only used/set by wrapper or in Snakemake cmdl, but not in Snakefile
pipeline: dna-mapping
outdir: /home/imallona/cenp/mapping
configFile:
clusterConfigFile:
local: True
maxJobs: 5
## directory with fastq files
indir: /home/imallona/cenp_chip/data/fq
## preconfigured target genomes (mm9,mm10,dm3,...) , see /path/to/snakemake_workflows/shared/organisms/
## Value can be also path to your own genome config file!
genome: mm10
## FASTQ file extension (default: ".fastq.gz")
ext: '.fastq.gz'
## paired-end read name extension (default: ['_R1', "_R2"])
reads: [_R1, _R2]
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
mapq: 30
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
fragmentLength: 150
qualimap: true
verbose: false
EOF
