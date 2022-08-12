#!/bin/bash
##
## Merge reps 2 and 3; get coverage by windows for downstream processing with genomation
##
## 11th Aug 2022

WD=/home/imallona/cenp_chip/merged_replicates
DATA=/home/imallona/cenp_chip/mapping_without_dupes

find $DATA/Bowtie2 -name "*bam"

mkdir -p $WD
cd $WD

/opt/anaconda/bin/activate

samtools merge \
         chip_HC_2_3.bam \
         /home/imallona/cenp_chip/mapping_without_dupes/Bowtie2/chip_HC_2.bam \
         /home/imallona/cenp_chip/mapping_without_dupes/Bowtie2/chip_HC_3.bam

samtools merge -@ 20 \
         chip_PTZ_2_3.bam \
         /home/imallona/cenp_chip/mapping_without_dupes/Bowtie2/chip_PTZ_2.bam \
         /home/imallona/cenp_chip/mapping_without_dupes/Bowtie2/chip_PTZ_3.bam


ln -s /home/imallona/cenp_chip/mapping_without_dupes/Bowtie2/chip_HC_1.bam .
ln -s /home/imallona/cenp_chip/mapping_without_dupes/Bowtie2/chip_PTZ_1.bam .


for fn in $(find . -name "*bam")
do
    echo $fn
    curr=$(basename $fn .bam)
    echo $curr

    ~/soft/bedtools/bedtools-2.29.2/bin/bedtools genomecov -bga -ibam "$fn" \
        | gzip -c > "$curr"_cov_bga.bedgraph.gz

    ## what about keeping the strand, and checking promoters only?

    ~/soft/bedtools/bedtools-2.29.2/bin/bedtools genomecov -bga \
                                                 -ibam "$fn" -strand + | \
        awk '{OFS=FS="\t"; print $1,$2,$3,".",$4,"+"}' | gzip -c > "$curr"_cov_bga_strand_plus.bedgraph.gz.tmp

    ~/soft/bedtools/bedtools-2.29.2/bin/bedtools genomecov -bga \
                                                 -ibam "$fn" -strand - | \
        awk '{OFS=FS="\t"; print $1,$2,$3,".",$4,"-"}' | gzip -c > "$curr"_cov_bga_strand_minus.bedgraph.gz.tmp

    cat "$curr"_cov_bga_strand_plus.bedgraph.gz.tmp \
        "$curr"_cov_bga_strand_minus.bedgraph.gz.tmp > "$curr"_cov_bga_by_strand.bedgraph.gz

    rm *tmp 
done
