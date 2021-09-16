#!/bin/bash
##
## A Stankovic's ChiP-seq retrieval (BAMs, bowtie2, mm38)
##
## Izaskun Mallona
## 16 sept 2021

WD='/home/imallona/cenp_chip'
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

## batch 2, replicate 2
cat << EOF > data/url2.conf
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/1-HC_Input_rep_2.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/2-PTZ_Input_rep_2.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/3-HC_Chip_rep_2.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/4-PTZ_Chip_rep_2.bam
EOF

## batch 2, replicate 3
cat << EOF > data/url3.conf
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/5-HC_Input_rep_3.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/6-PTZ_Input_rep_3.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/7-HC_Chip_rep_3.bam
https://fgcz-gstore.uzh.ch/projects/p3664/Bowtie2_59014_o23972_o25127_2021-07-05--12-24-31/8-PTZ_Chip_rep_3.bam
EOF

cd "$WD"/data

cat url*conf | wget --user imallona -e robots=off --ask-password --no-parent -nH \
                    -i -
