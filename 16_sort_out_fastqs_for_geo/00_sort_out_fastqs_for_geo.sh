#!/bin/bash
##
## 18th Apr 2023
##

# sample swaps listing/mapping with snakepipes

# the DNA mapping was done with (02_run/run_snakepipes.sh)

# DNA-mapping -c "$WD"/conf/mapping_config_without_dupes.yaml \
#             -i "$WD"/data/fq -o "$WD"/mapping_without_dupes --mapq 5 -j "$NTHREADS" \
#             --dedup \
#             --trim \
#             --local \
#             --trimmer trimgalore \
#             --bwBinSize 25 \
#             --plotFormat png \
#             --aligner Bowtie2 \
#             "$WD"/indices/GRCm38_gencode_release19/GRCm38_gencode_release19.yaml

# the fastqs there are

# [imallona@imlsportmacquarie astankovic_cenp_chip]$ ll ~/cenp_chip/mapping_without_dupes/originalFASTQ/
# total 8
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 input_HC_3_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_HC_3_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 input_HC_1_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_HC_1_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   54 Jan  6  2022 chip_HC_3_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_HC_3_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   54 Jan  6  2022 chip_HC_2_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_HC_2_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   56 Jan  6  2022 input_PTZ_1_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_PTZ_1_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 input_HC_2_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_HC_2_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   56 Jan  6  2022 input_PTZ_3_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_PTZ_3_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   56 Jan  6  2022 input_PTZ_2_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_PTZ_2_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 chip_PTZ_1_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_PTZ_1_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   54 Jan  6  2022 chip_HC_1_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_HC_1_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 chip_PTZ_3_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_PTZ_3_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 chip_PTZ_2_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_PTZ_2_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 chip_PTZ_3_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_PTZ_3_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 chip_PTZ_2_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_PTZ_2_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   54 Jan  6  2022 chip_HC_1_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_HC_1_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 chip_PTZ_1_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_PTZ_1_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   56 Jan  6  2022 input_PTZ_2_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_PTZ_2_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   56 Jan  6  2022 input_PTZ_3_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_PTZ_3_R1.fastq.gz
# drwxr-xr-x  2 imallona robinsonlab 4096 Jan  6  2022 .
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 input_HC_2_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_HC_2_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   56 Jan  6  2022 input_PTZ_1_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_PTZ_1_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   54 Jan  6  2022 chip_HC_2_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_HC_2_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   54 Jan  6  2022 chip_HC_3_R1.fastq.gz -> /home/imallona/cenp_chip/data/fq/chip_HC_3_R1.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 input_HC_1_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_HC_1_R2.fastq.gz
# lrwxrwxrwx  1 imallona robinsonlab   55 Jan  6  2022 input_HC_3_R2.fastq.gz -> /home/imallona/cenp_chip/data/fq/input_HC_3_R2.fastq.gz


# which are

