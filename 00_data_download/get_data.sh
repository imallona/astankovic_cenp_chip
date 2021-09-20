#!/bin/bash
##
## A Stankovic's ChiP-seq retrieval (BAMs, bowtie2, mm38)
##
## Izaskun Mallona
## 16 sept 2021

WD='/home/imallona/cenp_chip'

NTHREADS=20

mkdir -p "$WD"
cd "$_"

mkdir data

# ## batch 1, replicate 1
# cat << EOF > data/url1.conf
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/IP_HC.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/IP_PTZ.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/Input_HC.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/Input_PTZ.bam
# EOF

# ## batch 2, replicate 2
# cat << EOF > data/url2.conf
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/1-HC_Input_rep_2.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/2-PTZ_Input_rep_2.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/3-HC_Chip_rep_2.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/4-PTZ_Chip_rep_2.bam
# EOF

# ## batch 2, replicate 3
# cat << EOF > data/url3.conf
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/5-HC_Input_rep_3.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/6-PTZ_Input_rep_3.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/7-HC_Chip_rep_3.bam
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/8-PTZ_Chip_rep_3.bam
# EOF

# batch 2, replicate2

# cat << EOF > data/url4.conf
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-1_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-1_Sample_R2.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-2_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-2_Sample_R2.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-3_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-3_Sample_R2.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-4_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-4_Sample_R2.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-5_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-5_Sample_R2.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-6_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-6_Sample_R2.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-7_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-7_Sample_R2.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-8_Sample_R1.fastq.gz
# https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-8_Sample_R2.fastq.gz
# EOF

## sample origins are very weird, let's try again
# this is the last release, fastqs and named https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/

cat << EOF > data/first_batch.conf
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_1-A1_InputHC_3_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_1-A1_InputHC_3_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_2-A2_InputPTZ_3_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_2-A2_InputPTZ_3_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_3-A3_ChipHC_3_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_3-A3_ChipHC_3_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_4-A4_ChipPTZ_3_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_4-A4_ChipPTZ_3_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_5-B1_InputHC_2_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_5-B1_InputHC_2_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_6-B2_InputPTZ_2_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_6-B2_InputPTZ_2_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_7-B3_ChipHC_2_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_7-B3_ChipHC_2_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_8-B4_ChipPTZ_2_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873/20210910.A-o25873_1_8-B4_ChipPTZ_2_R2.fastq.gz
EOF

## this is the old release, which according to
# https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/input_dataset.tsv
## are
# Input_HC	p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-1_Sample_R1.fastq.gz
# Input_PTZ	p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-2_Sample_R1.fastq.gz
# IP_HC	p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-3_Sample_R1.fastq.gz
# IP_PTZ	p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-4_Sample_R1.fastq.gz

cat << EOF > data/second_batch.conf
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-1_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-1_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-2_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-2_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-3_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-3_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-4_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-4_Sample_R2.fastq.gz
EOF

cd "$WD"/data

cat first_batch.conf second_batch.conf | wget --user imallona -e robots=off --ask-password --no-parent -nH \
                               -i -

## then, bam2fastq (some of these datasets don't have fastqs available at FCGZ - we're on it)
## mind that mapping, hence, shouldn't include adaptor cutting or qual trimming (was already done)

# mkdir fq
# for bam in $(find "$WD"/data -maxdepth 1 -name "*bam")
# do
#     curr=$(basename "$bam" .bam)
#     samtools sort -@ "$NTHREADS" -n -o "$curr"_sorted.bam "$curr".bam
#     mv -f "$curr"_sorted.bam fq/"$curr".bam
#     ~/soft/bedtools/bedtools-2.29.2/bin/bedtools bamtofastq -i fq/"$curr".bam \
#                                                  -fq fq/"$curr"_R1.fq \
#                                                  -fq2 fq/"$curr"_R2.fq &> fq/"$curr"_bam2fq.log
#     pigz -p "$NTHREADS" fq/"$curr"*fq
#     rm fq/"$curr".bam
# done

mkdir -p $WD/data/fq
cd $_

ln -s ../20201030.B-1_Sample_R1.fastq.gz input_HC_1_R1.fastq.gz
ln -s ../20201030.B-2_Sample_R1.fastq.gz input_PTZ_1_R1.fastq.gz
ln -s ../20201030.B-3_Sample_R1.fastq.gz chip_HC_1_R1.fastq.gz
ln -s ../20201030.B-4_Sample_R1.fastq.gz chip_PTZ_1_R1.fastq.gz

ln -s ../20201030.B-1_Sample_R2.fastq.gz input_HC_1_R2.fastq.gz
ln -s ../20201030.B-2_Sample_R2.fastq.gz input_PTZ_1_R2.fastq.gz
ln -s ../20201030.B-3_Sample_R2.fastq.gz chip_HC_1_R2.fastq.gz
ln -s ../20201030.B-4_Sample_R2.fastq.gz chip_PTZ_1_R2.fastq.gz


ln -s ../20210910.A-o25873_1_1-A1_InputHC_3_R1.fastq.gz input_HC_3_R1.fastq.gz
ln -s ../20210910.A-o25873_1_1-A1_InputHC_3_R2.fastq.gz input_HC_3_R2.fastq.gz
ln -s ../20210910.A-o25873_1_2-A2_InputPTZ_3_R1.fastq.gz input_PTZ_3_R1.fastq.gz
ln -s ../20210910.A-o25873_1_2-A2_InputPTZ_3_R2.fastq.gz input_PTZ_3_R2.fastq.gz
ln -s ../20210910.A-o25873_1_3-A3_ChipHC_3_R1.fastq.gz chip_HC_3_R1.fastq.gz
ln -s ../20210910.A-o25873_1_3-A3_ChipHC_3_R2.fastq.gz chip_HC_3_R2.fastq.gz
ln -s ../20210910.A-o25873_1_4-A4_ChipPTZ_3_R1.fastq.gz chip_PTZ_3_R1.fastq.gz
ln -s ../20210910.A-o25873_1_4-A4_ChipPTZ_3_R2.fastq.gz chip_PTZ_3_R2.fastq.gz

ln -s ../20210910.A-o25873_1_5-B1_InputHC_2_R1.fastq.gz input_HC_2_R1.fastq.gz
ln -s ../20210910.A-o25873_1_5-B1_InputHC_2_R2.fastq.gz input_HC_2_R2.fastq.gz
ln -s ../20210910.A-o25873_1_6-B2_InputPTZ_2_R1.fastq.gz input_PTZ_2_R1.fastq.gz
ln -s ../20210910.A-o25873_1_6-B2_InputPTZ_2_R2.fastq.gz input_PTZ_2_R2.fastq.gz
ln -s ../20210910.A-o25873_1_7-B3_ChipHC_2_R1.fastq.gz chip_HC_2_R1.fastq.gz
ln -s ../20210910.A-o25873_1_7-B3_ChipHC_2_R2.fastq.gz chip_HC_2_R2.fastq.gz
ln -s ../20210910.A-o25873_1_8-B4_ChipPTZ_2_R1.fastq.gz chip_PTZ_2_R1.fastq.gz
ln -s ../20210910.A-o25873_1_8-B4_ChipPTZ_2_R2.fastq.gz chip_PTZ_2_R2.fastq.gz

