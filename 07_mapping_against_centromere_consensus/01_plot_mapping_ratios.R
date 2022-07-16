#!/usr/bin/env/R

## /home/imallona/cenp_chip/nested_mapping/chip_PTZ_1_oligomerized/log
## ptz is activated

## /home/imallona/cenp_chip/nested_mapping/chip_HC_1_oligomerized/log
## hc is non activated

## (base) [imallona@imlsportmacquarie nested_mapping]$ cat chip_HC_1_oligomerized/log 
## 49536148 reads; of these:
##   49536148 (100.00%) were paired; of these:
##     20901161 (42.19%) aligned concordantly 0 times
##     2158899 (4.36%) aligned concordantly exactly 1 time
##     26476088 (53.45%) aligned concordantly >1 times
##     ----
##     20901161 pairs aligned concordantly 0 times; of these:
##       70647 (0.34%) aligned discordantly 1 time
##     ----
##     20830514 pairs aligned 0 times concordantly or discordantly; of these:
##       41661028 mates make up the pairs; of these:
##         40145751 (96.36%) aligned 0 times
##         85542 (0.21%) aligned exactly 1 time
##         1429735 (3.43%) aligned >1 times
## 59.48% overall alignment rate

## (base) [imallona@imlsportmacquarie nested_mapping]$ pwd
## /home/imallona/cenp_chip/nested_mapping
## (base) [imallona@imlsportmacquarie nested_mapping]$ cat chip_PTZ_1_oligomerized/log 
## 38482901 reads; of these:
##   38482901 (100.00%) were paired; of these:
##     12574558 (32.68%) aligned concordantly 0 times
##     1516054 (3.94%) aligned concordantly exactly 1 time
##     24392289 (63.38%) aligned concordantly >1 times
##     ----
##     12574558 pairs aligned concordantly 0 times; of these:
##       40479 (0.32%) aligned discordantly 1 time
##     ----
##     12534079 pairs aligned 0 times concordantly or discordantly; of these:
##       25068158 mates make up the pairs; of these:
##         23951712 (95.55%) aligned 0 times
##         40439 (0.16%) aligned exactly 1 time
##         1076007 (4.29%) aligned >1 times
## 68.88% overall alignment rate



## and when mapping the unmapped to the mouse genome we get

## [imallona@imlsportmacquarie ~]$ cat ~/cenp_chip/nested_mapping/chip_HC_1_oligomerized/nested/log 
## 46732949 reads; of these:
##   46732949 (100.00%) were paired; of these:
##     4425898 (9.47%) aligned concordantly 0 times
##     10236508 (21.90%) aligned concordantly exactly 1 time
##     32070543 (68.63%) aligned concordantly >1 times
##     ----
##     4425898 pairs aligned concordantly 0 times; of these:
##       555931 (12.56%) aligned discordantly 1 time
##     ----
##     3869967 pairs aligned 0 times concordantly or discordantly; of these:
##       7739934 mates make up the pairs; of these:
##         4533608 (58.57%) aligned 0 times
##         804859 (10.40%) aligned exactly 1 time
##         2401467 (31.03%) aligned >1 times
## 95.15% overall alignment rate


## [imallona@imlsportmacquarie ~]$ cat ~/cenp_chip/nested_mapping/chip_PTZ_1_oligomerized/nested/log 
## 36223550 reads; of these:
##   36223550 (100.00%) were paired; of these:
##     3038662 (8.39%) aligned concordantly 0 times
##     5027738 (13.88%) aligned concordantly exactly 1 time
##     28157150 (77.73%) aligned concordantly >1 times
##     ----
##     3038662 pairs aligned concordantly 0 times; of these:
##       276156 (9.09%) aligned discordantly 1 time
##     ----
##     2762506 pairs aligned 0 times concordantly or discordantly; of these:
##       5525012 mates make up the pairs; of these:
##         3469993 (62.81%) aligned 0 times
##         384549 (6.96%) aligned exactly 1 time
##         1670470 (30.23%) aligned >1 times
## 95.21% overall alignment rate


fd <- data.frame(centromeric =       c(49536148 * 0.5948,
                                       36223550 * 0.6888),
                 `non-centromeric` = c(49536148 * (1- 0.5948) * 0.9515,
                                       36223550 * (1-0.6888) * 0.9521))

rownames(fd) <- c('Non-activated', 'Activated')

pt <- prop.table(as.matrix(fd), margin = 1)
pt


pdf('/home/imallona/src/astankovic_cenp_chip/07_mapping_against_centromere_consensus/centromeric_piechart.pdf',
    width = 16, height = 7)
par(mfrow = c(1,2))
      
pie(as.numeric(pt['Non-activated',]), labels = colnames(pt),
    col=c( '#847996','#A7CAB1',    '#88B7B5', '#F4ECD6' ),
    main = 'Non-activated')
      
pie(as.numeric(pt['Activated',]), labels = colnames(pt),
    col=c( '#847996','#A7CAB1',    '#88B7B5', '#F4ECD6' ),
    main = 'Activated')

dev.off()
