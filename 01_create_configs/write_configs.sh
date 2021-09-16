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
IP_HC	hc
IP_PTZ	ptz
Input_HC	hc
Input_PTZ	ptz
1-HC_Input_rep_2	hc
2-PTZ_Input_rep_2	ptz
3-HC_Chip_rep_2	hc
4-PTZ_Chip_rep_2	ptz
5-HC_Input_rep_3	hc
6-PTZ_Input_rep_3	ptz
7-HC_Chip_rep_3	hc
8-PTZ_Chip_rep_3	ptz
EOF

cat << EOF > "$WD"/conf/chip_dict.yaml
chip_dict:
  IP_HC:
    control: Input_HC
    broad: True
  IP_PTZ:
    control: Input_PTZ
    broad: True
  3-HC_Chip_rep_2:
    control: 1-HC_Input_rep_2
    broad: True
  4-PTZ_Chip_rep_2:
    control: 2-PTZ_Input_rep_2
    broad: True
  7-HC_Chip_rep_3:
    control: 5-HC_Input_rep_3
    broad: True
  8-PTZ_Chip_rep_3:
    control: 6-PTZ_Input_rep_3
    broad: True
EOF


cat << EOF > "$WD"/conf/config.yaml
## General/Snakemake parameters, only used/set by wrapper or in Snakemake cmdl, but not in Snakefile
pipeline: chip-seq
cutntag: False # if set to True, overwrites the peakCaller and peakCallerOptions.
configFile: /home/imallona/cenp/conf/chip_dict.yaml
local: true
maxJobs: 5
workingdir: '/home/imallona/cenp'
## preconfigured target genomes (mm9,mm10,dm3,...) , see /path/to/snakemake_workflows/shared/organisms/
## Value can be also path to your own genome config file!
genome: mm10
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
