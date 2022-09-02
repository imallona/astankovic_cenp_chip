#!/bin/bash
##
## Izaskun Mallona
##
## 30 Aug 2022

WD='/home/imallona/cenp_chip/public'
cd $WD

# Series GSE125068		Query DataSets for GSE125068
# Status	Public on Sep 03, 2019
# Title	Immediate and deferred epigenomic signatures of in vivo neuronal activation in mouse hippocampus

# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE125068

# Actually they have tarfiles with bws I think


gse='GSE125068' # mm10
echo $gse ###############################################################
# Query DataSets for GSE21161
# Status        Public on Apr 15, 2010
# Title Widespread transcription at neuronal activity-regulated enhancers

mkdir -p "$WD"/"$gse"; cd $_

wget "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE125nnn/GSE125068/suppl/GSE125068_ATACseq.tar.gz" 
wget "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE125nnn/GSE125068/suppl/GSE125068_ChIPseq.tar.gz"

tar xzvf GSE125068_ATACseq.tar.gz
tar xzvf GSE125068_ChIPseq.tar.gz

rm *tar.gz

ls -1
# ATAC_DMSO2h_Sal.bw
# ATAC_FOSminus_NE1h.bw
# ATAC_FOSplus_NE1h.bw
# ATAC_KA1h.bw
# ATAC_KA48h.bw
# ATAC_KA6h.bw
# ATAC_Sal.bw 
# ATAC_TPL2h_KA1h.bw
# ATAC_TPL2h_Sal.bw
# ChIP_CBP_KA1h.bw
# ChIP_CBP_Sal.bw
# ChIP_H3K27ac_Sal.bw
# ChIP_Pol2_KA1h.bw
# ChIP_Pol2_Sal.bw

rm ATAC_DMSO2h_Sal.bw ATAC_FOSminus_NE1h.bw ATAC_FOSplus_NE1h.bw \
   ATAC_KA48h.bw ATAC_KA6h.bw

ls -1
# ATAC_KA1h.bw # yes
# ATAC_Sal.bw # yes
# ATAC_TPL2h_KA1h.bw
# ATAC_TPL2h_Sal.bw
# ChIP_CBP_KA1h.bw # yes
# ChIP_CBP_Sal.bw # yes
# ChIP_H3K27ac_Sal.bw   # I'll keeep this, even if Ana didn't request it
# ChIP_Pol2_KA1h.bw # yes
# ChIP_Pol2_Sal.bw #es

rm ATAC_TPL2h_KA1h.bw ATAC_TPL2h_Sal.bw

ls -1
# ATAC_KA1h.bw
# ATAC_Sal.bw
# ChIP_CBP_KA1h.bw
# ChIP_CBP_Sal.bw
# ChIP_H3K27ac_Sal.bw
# ChIP_Pol2_KA1h.bw
# ChIP_Pol2_Sal.bw


#####
cd $WD

gse=GSE85873 # mm10
mkdir -p $gse ; cd $gse

## these are going to be peaks and not bws

wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE85873&format=file' --output-document "$gse"_RAW.tar

tar xvf "$gse"_RAW.tar
rm "$gse"_RAW.tar

ls -1
# GSM2286402_wt_HC_1_13292_ATCACG.txt.gz # keep
# GSM2286403_wt_HC_2_13293_CGATGT.txt.gz #keep 
# GSM2286404_KO_HC_1_13294_TTAGGC.txt.gz
# GSM2286405_KO_HC_2_13295_TGACCA.txt.gz
# GSM2286406_wt_NE_1_13296_ACAGTG.txt.gz # keep
# GSM2286407_wt_NE_2_13297_GCCAAT.txt.gz # keep
# GSM2286408_KO_NE_1_13298_CAGATC.txt.gz
# GSM2286409_KO_NE_2_13299_ACTTGA.txt.gz
# GSM2286410_wt_1_13300_GATCAG.txt.gz
# GSM2286411_wt_2_13301_TAGCTT.txt.gz
# GSM2286412_ifKO_1_13302_GGCTAC.txt.gz
# GSM2286413_ifKO_2_13303_CTTGTA.txt.gz
# GSM2738350_H3K4me1_WT_19072_AGTTCC.txt.gz # keep
# GSM2738351_H3K4me1_KO_19073_GAGTGG.txt.gz
# GSM2738352_Kdm5c_WT_19070_CTTGTA.txt.gz
# GSM2738353_Kdm5c_KO_19071_GTGAAA.txt.gz

rm GSM2286404_KO_HC_1_13294_TTAGGC.txt.gz \
   GSM2286405_KO_HC_2_13295_TGACCA.txt.gz \
   GSM2286408_KO_NE_1_13298_CAGATC.txt.gz \
   GSM2286409_KO_NE_2_13299_ACTTGA.txt.gz \
   GSM2286410_wt_1_13300_GATCAG.txt.gz \
   GSM2286411_wt_2_13301_TAGCTT.txt.gz \
   GSM2286412_ifKO_1_13302_GGCTAC.txt.gz \
   GSM2286413_ifKO_2_13303_CTTGTA.txt.gz \
   GSM2738351_H3K4me1_KO_19073_GAGTGG.txt.gz \
   GSM2738352_Kdm5c_WT_19070_CTTGTA.txt.gz \
   GSM2738353_Kdm5c_KO_19071_GTGAAA.txt.gz

ls -1
# GSM2286402_wt_HC_1_13292_ATCACG.txt.gz
# GSM2286403_wt_HC_2_13293_CGATGT.txt.gz
# GSM2286406_wt_NE_1_13296_ACAGTG.txt.gz
# GSM2286407_wt_NE_2_13297_GCCAAT.txt.gz
# GSM2738350_H3K4me1_WT_19072_AGTTCC.txt.gz



## another study with KCl activation
cd $WD

gse=GSE21161 ## mm9

mkdir -p $gse; cd $gse

## it indeed exists/downloaded previously, are all required data there?

mkdir -p keep
mv GSM530185_CREB_SC_un_B1_E120.bw keep
mv *CREB*bw keep
mv *SRF*bw keep

cd $WD

mv $gse "$gse"_caution_mm9_all
mv "$gse"_caution_mm9_all/keep "$gse"_caution_mm9


mv "$gse"
# https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE21161&format=file



# study on H1  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5800798/
## no data on geo nor array express


# another study on KCl

gse=GSE69806 # this is also mm9
# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE69806


mkdir -p "$WD"/"$gse"_caution_mm9
cd $_

wget 'https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_diff.H3.1_2.w200.fc3.txt.gz'

wget 'https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_diff.H3.3.2hr.w200.fc3.txt.gz'

# too small
# wget 'https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_diff.H3.3.Ab.w200.f.txt.gz'

wget 'https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_diff.H3.3.30min.w200.fc3.txt.gz'

wget 'https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_diff.H3.3.Astro.w200.fc3.txt.gz'

wget 'https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_diff.catch-it.dup6.seprep.w200.normByLib.fc3.txt.gz'

# rather, download the counts around TSS

wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_Mus_musculus.NCBIM37.62.tss1k.gid.Cortex_H3_3_IP.cnt.gz

wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE69nnn/GSE69806/suppl/GSE69806_Mus_musculus.NCBIM37.62.tss1k.gid.HA.cnt.gz