# [imallona@imlsportmacquarie astankovic_cenp_chip]$ ll ~/cenp_chip/data/fq/
# total 44
# drwxr-xr-x 3 imallona robinsonlab 36864 Sep 20  2021 ..
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 input_HC_1_R1.fastq.gz -> ../20201030.B-1_Sample_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 input_PTZ_1_R1.fastq.gz -> ../20201030.B-2_Sample_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 chip_HC_1_R1.fastq.gz -> ../20201030.B-3_Sample_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 chip_PTZ_1_R1.fastq.gz -> ../20201030.B-4_Sample_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 input_PTZ_1_R2.fastq.gz -> ../20201030.B-2_Sample_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 input_HC_1_R2.fastq.gz -> ../20201030.B-1_Sample_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 chip_HC_1_R2.fastq.gz -> ../20201030.B-3_Sample_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    34 Sep 20  2021 chip_PTZ_1_R2.fastq.gz -> ../20201030.B-4_Sample_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 input_HC_3_R1.fastq.gz -> ../20210910.A-o25873_1_1-A1_InputHC_3_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 input_HC_3_R2.fastq.gz -> ../20210910.A-o25873_1_1-A1_InputHC_3_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    50 Sep 20  2021 input_PTZ_3_R2.fastq.gz -> ../20210910.A-o25873_1_2-A2_InputPTZ_3_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    50 Sep 20  2021 input_PTZ_3_R1.fastq.gz -> ../20210910.A-o25873_1_2-A2_InputPTZ_3_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    48 Sep 20  2021 chip_HC_3_R1.fastq.gz -> ../20210910.A-o25873_1_3-A3_ChipHC_3_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    48 Sep 20  2021 chip_HC_3_R2.fastq.gz -> ../20210910.A-o25873_1_3-A3_ChipHC_3_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 chip_PTZ_3_R1.fastq.gz -> ../20210910.A-o25873_1_4-A4_ChipPTZ_3_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 input_HC_2_R1.fastq.gz -> ../20210910.A-o25873_1_5-B1_InputHC_2_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 chip_PTZ_3_R2.fastq.gz -> ../20210910.A-o25873_1_4-A4_ChipPTZ_3_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 input_HC_2_R2.fastq.gz -> ../20210910.A-o25873_1_5-B1_InputHC_2_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    50 Sep 20  2021 input_PTZ_2_R1.fastq.gz -> ../20210910.A-o25873_1_6-B2_InputPTZ_2_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    50 Sep 20  2021 input_PTZ_2_R2.fastq.gz -> ../20210910.A-o25873_1_6-B2_InputPTZ_2_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    48 Sep 20  2021 chip_HC_2_R1.fastq.gz -> ../20210910.A-o25873_1_7-B3_ChipHC_2_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    48 Sep 20  2021 chip_HC_2_R2.fastq.gz -> ../20210910.A-o25873_1_7-B3_ChipHC_2_R2.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 chip_PTZ_2_R1.fastq.gz -> ../20210910.A-o25873_1_8-B4_ChipPTZ_2_R1.fastq.gz
# lrwxrwxrwx 1 imallona robinsonlab    49 Sep 20  2021 chip_PTZ_2_R2.fastq.gz -> ../20210910.A-o25873_1_8-B4_ChipPTZ_2_R2.fastq.gz


# but, during the genomation analysis there was a sample swap correction, i.e.

# in report 13_chip_overview/*Rmd we have:

# original
## [1] "chip_HC_1"    "chip_HC_2_3"  "chip_PTZ_1"   "chip_PTZ_2_3"

# renamed
## [1] "cenp_HC_1"   "cenp_PTZ_23" "cenp_PTZ_1"  "cenp_HC_23"

# so we can build a mapping between the symlinks above and this

# uncorrected

# ls -l ~/cenp_chip/data/fq/ | cut -c 53-

