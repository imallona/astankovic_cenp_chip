#!/bin/bash

# cat ~/cenp_chip/mapping_without_dupes/Bowtie2/chip_HC_1.Bowtie2_summary.txt
# 49536148 reads; of these:
#   49536148 (100.00%) were paired; of these:
#     3938241 (7.95%) aligned concordantly 0 times
#     10121088 (20.43%) aligned concordantly exactly 1 time
#     35476819 (71.62%) aligned concordantly >1 times               <-------------------
#     ----
#     3938241 pairs aligned concordantly 0 times; of these:
#       541762 (13.76%) aligned discordantly 1 time
#     ----
#     3396479 pairs aligned 0 times concordantly or discordantly; of these:
#       6792958 mates make up the pairs; of these:
#         3306387 (48.67%) aligned 0 times
#         820680 (12.08%) aligned exactly 1 time
#         2665891 (39.24%) aligned >1 times
# 96.66% overall alignment rate


WD=/home/imallona/cenp_chip/nested_mapping
TRIMMED=/home/imallona/cenp_chip/mapping_without_dupes/FASTQ_TrimGalore/
NUM_THREADS=80

mkdir -p $WD
cd $WD

ln -s /home/imallona/src/astankovic_cenp_chip/07_mapping_against_centromere_consensus/centromeres.fasta

echo index

source /opt/anaconda/bin/activate



bowtie2-build  centromeres.fasta centromeres

# mapping against the centromeres
for run in chip_HC_1 chip_PTZ_1
do
    R1="$TRIMMED"/"$run"_R1.fastq.gz
    R2="$TRIMMED"/"$run"_R2.fastq.gz
    
    mkdir -p $WD/"$run"
    cd $WD/"$run"

    nice -n 19 bowtie2 \
         -q \
         -x "$WD"/centromeres \
         -1 $R1 \
         -2 $R2 \
         -p $NUM_THREADS \
         --fast \
         --un-gz "$run"_unaligned_un.fq.gz \
         --un-conc-gz "$run"_unaligned_conc.fq.gz | samtools view -bS - > "$run".bam | tee "$run"_bowtie.log

done





## the alignment rates are very low,r epeat with the manually oligomerized seqs



cd $WD
ln -s ~/src/astankovic_cenp_chip/07_mapping_against_centromere_consensus/centromeres_oligomerized.fasta

bowtie2-build  centromeres_oligomerized.fasta centromeres_oligomerized

# mapping against the centromeres
for run in  chip_HC_1 chip_PTZ_1
do
    R1="$TRIMMED"/"$run"_R1.fastq.gz
    R2="$TRIMMED"/"$run"_R2.fastq.gz
    
    mkdir -p $WD/"$run"_oligomerized
    cd $WD/"$run"_oligomerized

    (nice -n 19 bowtie2 \
         -k 2 \
         -q \
         -x "$WD"/centromeres_oligomerized \
         -1 $R1 \
         -2 $R2 \
         -p $NUM_THREADS \
         --fast \
         --un-gz "$run"_unaligned_un.fq.gz \
         --un-conc-gz "$run"_unaligned_conc.fq.gz | samtools view -bS - > "$run".bam)  2> "$run"_bowtie.log

done






# now map the unaligned against the genome

# mapping against the centromeres
for run in chip_HC_1 chip_PTZ_1
do
    R1="$WD"/"$run"/"$run"_unaligned_conc.fq.1.gz
    R2="$WD"/"$run"/"$run"_unaligned_conc.fq.2.gz
    
    mkdir -p $WD/"$run"_oligomerized/nested
    cd $WD/"$run"_oligomerized/nested

    nice -n 19 bowtie2 \
         -k 2 \
         -q \
         -x ~/cenp_chip/indices/GRCm38_gencode_release19/BowtieIndex/genome \
         -1 $R1 \
         -2 $R2 \
         -p $NUM_THREADS \
         --fast | samtools view -bS - 1> "$run".bam  2> "$run"_bowtie.log

done



## do the same for other datasets, including inputs (to rule out a sample swap;
## 4th Aug 2022



WD=/home/imallona/cenp_chip/nested_mapping
TRIMMED=/home/imallona/cenp_chip/mapping_without_dupes/FASTQ_TrimGalore/
NUM_THREADS=20

cd $WD

# mapping against the oligomerized centromeres, rest of the samples
for run in chip_HC_1 chip_PTZ_1 \
                     chip_HC_2 chip_PTZ_2 \
                     chip_HC_3 chip_PTZ_3 \
                     input_HC_1 input_PTZ_1 \
                     input_HC_2 input_PTZ_2 \
                     input_HC_3 input_PTZ_3 
do
    R1="$TRIMMED"/"$run"_R1.fastq.gz
    R2="$TRIMMED"/"$run"_R2.fastq.gz
    
    mkdir -p $WD/"$run"_oligomerized
    cd $WD/"$run"_oligomerized

    (nice -n 19 bowtie2 \
         -k 2 \
         -q \
         -x "$WD"/centromeres_oligomerized \
         -1 $R1 \
         -2 $R2 \
         -p $NUM_THREADS \
         --fast \
         --un-gz "$run"_unaligned_un.fq.gz \
         --un-conc-gz "$run"_unaligned_conc.fq.gz | samtools view -bS - > "$run".bam)  2>  "$run"_bowtie.log

done
