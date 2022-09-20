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






## tested and run till here, 20th Sept 2022

gse=GSE69806
mkdir -p "$WD"/"$gse"_caution_mm9_rmdup
cd $_

## the bamfiles with unusual names files H3.3 
## PRJNA286846

## annotation file (selected stuff) from Ana
## email from Sent: Monday, September 5, 2022 4:42 PM
cat << 'EOF' > ana_selected.txt
GSM1709155,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709155,2_hr_Control_1_H3_3_IP_ATCACG_L006_R1_001.fastq_rmdup
GSM1709156,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709156,2_hr_Control_2_H3_3_IP_TTAGGC_L006_R1_001.fastq_rmdup
GSM1709157,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709157,2_hr_Control_3_H3_3_IP_ACTTGA_L006_R1_001.fastq_rmdup
GSM1709158,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709158,2_hr_Control_Input_ATCACG_L008_R1_001.fastq_rmdup
GSM1709159,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709159,2_hr_KCl_1_H3_3_IP_ATCACG_L007_R1_001.fastq_rmdup
GSM1709160,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709160,2_hr_KCl_2_H3_3_IP_TTAGGC_L007_R1_001.fastq_rmdup
GSM1709161,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709161,2_hr_KCl_3_H3_3_IP_ACTTGA_L007_R1_001.fastq_rmdup
GSM1709162,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709162,2_hr_KCl_Input_TTAGGC_L008_R1_001.fastq_rmdup
GSM1709163,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709163,30_min_Control_1_H3_3_IP_ATCACG_L008_R1_001.fastq_rmdup
GSM1709164,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709164,30_min_Control_1_H3_3_IP_Repeat_ATCACG_L008_R1_001.fastq_rmdup
GSM1709165,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709165,30_min_Control_2_H3_3_IP_TTAGGC_L008_R1_001.fastq_rmdup
GSM1709166,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709166,30_min_Control_3_H3_3_IP_ACTTGA_L008_R1_001.fastq_rmdup
GSM1709167,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709167,30_min_Control_Input_ATCACG_L005_R1_001.fastq_rmdup
GSM1709168,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709168,30_min_KCl_1_H3_3_IP_ATCACG_L004_R1_001.fastq_rmdup
GSM1709169,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709169,30_min_KCl_2_H3_3_IP_TTAGGC_L004_R1_001.fastq_rmdup
GSM1709170,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709170,30_min_KCl_3_H3_3_IP_ACTTGA_L004_R1_001.fastq_rmdup
GSM1709171,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709171,30_min_KCl_Input_TTAGGC_L005_R1_001.fastq_rmdup
GSM1709172,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709172,AF1_H3_3_IP_Hipp_NeuN-_ATCACG_L001_R1_001.fastq_rmdup
GSM1709173,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709173,AF2_H3_3_IP_Hipp_NeuN-_TTAGGC_L001_R1_001.fastq_rmdup
GSM1709174,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709174,AF3_H3_3_IP_Hipp_NeuN-_ACTTGA_L001_R1_001.fastq_rmdup
GSM1709175,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709175,AF_Input_Hipp_NeuN-_ATCACG_L003_R1_001.fastq_rmdup
GSM1709176,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709176,C1_H3_1_2_ChIP_seq_NoIndex_L001_R1_001.bowtie.mono
GSM1709177,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709177,C1_H3.3_Ab_LB_NoIndex_L006_R1_001.bowtie.mono
GSM1709178,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709178,C2_H3.1_2_ChIP_seq_NoIndex_L006_R1_001.bowtie.mono
GSM1709179,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709179,C2_H3.3_Ab_LB_NoIndex_L007_R1_001.bowtie.mono
GSM1709180,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709180,C2_H3.3_Inp_LB_NoIndex_L002_R1_001.bowtie.mono
GSM1709181,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709181,C3_H3.1_2_ChIP_seq_NoIndex_L007_R1_001.bowtie.mono
GSM1709182,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709182,C3_H3.3_Ab_LB_NoIndex_L008_R1_001.bowtie.mono
GSM1709202,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709202,EE1_H3_3_Hipp_NeuN-_ATCACG_L002_R1_001.fastq_rmdup
GSM1709203,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709203,EE1_Input_ChIP_seq_NoIndex_L002_R1_001.bowtie.mono
GSM1709204,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709204,EE1_IP_ChIP_seq_NoIndex_L006_R1_001.bowtie.mono
GSM1709205,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709205,EE2_H3_3_Hipp_NeuN-_ACTTGA_L002_R1_001.fastq_rmdup
GSM1709206,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709206,EE3_H3_3_Hipp_NeuN-_TTAGGC_L002_R1_001.fastq_rmdup
GSM1709207,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709207,EE2_Input_ChIP_seq_NoIndex_L003_R1_001.bowtie.mono
GSM1709208,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709208,EE2_IP_ChIP_seq_NoIndex_L007_R1_001.bowtie.mono
GSM1709209,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709209,EE_Input_Hipp_NeuN-_TTAGGC_L003_R1_001.fastq_rmdup
GSM1709210,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709210,K1_H3_1_2_Chip_seq_NoIndex_L002_R1_001.bowtie.mono
GSM1709211,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709211,K1_H3.3_Ab_LB_NoIndex_L006_R1_001.bowtie.mono
GSM1709212,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709212,K2_H3.1_2_ChIP_seq_NoIndex_L008_R1_001.bowtie.mono
GSM1709213,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709213,K2_H3.3_Ab_LB_NoIndex_L007_R1_001.bowtie.mono
GSM1709214,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709214,K2_H3.3_Inp_LB_NoIndex_L003_R1_001.bowtie.mono
GSM1709215,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709215,K3_H3.1_2_ChIP_seq_NoIndex_L003_R1_001.bowtie.mono
GSM1709216,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709216,K3_H3.3_Ab_LB_NoIndex_L008_R1_001.bowtie.mono
GSM1709250,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709250,2_hr_Control_1_CGATGT_L005_R1_001
GSM1709251,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709251,2_hr_Control_2_TGACCA_L005_R1_001
GSM1709252,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709252,2_hr_Control_3_ACAGTG_L005_R1_001
GSM1709253,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709253,2_hr_KCl_1_CGATGT_L006_R1_001
GSM1709254,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709254,2_hr_KCl_2_TGACCA_L006_R1_001
GSM1709255,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709255,2_hr_KCl_3_ACAGTG_L006_R1_001
GSM1709256,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709256,30_min_Control_1_CGATGT_L003_R1_001
GSM1709257,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709257,30_min_Control_2_TGACCA_L003_R1_001
GSM1709258,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709258,30_min_Control_3_ACAGTG_L003_R1_001
GSM1709259,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709259,30_min_KCl_1_CGATGT_L004_R1_001
GSM1709260,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709260,30_min_KCl_2_TGACCA_L004_R1_001
GSM1709261,https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1709261,30_min_KCl_3_ACAGTG_L004_R1_001
EOF

