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

## batch 1, replicate 1
cat << EOF > data/url1.conf
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/IP_HC.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/IP_PTZ.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/Input_HC.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_51439_NOV494_o23103_Mouse_2020-11-06--18-05-13/Input_PTZ.bam
EOF

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

batch 2, replicate2

cat << EOF > data/url4.conf
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-1_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-1_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-2_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-2_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-3_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-3_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-4_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-4_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-5_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-5_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-6_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-6_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-7_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-7_Sample_R2.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-8_Sample_R1.fastq.gz
https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103/20201030.B-8_Sample_R2.fastq.gz
EOF

cd "$WD"/data

cat url1.conf url4.conf | wget --user imallona -e robots=off --ask-password --no-parent -nH \
                               -i -

## then, bam2fastq (some of these datasets don't have fastqs available at FCGZ - we're on it)
## mind that mapping, hence, shouldn't include adaptor cutting or qual trimming (was already done)

mkdir fq
for bam in $(find "$WD"/data -maxdepth 1 -name "*bam")
do
    curr=$(basename "$bam" .bam)
    samtools sort -@ "$NTHREADS" -n -o "$curr"_sorted.bam "$curr".bam
    mv -f "$curr"_sorted.bam fq/"$curr".bam
    ~/soft/bedtools/bedtools-2.29.2/bin/bedtools bamtofastq -i fq/"$curr".bam \
                                                 -fq fq/"$curr"_R1.fq \
                                                 -fq2 fq/"$curr"_R2.fq &> fq/"$curr"_bam2fq.log
    pigz -p "$NTHREADS" fq/"$curr"*fq
    rm fq/"$curr".bam
done

## for other datasets with real fastqs, just rename

mv 20201030.B-1_Sample_R1.fastq.gz 1-HC_Input_rep_2_R1.fq.gz
mv 20201030.B-2_Sample_R1.fastq.gz 2-PTZ_Input_rep_2_R1.fq.gz
mv 20201030.B-3_Sample_R1.fastq.gz 3-HC_Chip_rep_2_R1.fq.gz
mv 20201030.B-4_Sample_R1.fastq.gz 4-PTZ_Chip_rep_2_R1.fq.gz
mv 20201030.B-5_Sample_R1.fastq.gz 5-HC_Input_rep_3_R1.fq.gz
mv 20201030.B-6_Sample_R1.fastq.gz 6-PTZ_Input_rep_3_R1.fq.gz
mv 20201030.B-7_Sample_R1.fastq.gz 7-HC_Chip_rep_3_R1.fq.gz
mv 20201030.B-8_Sample_R1.fastq.gz 8-PTZ_Chip_rep_3_R1.fq.gz

mv 20201030.B-1_Sample_R2.fastq.gz 1-HC_Input_rep_2_R2.fq.gz
mv 20201030.B-2_Sample_R2.fastq.gz 2-PTZ_Input_rep_2_R2.fq.gz
mv 20201030.B-3_Sample_R2.fastq.gz 3-HC_Chip_rep_2_R2.fq.gz
mv 20201030.B-4_Sample_R2.fastq.gz 4-PTZ_Chip_rep_2_R2.fq.gz
mv 20201030.B-5_Sample_R2.fastq.gz 5-HC_Input_rep_3_R2.fq.gz
mv 20201030.B-6_Sample_R2.fastq.gz 6-PTZ_Input_rep_3_R2.fq.gz
mv 20201030.B-7_Sample_R2.fastq.gz 7-HC_Chip_rep_3_R2.fq.gz
mv 20201030.B-8_Sample_R2.fastq.gz 8-PTZ_Chip_rep_3_R2.fq.gz

mv *fq.gz "$WD"/data/fq
