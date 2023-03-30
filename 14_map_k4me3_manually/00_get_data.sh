#!/bin/bash
##
## Retrieves fastqs for K4me3/to be mapped to mm10
##
## 30th March 2023
##
##
## GSE85873

# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE85873

SOFT="/home/imallona/soft/"
FASTQDUMP="$SOFT"/sra-tools/sratoolkit.3.0.0-ubuntu64/bin/fastq-dump # fastq-dump : 3.0.0
PREFETCH="$SOFT"/sra-tools/sratoolkit.3.0.0-ubuntu64/bin/prefetch # fastq-dump : 3.0.0
VDBVALIDATE="$SOFT"/sra-tools/sratoolkit.3.0.0-ubuntu64/bin/vdb-validate # fastq-dump : 3.0.0

WD=/home/imallona/cenp_chip/public/k4me3
mkdir -p $WD/fastqs
cd $_


cat<< EOF > meta.txt
Run,Age,Antibody,Assay Type,AvgSpotLen,Bases,BioProject,BioSample,Bytes,Center Name,Consent,DATASTORE filetype,DATASTORE provider,DATASTORE region,Experiment,Genotype,GEO_Accession (exp),Instrument,LibraryLayout,LibrarySelection,LibrarySource,Organism,Platform,ReleaseDate,create_date,version,Sample Name,sex,source_name,SRA Study,Strain,TREATMENT
SRR4045612,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1610594850,PRJNA339615,SAMN05601144,867594749,GEO,public,"run.zq,sra,fastq","s3,ncbi,gs","gs.US,s3.us-east-1,ncbi.public",SRX2036491,Wild-type,GSM2286402,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:53:00Z,1,GSM2286402,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),NA
SRR4045613,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1741736700,PRJNA339615,SAMN05601143,937653152,GEO,public,"fastq,run.zq,sra","s3,ncbi,gs","ncbi.public,gs.US,s3.us-east-1",SRX2036492,Wild-type,GSM2286403,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:52:00Z,1,GSM2286403,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),NA
SRR4045614,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1758023500,PRJNA339615,SAMN05601142,967618315,GEO,public,"run.zq,fastq,sra","gs,s3,ncbi","ncbi.public,gs.US,s3.us-east-1",SRX2036493,mutant (KO Kdm5c),GSM2286404,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:51:00Z,1,GSM2286404,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),NA
SRR4045615,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1850077500,PRJNA339615,SAMN05601141,993800949,GEO,public,"sra,run.zq,fastq","gs,ncbi,s3","gs.US,s3.us-east-1,ncbi.public",SRX2036494,mutant (KO Kdm5c),GSM2286405,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:52:00Z,1,GSM2286405,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),NA
SRR4045616,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1683232300,PRJNA339615,SAMN05601140,901221283,GEO,public,"run.zq,fastq,sra","s3,gs,ncbi","s3.us-east-1,ncbi.public,gs.US",SRX2036495,Wild-type,GSM2286406,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:52:00Z,1,GSM2286406,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),novel environment exploration (1h)
SRR4045617,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,2144543950,PRJNA339615,SAMN05601139,1146698675,GEO,public,"fastq,sra,run.zq","s3,gs,ncbi","s3.us-east-1,ncbi.public,gs.US",SRX2036496,Wild-type,GSM2286407,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:52:00Z,1,GSM2286407,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),novel environment exploration (1h)
SRR4045618,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,2234962700,PRJNA339615,SAMN05601138,1200777971,GEO,public,"run.zq,sra,fastq","s3,gs,ncbi","ncbi.public,s3.us-east-1,gs.US",SRX2036497,mutant (KO Kdm5c),GSM2286408,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:53:00Z,1,GSM2286408,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),novel environment exploration (1h)
SRR4045619,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1774254650,PRJNA339615,SAMN05601137,950549132,GEO,public,"run.zq,sra,fastq","gs,s3,ncbi","gs.US,s3.us-east-1,ncbi.public",SRX2036498,mutant (KO Kdm5c),GSM2286409,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:52:00Z,1,GSM2286409,male,hipocampal tissue from adult mice,SRP082450,mixed genetic background (F1: C57/129),novel environment exploration (1h)
SRR4045620,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1840838700,PRJNA339615,SAMN05601136,966819313,GEO,public,"run.zq,sra,fastq","s3,ncbi,gs","s3.us-east-1,gs.US,ncbi.public",SRX2036499,control,GSM2286410,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:52:00Z,1,GSM2286410,male,hipocampal tissue from adult mice,SRP082450,pure C57BL/6J background,NA
SRR4045621,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,2224376550,PRJNA339615,SAMN05601147,1167912664,GEO,public,"fastq,sra,run.zq","s3,ncbi,gs","gs.US,ncbi.public,s3.us-east-1",SRX2036500,control,GSM2286411,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:53:00Z,1,GSM2286411,male,hipocampal tissue from adult mice,SRP082450,pure C57BL/6J background,NA
SRR4045622,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,2216691900,PRJNA339615,SAMN05601146,1160714657,GEO,public,"run.zq,sra,fastq","gs,s3,ncbi","ncbi.public,gs.US,s3.us-east-1",SRX2036501,mutant (ifKO Kdm5c),GSM2286412,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:53:00Z,1,GSM2286412,male,hipocampal tissue from adult mice,SRP082450,pure C57BL/6J background,NA
SRR4045623,Adult mice (2-4-month-old),anti-H3K4me3 (Millipore #07-473),ChIP-Seq,50,1633636850,PRJNA339615,SAMN05601145,858419230,GEO,public,"sra,fastq,run.zq","ncbi,gs,s3","ncbi.public,gs.US,s3.us-east-1",SRX2036502,mutant (ifKO Kdm5c),GSM2286413,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2016-08-20T13:54:00Z,1,GSM2286413,male,hipocampal tissue from adult mice,SRP082450,pure C57BL/6J background,NA
SRR5922779,Adult mice (2-4-month-old),"H3K4me1 (Abcam\, #ab8895)",ChIP-Seq,50,2446206150,PRJNA339615,SAMN07488245,1275893567,GEO,public,"fastq,run.zq","s3,ncbi,gs","ncbi.public,s3.us-east-1,gs.US",SRX3083356,mutant (KO Kdm5c),GSM2738351,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2017-08-09T19:36:00Z,1,GSM2738351,male,hipocampal tissue from adult mice,SRP082450,pure C57BL/6J background,
SRR5922780,Adult mice (2-4-month-old),"Kdm5C (Iwase et al.\, 2016)",ChIP-Seq,50,2441671250,PRJNA339615,SAMN07488244,1285062773,GEO,public,"sra,run.zq,fastq","gs,ncbi,s3","gs.US,s3.us-east-1,ncbi.public",SRX3083357,Wild-type,GSM2738352,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2017-08-09T19:40:00Z,1,GSM2738352,male,hipocampal tissue from adult mice,SRP082450,pure C57BL/6J background,
SRR5922781,Adult mice (2-4-month-old),"Kdm5C (Iwase et al.\, 2016)",ChIP-Seq,50,2296490700,PRJNA339615,SAMN07488243,1206919053,GEO,public,"run.zq,sra,fastq","ncbi,s3,gs","ncbi.public,s3.us-east-1,gs.US",SRX3083358,mutant (KO Kdm5c),GSM2738353,Illumina HiSeq 2500,SINGLE,ChIP,GENOMIC,Mus musculus,ILLUMINA,2017-08-18T00:00:00Z,2017-08-09T19:35:00Z,1,GSM2738353,male,hipocampal tissue from adult mice,SRP082450,pure C57BL/6J background,
EOF

grep K4me3 meta.txt  | grep Wild-type > selected.txt

while IFS= read -r line
do
    srr=$(echo $line| cut -f1 -d',')
    
    "$PREFETCH" $srr --output-file "$srr".sra &> \
                "$srr"_prefetch.log
    
    $VDBVALIDATE "$srr".sra &> "$srr"_vdbvalidation.log
    
    $FASTQDUMP  --gzip --split-files  "$srr".sra

    
done < selected.txt
