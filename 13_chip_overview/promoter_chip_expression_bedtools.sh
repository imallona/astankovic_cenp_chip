#!/bin/bash
#
## Counts how many CENP reads are within each edgeR-quantified gene promoter, considering as a promoter
##   the (-2000, 0) from the uppermost gene boundary
##
## 3rd March 2023
WD=~/tmp/ana
mkdir -p $WD
cd $WD

mkdir -p bed
ARMOR=/home/imallona/cenp_chip/public/GSE125068/in_house_armor_mm10
COVS=/home/imallona/cenp_chip/merged_replicates/
BEDTOOLS=~/soft/bedtools/bedtools-2.29.2/bin/bedtools

# sort -k1,1 -k2,2n bed/genes.bed > sorted
# mv sorted bed/genes.bed

# for edge in edgeR_dge_results_treatmenttreated_1h-treatmentcontrol_edge.bed \
#                 edgeR_dge_results_treatmenttreated_48h-treatmenttreated_6h_edge.bed \
#                 edgeR_dge_results_treatmenttreated_6h-treatmenttreated_1h_edge.bed
# do

#     echo "$edge"
#     edge=bed/"$edge"

#     ## keeping the logFC column, plus sorting
#     awk '{OFS=FS="\t"; print $1,$2,$3,$9,$10}' "$edge" | sort -k1,1 -k2,2n > narrower
#     # mv narrower "$edge"

#     mkdir -p closest
#     $BEDTOOLS closest -D a \
#               -a bed/genes.bed \
#               -b narrower \
#               -t first -d > closest/$(basename "$edge" .bed).gene.closest

#     rm narrower
    
# done

mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -e \
      "select chrom, size from hg38.chromInfo" | tail -n+2  > hg38.genome


for edge in edgeR_dge_results_treatmenttreated_1h-treatmentcontrol.txt \
                edgeR_dge_results_treatmenttreated_48h-treatmenttreated_6h.txt \
                edgeR_dge_results_treatmenttreated_6h-treatmenttreated_1h.txt
do

    echo "$edge"
    edge_full="$ARMOR"/"$edge"

    ## keeping the logFC column, plus sorting
    awk '{OFS=FS="\t"; print $1,$2,$3,$9,$10,$5}' "$edge_full" | tail -n+2 | sort -k1,1 -k2,2n > narrower
    # mv narrower "$edge"

    ## get promoters
    $BEDTOOLS flank -s -i narrower -g hg38.genome -l 2000 -r 0 | sort -k1,1 -k2,2n > "$edge"_prom.bed 

    rm narrower

done


## check the sample swaps!!

for prom in edgeR_dge_results_treatmenttreated_1h-treatmentcontrol.txt_prom.bed \
                edgeR_dge_results_treatmenttreated_48h-treatmenttreated_6h.txt_prom.bed \
                edgeR_dge_results_treatmenttreated_6h-treatmenttreated_1h.txt_prom.bed
do

    for chip in chip_HC_2_3_cov_bga.bedgraph.gz \
                chip_HC_1_cov_bga.bedgraph.gz \
                chip_PTZ_2_3_cov_bga.bedgraph.gz \
                chip_PTZ_1_cov_bga.bedgraph.gz 
    do

        echo "$chip"
        chip=$COVS/"$chip"

        ## keeping the logFC column, plus sorting
        zcat "$chip" | grep -P "chr[0-9XY]{1,2}" | sort -k1,1 -k2,2n > chipsorted

        curr=$(basename "$prom" .txt_prom.bed)__$(basename $chip _cov_bga.bedgraph.gz)
        ## intersect and then merge summing the counts
        ## the sed 's/\./0/g' is to get rid of '.' NULL features from the log
        ## the mean,mean for columns 4 and 5 is to report back the original logFC/logCPM as well, there is
        ##  no actual aggregation
        ## beware scores (logFCs and logCPMs) are scaled to per 1000s!
        $BEDTOOLS intersect -a "$prom" \
                  -b chipsorted \
                  -loj | sed 's/\./0/g' | $BEDTOOLS merge -c 4,5,10,10,10 -o mean,mean,sum,mean,median | \
            awk '{OFS=FS="\t"; print $1,$2,$3,$4/1000,$5/1000,$6,$7,$8}' > "$curr".txt

        rm chipsorted
        
    done
    
done