#  input_HC_1_R1.fastq.gz -> ../20201030.B-1_Sample_R1.fastq.gz
#  input_PTZ_1_R1.fastq.gz -> ../20201030.B-2_Sample_R1.fastq.gz
#  chip_HC_1_R1.fastq.gz -> ../20201030.B-3_Sample_R1.fastq.gz
#  chip_PTZ_1_R1.fastq.gz -> ../20201030.B-4_Sample_R1.fastq.gz
#  input_PTZ_1_R2.fastq.gz -> ../20201030.B-2_Sample_R2.fastq.gz
#  input_HC_1_R2.fastq.gz -> ../20201030.B-1_Sample_R2.fastq.gz
#  chip_HC_1_R2.fastq.gz -> ../20201030.B-3_Sample_R2.fastq.gz
#  chip_PTZ_1_R2.fastq.gz -> ../20201030.B-4_Sample_R2.fastq.gz
#  input_HC_3_R1.fastq.gz -> ../20210910.A-o25873_1_1-A1_InputHC_3_R1.fastq.gz
#  input_HC_3_R2.fastq.gz -> ../20210910.A-o25873_1_1-A1_InputHC_3_R2.fastq.gz
#  input_PTZ_3_R2.fastq.gz -> ../20210910.A-o25873_1_2-A2_InputPTZ_3_R2.fastq.gz
#  input_PTZ_3_R1.fastq.gz -> ../20210910.A-o25873_1_2-A2_InputPTZ_3_R1.fastq.gz
#  chip_HC_3_R1.fastq.gz -> ../20210910.A-o25873_1_3-A3_ChipHC_3_R1.fastq.gz
#  chip_HC_3_R2.fastq.gz -> ../20210910.A-o25873_1_3-A3_ChipHC_3_R2.fastq.gz
#  chip_PTZ_3_R1.fastq.gz -> ../20210910.A-o25873_1_4-A4_ChipPTZ_3_R1.fastq.gz
#  input_HC_2_R1.fastq.gz -> ../20210910.A-o25873_1_5-B1_InputHC_2_R1.fastq.gz
#  chip_PTZ_3_R2.fastq.gz -> ../20210910.A-o25873_1_4-A4_ChipPTZ_3_R2.fastq.gz
#  input_HC_2_R2.fastq.gz -> ../20210910.A-o25873_1_5-B1_InputHC_2_R2.fastq.gz
#  input_PTZ_2_R1.fastq.gz -> ../20210910.A-o25873_1_6-B2_InputPTZ_2_R1.fastq.gz
#  input_PTZ_2_R2.fastq.gz -> ../20210910.A-o25873_1_6-B2_InputPTZ_2_R2.fastq.gz
#  chip_HC_2_R1.fastq.gz -> ../20210910.A-o25873_1_7-B3_ChipHC_2_R1.fastq.gz
#  chip_HC_2_R2.fastq.gz -> ../20210910.A-o25873_1_7-B3_ChipHC_2_R2.fastq.gz
#  chip_PTZ_2_R1.fastq.gz -> ../20210910.A-o25873_1_8-B4_ChipPTZ_2_R1.fastq.gz
#  chip_PTZ_2_R2.fastq.gz -> ../20210910.A-o25873_1_8-B4_ChipPTZ_2_R2.fastq.gz


 # so hc2 and hc3 are ptz2 and ptz3; and ptz2 and ptz3 are hc2 and hc3
 ## sample swap corrected

 mkdir ~/cenp_chip/for_geo_sample_swap_corrected
 cd $_

# input hc1 and inputptz1 only, the others had lots of GC bias
 
ln -s ~/cenp_chip/data//20201030.B-1_Sample_R1.fastq.gz input_HC_1_20201030.B-1_R1.fastq.gz
ln -s  ~/cenp_chip/data//20201030.B-2_Sample_R1.fastq.gz input_PTZ_1_20201030.B-2_R1.fastq.gz
ln -s  ~/cenp_chip/data//20201030.B-3_Sample_R1.fastq.gz chip_HC_1_20201030.B-3_R1.fastq.gz
ln -s  ~/cenp_chip/data//20201030.B-4_Sample_R1.fastq.gz chip_PTZ_1_20201030.B-4_R1.fastq.gz
ln -s ~/cenp_chip/data//20201030.B-1_Sample_R2.fastq.gz input_HC_1_20201030.B-1_R2.fastq.gz
ln -s   ~/cenp_chip/data//20201030.B-2_Sample_R2.fastq.gz input_PTZ_1_20201030.B-2_R2.fastq.gz
ln -s  ~/cenp_chip/data//20201030.B-3_Sample_R2.fastq.gz  chip_HC_1_20201030.B-3_R2.fastq.gz
ln -s   ~/cenp_chip/data//20201030.B-4_Sample_R2.fastq.gz chip_PTZ_1_20201030.B-4_R2.fastq.gz


#  input_HC_3_R1.fastq.gz ~/cenp_chip/data//20210910.A-o25873_1_1-A1_InputHC_3_R1.fastq.gz
# input_HC_3_R2.fastq.gz ~/cenp_chip/data//20210910.A-o25873_1_1-A1_InputHC_3_R2.fastq.gz
# input_PTZ_3_R2.fastq.gz ~/cenp_chip/data//20210910.A-o25873_1_2-A2_InputPTZ_3_R2.fastq.gz
# input_PTZ_3_R1.fastq.gz ~/cenp_chip/data//20210910.A-o25873_1_2-A2_InputPTZ_3_R1.fastq.gz

