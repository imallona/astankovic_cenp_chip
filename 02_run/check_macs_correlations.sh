#!/bin/bash
##
## Correlates Scott's peaks and the current run (with/without duplicates)
##

WD=/home/imallona/cenp_chip/
BEDTOOLS=~/soft/bedtools/bedtools-2.29.2/bin/bedtools

scott_hc="$WD"/scott/Scott_HC__peaks.xls
scott_ptz="$WD"/scott/Scott_PTZ__peaks.xls

## mind that these are original sample names, and the sample swap has not been corrected!
##  (except for matching the right input to it, see conditions_sample_swap.conf)

ptz2_without="$WD"/mapping_without_dupes/MACS2/chip_PTZ_2.filtered.BAM_peaks.narrowPeak
ptz1_without="$WD"/home/imallona/cenp_chip/mapping_without_dupes/MACS2/chip_PTZ_2.filtered.BAM_peaks.narrowPeak
hc2_without="$WD"/home/imallona/cenp_chip/mapping_without_dupes/MACS2/chip_HC_2.filtered.BAM_peaks.narrowPeak
hc1_without="$WD"/home/imallona/cenp_chip/mapping_without_dupes/MACS2/chip_HC_2.filtered.BAM_peaks.narrowPeak

ptz2_with="$WD"/home/imallona/cenp_chip/mapping_with_dupes/MACS2/chip_PTZ_2.filtered.BAM_peaks.narrowPeak
ptz1_with="$WD"/home/imallona/cenp_chip/mapping_with_dupes/MACS2/chip_PTZ_2.filtered.BAM_peaks.narrowPeak
hc2_with="$WD"/home/imallona/cenp_chip/mapping_with_dupes/MACS2/chip_HC_2.filtered.BAM_peaks.narrowPeak
hc1_with="$WD"/home/imallona/cenp_chip/mapping_with_dupes/MACS2/chip_HC_2.filtered.BAM_peaks.narrowPeak


cd "$WD"/scott

mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -e \
	"select chrom, size from mm10.chromInfo" > mm10.genome


# create 100 bp windows, and then multintersect 
~/soft/bedtools/bedtools-2.29.2/bin/bedtools makewindows  -w 100 -g mm10.genome > windows.bed

for status in with without
do
    for id in HC_1 HC_2 PTZ_1 PTZ_2
    do
        ln -s "$WD"/mapping_"$status"_dupes/MACS2/chip_"$id".filtered.BAM_peaks.narrowPeak \
           "$id"_"$status".bed
    done
done

ln -s Scott_HC__peaks.xls scott_hc.bed
ln -s Scott_PTZ__peaks.xls scott_ptz.bed

for bed in $(find . -name "*bed")
do
    grep chr $bed | $BEDTOOLS intersect -c -a windows.bed -b - > "$bed".windowed
    gzip "$bed.windowed"
done