grep rmdup ana_selected.txt | cut -f1 -d"," > ana_selected.rmdup

## full metadata from the bioproject
cat << 'EOF' > sra_metadata_h33.txt
Run,Assay Type,AssemblyName,AvgSpotLen,Bases,BioProject,BioSample,Bytes,Center Name,Consent,DATASTORE filetype,DATASTORE provider,DATASTORE region,developemental_stage,Experiment,GEO_Accession (exp),Instrument,LibraryLayout,LibrarySelection,LibrarySource,Organism,Platform,ReleaseDate,Sample Name,source_name,SRA Study,STRAIN,tissue/cell_type,Treatment,chip_antibody,chip_antibody_vendor
SRR2061073,ChIP-Seq,GCA_000001635.1,51,3707578977,PRJNA286846,SAMN03770985,1948490507,GEO,public,"bam,sra","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057012,GSM1709155,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709155,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 2 hr,H3.3,Millipore
SRR2061074,ChIP-Seq,GCA_000001635.1,51,5227176201,PRJNA286846,SAMN03770986,2775804675,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057013,GSM1709156,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709156,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 2 hr,H3.3,Millipore
SRR2061075,ChIP-Seq,GCA_000001635.1,51,3128432106,PRJNA286846,SAMN03770987,1627147232,GEO,public,"sra,bam","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057014,GSM1709157,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709157,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 2 hr,H3.3,Millipore
SRR2061076,ChIP-Seq,GCA_000001635.1,51,4503777615,PRJNA286846,SAMN03770988,2370796582,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057015,GSM1709158,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709158,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 2 hr,,
SRR2061077,ChIP-Seq,GCA_000001635.1,51,4035797637,PRJNA286846,SAMN03770989,2093295978,GEO,public,"sra,bam","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057016,GSM1709159,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709159,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 2 hr,H3.3,Millipore
SRR2061078,ChIP-Seq,GCA_000001635.1,51,5061402180,PRJNA286846,SAMN03770992,2632191223,GEO,public,"sra,bam","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057017,GSM1709160,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709160,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 2 hr,H3.3,Millipore
SRR2061079,ChIP-Seq,GCA_000001635.1,51,2534170110,PRJNA286846,SAMN03770993,1299091138,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057018,GSM1709161,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709161,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 2 hr,H3.3,Millipore
SRR2061080,ChIP-Seq,GCA_000001635.1,51,2551688967,PRJNA286846,SAMN03770994,1374506949,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057019,GSM1709162,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709162,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 2 hr,,
SRR2061081,ChIP-Seq,GCA_000001635.1,51,3439013640,PRJNA286846,SAMN03771044,1775911555,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057020,GSM1709163,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709163,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 30 min,H3.3,Millipore
SRR2061082,ChIP-Seq,GCA_000001635.1,51,1948338669,PRJNA286846,SAMN03771045,867831734,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057021,GSM1709164,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709164,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 30 min (repeat of #1),H3.3,Millipore
SRR2061083,ChIP-Seq,GCA_000001635.1,51,4618283274,PRJNA286846,SAMN03771046,2470056358,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057022,GSM1709165,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709165,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 30 min,H3.3,Millipore
SRR2061084,ChIP-Seq,GCA_000001635.1,51,3904712643,PRJNA286846,SAMN03771047,2066613549,GEO,public,"bam,sra","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057023,GSM1709166,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709166,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 30 min,H3.3,Millipore
SRR2061085,ChIP-Seq,GCA_000001635.1,51,5535091353,PRJNA286846,SAMN03770990,2830027750,GEO,public,"sra,bam","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057024,GSM1709167,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709167,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 30 min,,
SRR2061086,ChIP-Seq,GCA_000001635.1,51,4370685312,PRJNA286846,SAMN03770991,2234093047,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057025,GSM1709168,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709168,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 30 min,H3.3,Millipore
SRR2061087,ChIP-Seq,GCA_000001635.1,51,3769823100,PRJNA286846,SAMN03771048,1914391557,GEO,public,"bam,sra","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057026,GSM1709169,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709169,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 30 min,H3.3,Millipore
SRR2061088,ChIP-Seq,GCA_000001635.1,51,3337542204,PRJNA286846,SAMN03771049,1714650885,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057027,GSM1709170,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709170,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 30 min,H3.3,Millipore
SRR2061089,ChIP-Seq,GCA_000001635.1,51,2235389058,PRJNA286846,SAMN03771050,1114725077,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057028,GSM1709171,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709171,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 30 min,,
SRR2061090,ChIP-Seq,GCA_000001635.1,51,2067026634,PRJNA286846,SAMN03771051,959968806,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057029,GSM1709172,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709172,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Normally Housed,H3.3,Millipore
SRR2061091,ChIP-Seq,GCA_000001635.1,51,3105833649,PRJNA286846,SAMN03771052,1453102790,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057030,GSM1709173,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709173,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Normally Housed,H3.3,Millipore
SRR2061092,ChIP-Seq,GCA_000001635.1,51,2309073705,PRJNA286846,SAMN03771053,1062544600,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057031,GSM1709174,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709174,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Normally Housed,H3.3,Millipore
SRR2061093,ChIP-Seq,GCA_000001635.1,51,2385591657,PRJNA286846,SAMN03771054,1148650392,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057032,GSM1709175,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709175,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Normally Housed,,
SRR2061094,ChIP-Seq,GCA_000001635.1,51,10881269883,PRJNA286846,SAMN03771055,5927749743,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057033,GSM1709176,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709176,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,H3.1/2,Millipore
SRR2061095,ChIP-Seq,GCA_000001635.1,51,4084304604,PRJNA286846,SAMN03771056,1926634857,GEO,public,"sra,bam","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057034,GSM1709177,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709177,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,H3.3,Millipore
SRR2061096,ChIP-Seq,GCA_000001635.1,51,9547127070,PRJNA286846,SAMN03771057,4849973929,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057035,GSM1709178,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709178,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,H3.1/2,Millipore
SRR2061097,ChIP-Seq,GCA_000001635.1,51,4451666733,PRJNA286846,SAMN03771058,2054486484,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057036,GSM1709179,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709179,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,H3.3,Millipore
SRR2061098,ChIP-Seq,GCA_000001635.1,51,9214806837,PRJNA286846,SAMN03771059,4465051628,GEO,public,"sra,bam","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057037,GSM1709180,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709180,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,,
SRR2061099,ChIP-Seq,GCA_000001635.1,51,8489844642,PRJNA286846,SAMN03771060,4134564334,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057038,GSM1709181,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709181,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,H3.1/2,Millipore
SRR2061100,ChIP-Seq,GCA_000001635.1,51,4430392797,PRJNA286846,SAMN03771061,2044460224,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057039,GSM1709182,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709182,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,H3.3,Millipore
SRR2061101,ChIP-Seq,GCA_000001635.1,51,1842601032,PRJNA286846,SAMN03771062,798850573,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057040,GSM1709183,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709183,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,,
SRR2061102,ChIP-Seq,GCA_000001635.1,51,1586146359,PRJNA286846,SAMN03771063,819954894,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057041,GSM1709184,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709184,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,M280 streptavidin Dynabeads,Invitrogen
SRR2061103,ChIP-Seq,GCA_000001635.1,51,2687635791,PRJNA286846,SAMN03771064,1131851141,GEO,public,"sra,bam","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057042,GSM1709185,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709185,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,,
SRR2061104,ChIP-Seq,GCA_000001635.1,51,1646954169,PRJNA286846,SAMN03771065,839097405,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057043,GSM1709186,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709186,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,M280 streptavidin Dynabeads,Invitrogen
SRR2061105,ChIP-Seq,GCA_000001635.1,51,1622693316,PRJNA286846,SAMN03771066,718153834,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057044,GSM1709187,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709187,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,,
SRR2061106,ChIP-Seq,GCA_000001635.1,51,1922872125,PRJNA286846,SAMN03771067,990065361,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057045,GSM1709188,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709188,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,M280 streptavidin Dynabeads,Invitrogen
SRR2061107,ChIP-Seq,GCA_000001635.1,51,1113622179,PRJNA286846,SAMN03771068,514236035,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057046,GSM1709189,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709189,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,,
SRR2061108,ChIP-Seq,GCA_000001635.1,51,1749564537,PRJNA286846,SAMN03771069,789922350,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057047,GSM1709190,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709190,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,M280 streptavidin Dynabeads,Invitrogen
SRR2061109,ChIP-Seq,GCA_000001635.1,51,2595685443,PRJNA286846,SAMN03771070,1072528137,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057048,GSM1709191,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709191,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,,
SRR2061110,ChIP-Seq,GCA_000001635.1,51,3404240157,PRJNA286846,SAMN03771071,1521456551,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057049,GSM1709192,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709192,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,M280 streptavidin Dynabeads,Invitrogen
SRR2061111,ChIP-Seq,GCA_000001635.1,51,2322704934,PRJNA286846,SAMN03771072,988521912,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057050,GSM1709193,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709193,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,,
SRR2061112,ChIP-Seq,GCA_000001635.1,51,2135868066,PRJNA286846,SAMN03771073,946634248,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057051,GSM1709194,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709194,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,M280 streptavidin Dynabeads,Invitrogen
SRR2061113,ChIP-Seq,GCA_000001635.1,51,4045630896,PRJNA286846,SAMN03771014,2366744478,GEO,public,"bam,sra","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057052,GSM1709195,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709195,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,HA.11,Covance
SRR2061114,ChIP-Seq,GCA_000001635.1,51,3877342830,PRJNA286846,SAMN03771015,2160906994,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057053,GSM1709196,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709196,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,HA.11,Covance
SRR2061115,ChIP-Seq,GCA_000001635.1,51,7804679889,PRJNA286846,SAMN03771016,3533445185,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057054,GSM1709197,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709197,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,,
SRR2061116,ChIP-Seq,GCA_000001635.1,51,3614445786,PRJNA286846,SAMN03771017,1858754070,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057055,GSM1709198,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709198,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,Control (no stimulation) 5 hr,HA.11,Covance
SRR2061117,ChIP-Seq,GCA_000001635.1,51,6772028319,PRJNA286846,SAMN03771018,3575138501,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5,SRX1057056,GSM1709199,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709199,Embryonic Cortical NeuN+ Cells (E16.5),SRP059413,C57BL/6,Embryonic Cortical NeuN+ Cells,No treatment,,
SRR2061118,ChIP-Seq,GCA_000001635.1,51,1433202051,PRJNA286846,SAMN03771019,725515843,GEO,public,"bam,sra","s3,gs","gs.US,s3.us-east-1",E16.5,SRX1057057,GSM1709200,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709200,Embryonic Cortical NeuN+ Cells (E16.5),SRP059413,C57BL/6,Embryonic Cortical NeuN+ Cells,No treatment,H3.3,Millipore
SRR2061119,ChIP-Seq,GCA_000001635.1,51,1701315222,PRJNA286846,SAMN03771020,1017782302,GEO,public,"sra,bam","gs,s3","s3.us-east-1,gs.US",E16.5,SRX1057058,GSM1709201,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709201,Embryonic Cortical NeuN+ Cells (E16.5),SRP059413,C57BL/6,Embryonic Cortical NeuN+ Cells,No treatment,H3.3,Millipore
SRR2061120,ChIP-Seq,GCA_000001635.1,51,1783392174,PRJNA286846,SAMN03771021,845622737,GEO,public,"bam,sra","gs,s3","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057059,GSM1709202,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709202,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Environmental Enrichment,H3.3,Millipore
SRR2061121,ChIP-Seq,GCA_000001635.1,51,14561695338,PRJNA286846,SAMN03771022,7349307253,GEO,public,"sra,bam","s3,gs","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057060,GSM1709203,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709203,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Environmental Enrichment,,
SRR2061122,ChIP-Seq,GCA_000001635.1,51,9060329316,PRJNA286846,SAMN03771023,4280067019,GEO,public,"bam,sra","gs,s3","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057061,GSM1709204,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709204,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Environmental Enrichment,H3.3,Millipore
SRR2061123,ChIP-Seq,GCA_000001635.1,51,816980016,PRJNA286846,SAMN03771024,394477697,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057062,GSM1709205,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709205,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Environmental Enrichment,H3.3,Millipore
SRR2061124,ChIP-Seq,GCA_000001635.1,51,3924380079,PRJNA286846,SAMN03771025,1830455704,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057063,GSM1709206,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709206,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Environmental Enrichment,H3.3,Millipore
SRR2061125,ChIP-Seq,GCA_000001635.1,51,13971464739,PRJNA286846,SAMN03771026,7588934377,GEO,public,"bam,sra","s3,gs","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057064,GSM1709207,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709207,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Environmental Enrichment,,
SRR2061126,ChIP-Seq,GCA_000001635.1,51,9407062557,PRJNA286846,SAMN03771027,4541409273,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057065,GSM1709208,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709208,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Environmental Enrichment,H3.3,Millipore
SRR2061127,ChIP-Seq,GCA_000001635.1,51,5103206472,PRJNA286846,SAMN03771028,2469700602,GEO,public,"sra,bam","gs,s3","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057066,GSM1709209,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709209,Adult Hippocampal NeuN- Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN- Cells,Environmental Enrichment,,
SRR2061128,ChIP-Seq,GCA_000001635.1,51,11626548285,PRJNA286846,SAMN03771029,6297011700,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057067,GSM1709210,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709210,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,H3.1/2,Millipore
SRR2061129,ChIP-Seq,GCA_000001635.1,51,4591246185,PRJNA286846,SAMN03771030,2131843056,GEO,public,"sra,bam","s3,gs","gs.US,s3.us-east-1",E16.5 – DIV8,SRX1057068,GSM1709211,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709211,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,H3.3,Millipore
SRR2061130,ChIP-Seq,GCA_000001635.1,51,9199441251,PRJNA286846,SAMN03771031,4670453498,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057069,GSM1709212,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709212,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,H3.1/2,Millipore
SRR2061131,ChIP-Seq,GCA_000001635.1,51,4806809670,PRJNA286846,SAMN03771032,2140713541,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057070,GSM1709213,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709213,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,H3.3,Millipore
SRR2061132,ChIP-Seq,GCA_000001635.1,51,10231349598,PRJNA286846,SAMN03771033,4982682069,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057071,GSM1709214,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709214,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,,
SRR2061133,ChIP-Seq,GCA_000001635.1,51,9694896612,PRJNA286846,SAMN03771034,4862771293,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057072,GSM1709215,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709215,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,H3.1/2,Millipore
SRR2061134,ChIP-Seq,GCA_000001635.1,51,4491660831,PRJNA286846,SAMN03771035,1981637454,GEO,public,"sra,bam","gs,s3","s3.us-east-1,gs.US",E16.5 – DIV8,SRX1057073,GSM1709216,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709216,Primary Cortical Neurons (E16.5 – DIV8),SRP059413,C57BL/6,Primary Cortical Neurons,KCl 5 hr,H3.3,Millipore
SRR2061135,ChIP-Seq,GCA_000001635.1,51,14512209681,PRJNA286846,SAMN03771036,7621311344,GEO,public,"bam,sra","s3,gs","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057074,GSM1709217,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709217,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Normally Housed,,
SRR2061136,ChIP-Seq,GCA_000001635.1,51,7576789245,PRJNA286846,SAMN03771037,3735523760,GEO,public,"bam,sra","gs,s3","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057075,GSM1709218,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709218,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Normally Housed,H3.3,Millipore
SRR2061137,ChIP-Seq,GCA_000001635.1,51,14383442841,PRJNA286846,SAMN03771038,7585888328,GEO,public,"bam,sra","s3,gs","gs.US,s3.us-east-1",~7 weeks postnatal,SRX1057076,GSM1709219,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709219,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Normally Housed,,
SRR2061138,ChIP-Seq,GCA_000001635.1,51,9325133454,PRJNA286846,SAMN03771039,4690562001,GEO,public,"bam,sra","s3,gs","s3.us-east-1,gs.US",~7 weeks postnatal,SRX1057077,GSM1709220,Illumina HiSeq 2000,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2015-06-23T00:00:00Z,GSM1709220,Adult Hippocampal NeuN+ Cells (~7 weeks postnatal),SRP059413,C57BL/6,Adult Hippocampal NeuN+ Cells,Normally Housed,H3.3,Millipore
EOF

grep -f ana_selected.rmdup sra_metadata_h33.txt | cut -d"," -f1 > ana_selected.sras

while IFS= read -r srr
do
    echo "$srr download"
    
done < ana_selected.sras

## test raw download
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR2061073/SRR2061073
mv SRR2061073 SRR2061073.sra

~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/sam-dump SRR2061073.sra

~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/prefetch SRR2061073

# @PG     ID:Bowtie       VN:1.0.1        CL:"bowtie -p 4 -q -m 1 -v 3 --sam --best --strata /sc/orga/scratch/shenl03/genome/bowtie/mouse/mm9 -"
# 1       0       chr1    3000038 255     sam-dump quit with error code 3

# this crashes, let's try another one
~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/prefetch SRR2061074
~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/sam-dump SRR2061074.sra


# 2022-09-20T13:48:13 prefetch.2.11.1: 1) Downloading 'SRR2061074'...
# 2022-09-20T13:48:13 prefetch.2.11.1:  Downloading via HTTPS...
# 2022-09-20T13:49:47 prefetch.2.11.1:  HTTPS download succeed
# 2022-09-20T13:49:52 prefetch.2.11.1:  'SRR2061074' is valid
# 2022-09-20T13:49:52 prefetch.2.11.1: 1) 'SRR2061074' was downloaded successfully


# 2022-09-20T13:50:56 prefetch.2.11.1: 'SRR2061074' has 21 unresolved dependencies
# 2022-09-20T13:50:56 prefetch.2.11.1 int: connection unexpected while executing query within virtual file system module - cannot get remote location for 'NC_000067.5'


# forget about this, try the fastqs and map

# 2022-09-20T13:53:55 fastq-dump.2.11.1 warn: connection unexpected while executing query within virtual file system module - can't open NC_000067.5 as a RefSeq or as a WGS
# 2022-09-20T13:53:55 fastq-dump.2.11.1 err: connection unexpected while executing query within virtual file system module - failed SRR2061073
# 2022-09-20T13:53:55 fastq-dump.2.11.1 warn: no error - Protected repository is found and ignored.
# 2022-09-20T13:53:55 fastq-dump.2.11.1 warn: no error - Run 'vdb-config --ignore-protected-repositories' to disable this message.

~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/fastq-dump --split-files SRR2061073

# 2022-09-20T13:53:55 fastq-dump.2.11.1 warn: connection unexpected while executing query within virtual file system module - can't open NC_000067.5 as a RefSeq or as a WGS
# 2022-09-20T13:53:55 fastq-dump.2.11.1 err: connection unexpected while executing query within virtual file system module - failed SRR2061073
# 2022-09-20T13:53:55 fastq-dump.2.11.1 warn: no error - Protected repository is found and ignored.
# 2022-09-20T13:53:55 fastq-dump.2.11.1 warn: no error - Run 'vdb-config --ignore-protected-repositories' to disable this message.

# =============================================================
# An error occurred during processing.
# A report was generated into the file '/home/imallona/ncbi_error_report.txt'.
# If the problem persists, you may consider sending the file
# to 'sra-tools@ncbi.nlm.nih.gov' for assistance.
# =============================================================

# fastq-dump quit with error code 3

# https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR2061073


# https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR2061138&display=alignment

~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/sam-dump SRR2061138
# [imallona@imlsportmacquarie GSE69806_caution_mm9_rmdup]$ ~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/sam-dump SRR2061138
# 2022-09-20T14:03:36 sam-dump.2.11.1 warn: connection unexpected while executing query within virtual file system module - can't open NC_000076.5 as a RefSeq or as a WGS
# 2022-09-20T14:03:37 sam-dump.2.11.1 int: connection unexpected while executing query within virtual file system module - VCursorCellDataDirect( row#1 . idx#3 . READ ) char_ptr failed
# @HD     VN:1.0  SO:unsorted
# @SQ     SN:chr10        LN:129993255
# @SQ     SN:chr11        LN:121843856
# @SQ     SN:chr12        LN:121257530
# @SQ     SN:chr13        LN:120284312
# @SQ     SN:chr14        LN:125194864
# @SQ     SN:chr15        LN:103494974
# @SQ     SN:chr16        LN:98319150
# @SQ     SN:chr17        LN:95272651
# @SQ     SN:chr18        LN:90772031
# @SQ     SN:chr19        LN:61342430
# @SQ     SN:chr1 LN:197195432
# @SQ     SN:chr2 LN:181748087
# @SQ     SN:chr3 LN:159599783
# @SQ     SN:chr4 LN:155630120
# @SQ     SN:chr5 LN:152537259
# @SQ     SN:chr6 LN:149517037
# @SQ     SN:chr7 LN:152524553
# @SQ     SN:chr8 LN:131738871
# @SQ     SN:chr9 LN:124076172
# @SQ     SN:chrM LN:16299
# @SQ     SN:chrX LN:166650296
# @SQ     SN:chrY LN:15902555
# @RG     ID:default
# @PG     ID:Bowtie       VN:0.12.7       CL:"bowtie -v 3 -q -p 3 -a -m 1 -k 1 --best --strata -S /home/sdewell/bowtie-0.12.7/indexes/mm9 -"
# 1       16      chr10   3000082 255     sam-dump quit with error code 3

~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/vdb-dump --info  SRR2061138

# [imallona@imlsportmacquarie GSE69806_caution_mm9_rmdup]$ ~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/vdb-dump --info  SRR2061138
# acc    : SRR2061138
# path   : https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR2061138/SRR2061138
# size   : 4,690,569,373
# cache  : /home/imallona/ncbi/public/sra/SRR2061138.sra
# percent: 0.000000
# bytes  : 0
# type   : Database
# platf  : SRA_PLATFORM_UNDEFINED
# SEQ    : 182,845,754
# REF    : 530,992
# PRIM   : 88,227,325
# SCHEMA : NCBI:align:db:alignment_sorted#1.3
# TIME   : 0x00000000557aeb50 (06/12/2015 16:23)
# FMT    : BAM
# FMTVER : 2.5.1
# LDR    : bam-load.2.5.1
# LDRVER : 2.5.1
# LDRDATE: May 28 2015 (5/28/2015 0:0)
# BAMHDR : 697 bytes / 24 lines
# BAMHDR : 1 HD-lines
# BAMHDR : 22 SQ-lines

~/soft/sra-tools/sratoolkit.2.11.1-ubuntu64/bin/fasterq-dump  -p   -t .  -O .  SRR2061138
# GSE125068 they indeed contain nuRNA and ribo-seq