ln -s  ~/cenp_chip/data//20210910.A-o25873_1_3-A3_ChipHC_3_R1.fastq.gz chip_PTZ_3_20210910.A-o25873_1_3-A3_R1.fastq.gz # corrected
ln -s  ~/cenp_chip/data//20210910.A-o25873_1_3-A3_ChipHC_3_R2.fastq.gz chip_PTZ_3_20210910.A-o25873_1_3-A3_R2.fastq.gz # corrected
ln -s  ~/cenp_chip/data//20210910.A-o25873_1_4-A4_ChipPTZ_3_R1.fastq.gz chip_HC_3_20210910.A-o25873_1_4-A4_R1.fastq.gz # corrected
ln -s  ~/cenp_chip/data//20210910.A-o25873_1_4-A4_ChipPTZ_3_R2.fastq.gz chip_HC_3_20210910.A-o25873_1_4-A4_R2.fastq.gz # corrected
ln -s  ~/cenp_chip/data//20210910.A-o25873_1_7-B3_ChipHC_2_R1.fastq.gz chip_PTZ_2_20210910.A-o25873_1_7-B3_R1.fastq.gz # corrected
ln -s  ~/cenp_chip/data//20210910.A-o25873_1_7-B3_ChipHC_2_R2.fastq.gz chip_PTZ_2_20210910.A-o25873_1_7-B3_R2.fastq.gz # corrected
ln -s  ~/cenp_chip/data//20210910.A-o25873_1_8-B4_ChipPTZ_2_R1.fastq.gz chip_HC_2_20210910.A-o25873_1_8-B4_R1.fastq.gz # corrected
ln -s  ~/cenp_chip/data//20210910.A-o25873_1_8-B4_ChipPTZ_2_R2.fastq.gz chip_HC_2_20210910.A-o25873_1_8-B4_R2.fastq.gz # corrected


# GEO spreadsheet
# https://docs.google.com/spreadsheets/d/1epqKNISpafcBTi7wu7KW8jXKGB9DWX2NCreFcn81gCg/edit#gid=980870959

mkdir bws
cd $_


# ln -s /home/imallona/cenp_chip/merged_replicates/chip_HC_1_cov_bga.bedgraph.gz chip_HC_1_cov_bga.bedgraph.gz
# ln -s /home/imallona/cenp_chip/merged_replicates/chip_PTZ_1_cov_bga.bedgraph.gz chip_PTZ_1_cov_bga.bedgraph.gz
# ln -s /home/imallona/cenp_chip/merged_replicates/chip_HC_2_3_cov_bga.bedgraph.gz chip_PTZ_2_3_cov_bga.bedgraph.gz ## corrected
# ln -s /home/imallona/cenp_chip/merged_replicates/chip_PTZ_2_3_cov_bga.bedgraph.gz chip_HC_2_3_cov_bga.bedgraph.gz ## corrected

ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/input_HC_1.seq_depth_norm.bw .
ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/input_PTZ_1.seq_depth_norm.bw .

ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/chip_HC_1.seq_depth_norm.bw .
ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/chip_PTZ_1.seq_depth_norm.bw .

ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/chip_PTZ_3.seq_depth_norm.bw chip_HC_3.seq_depth_norm.bw # corrected
ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/chip_PTZ_2.seq_depth_norm.bw chip_HC_2.seq_depth_norm.bw # corrected

ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/chip_HC_3.seq_depth_norm.bw chip_PTZ_3.seq_depth_norm.bw # corrected
ln -s ~/cenp_chip/mapping_without_dupes/bamCoverage/chip_HC_2.seq_depth_norm.bw chip_PTZ_2.seq_depth_norm.bw # corrected

# do we have coverages for inputs?
# not really, generate
