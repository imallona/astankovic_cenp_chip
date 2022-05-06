#!/bin/bash
##
##
## Izaskun Mallona
## 
## 6th May 2021

WD='/home/imallona/cenp_chip/public'

# general chromatin start

gse='GSE21161'
echo $gse ###############################################################
# Query DataSets for GSE21161
# Status	Public on Apr 15, 2010
# Title	Widespread transcription at neuronal activity-regulated enhancers

mkdir -p "$WD"/"$gse"; cd $_

wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE21161&format=file' \
     --output-document "$gse"_RAW.tar

tar xvf "$gse"_RAW.tar

gse='GSE52386'
echo $gse ###############################################################
# Series GSE52386		Query DataSets for GSE52386
# Status	Public on Dec 19, 2013
# Title	Rapid and Pervasive Changes in Genome-Wide Enhancer Usage During Mammalian Development


mkdir -p "$WD"/"$gse"; cd $_

wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE52386&format=file' \
     --output-document "$gse"_RAW.tar

tar xvf "$gse"_RAW.tar

# gse='GSE60049'
# echo $gse ###############################################################
# skipped, all CEL files

# # Query DataSets for GSE60049
# # Status	Public on Sep 07, 2014
# # Title	Gene expression data from cultured mouse cortical (mCTX) neurons in different stimulation and knockdown conditions
# # Organism	Mus musculus


# mkdir -p "$WD"/"$gse"; cd $_
# wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE60049&format=file' \
#      --output-document "$gse"_RAW.tar

# tar xvf "$gse"_RAW.tar

gse='GSE60192'
echo $gse ###############################################################
# Status	Public on Sep 07, 2014
# Title	Genome-wide identification and characterization of functional neuronal activity-dependent enhancers

mkdir -p "$WD"/"$gse"; cd $_
wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE60192&format=file'

tar xvf "$gse"_RAW.tar

# general chromatin end


# dna meth start
gse='GSE30493'

echo $gse ###############################################################
# Status	Public on Sep 01, 2011
# Title	ECS-induced gene expression changes in mouse dentate gyrus
## others are CEL files... went for a summarized-by-gene processed file

mkdir -p "$WD"/"$gse"; cd $_

wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE30493&format=file&file=GSE30493%5Fgene%5Flevel%5Faveraged%5Fdata%2Etxt%2Egz'

# dna meth end

# rna polii start

gse='GSE21161'

# wait, we've download that before - skip

gse='GSE93011'
echo $gse ###############################################################
# Query DataSets for GSE93011
# Status	Public on Jul 12, 2017
# Title	Dynamics of RNA polymerase II pausing and bivalent histone H3 methylation during neuronal differentiation in brain development


mkdir -p "$WD"/"$gse"; cd $_

wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE93011&format=file' --output-document "$gse"_RAW.tar

tar xvf "$gse"_RAW.tar

# find . -type f -not -name "PolII" -delete ## better interactive!

# rna polii end

# dna damage start
# GSE61887 - no idea what the files are? can we make sense of the naming? which are for damage?

# dna damage end

# atac start
gse='GSE82015'
echo $gse ###############################################################

# Query DataSets for GSE82015
# Status	Public on Jan 08, 2017
# Title	Neuronal activity modifies the chromatin accessibility landscape in the adult brain
mkdir -p "$WD"/"$gse"; cd $_

wget 'https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE82015&format=file' --output-document "$gse"_RAW.tar

tar xvf "$gse"_RAW.tar

# atac end
