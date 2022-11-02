#!/bin/bash
##
## linking some cenp-expressing bamfiles to somewhere, to browse via igv
##
## 19 oct 2022

mkdir -p /home/imallona/cells_for_cenp_inspection

cd $_

mkdir prolif neurons

cd neurons

## neurons
for cell in  Ascl1_d4_plate1_A16 \
           Ascl1_d4_plate1_N17 \
           Gli1_12wk_20180822BJ_J12 \
           Gli1_12wk_20180822BJ_B22 \
           Ascl1_5d_II_20190403BJ_G06 \
           Ascl1_5d_II_20190403BJ_G16 \
           Ascl1_5d_II_20190403BJ_M12 \
           Ascl1_12wk_2_20190514BJ_F09 \
           Ascl1_12wk_2_20190514BJ_G09 \
           Ascl1_d4_plate1_O22 
do

    
    fullpath=$(find /home/Shared_s3it/imallona/baptiste_jaeger/02_velocyto_mapping/star -name "$cell*bam" -print -quit)
    ln -s $fullpath .

done

cd ../prolif

# prolif
for cell in  X20190219_Gli1_5d_J02  \
                 Ascl1_d4_plate1_C04 \
                 Ascl1_d4_plate1_C09 \
                 Ascl1_d4_plate1_D14 \
                 Ascl1_d4_plate1_E07 \
                 Ascl1_d4_plate1_G11 \
                 Ascl1_d4_plate1_G18 \
                 Ascl1_d4_plate1_H09 \
                 Ascl1_d4_plate1_H11 \
                 Ascl1_d4_plate1_I12 \
                 Ascl1_d4_plate1_J01 \
                 Ascl1_d4_plate1_M04 \
                 Ascl1_d4_plate1_M15 \
                 Ascl1_d4_plate1_N01 \
                 Ascl1_d4_plate1_N03 \
                 Ascl1_d4_plate1_N12 \
                 Ascl1_d4_plate1_P06 \
                 Ascl1_d4_plate1_P14 \
                 Ascl1_d4_plate1_P17 \
                 Ascl1_5d_II_20190403BJ_B05 \
                 Ascl1_5d_II_20190403BJ_B12 \
                 Ascl1_5d_II_20190403BJ_D02 \
                 Ascl1_5d_II_20190403BJ_E14 \
                 Ascl1_5d_II_20190403BJ_E19 \
                 Ascl1_5d_II_20190403BJ_G09 \
                 Ascl1_5d_II_20190403BJ_H04 \
                 Ascl1_5d_II_20190403BJ_I06 \
                 Ascl1_5d_II_20190403BJ_K19 \
                 Ascl1_5d_II_20190403BJ_L01 \
                 Ascl1_5d_II_20190403BJ_M16 \
                 Ascl1_5d_II_20190403BJ_N09 \
                 Ascl1_5d_II_20190403BJ_N12 \
                 Ascl1_5d_II_20190403BJ_O12 \
                 Ascl1_5d_II_20190403BJ_P05 \
                 Ascl1_12wk_A23 \
                 Ascl1_12wk_2_20190514BJ_A20 \
                 Ascl1_12wk_2_20190514BJ_G11 \
                 Ascl1_12wk_2_20190514BJ_I22 \
                 Ascl1_12wk_2_20190514BJ_J16 \
                 Ascl1_12wk_2_20190514BJ_L03 \
                 Ascl1_12wk_2_20190514BJ_L17 \
                 Gli1_20180503BJ_Plate_I_E20 \
                 Gli1_20180503BJ_Plate_I_E22 \
                 X20190219_Gli1_5d_F01 \
                 X20190219_Gli1_5d_G04 \
                 X20190219_Gli1_5d_H09 \
                 X20190219_Gli1_5d_K20 \
                 Gli1_12wk_20180822BJ_B10 \
                 Gli1_12wk_20180822BJ_G17 \
                 Gli1_12wk_20180822BJ_H14 \
                 Gli1_12wk_20180822BJ_H20 \
                 Ascl1_d4_plate1_O05
do

        fullpath=$(find /home/Shared_s3it/imallona/baptiste_jaeger/02_velocyto_mapping/star -name "$cell*bam" -print -quit)
    ln -s $fullpath .  
done


## forgot to index

cd ../neurons
for fullpath in $(find . -name "*bam")
do
    echo $fullpath
    
    samtools index -@ 30 $(basename $fullpath)
done

cd ../prolif

for fullpath in $(find . -name "*bam")
do
    echo $fullpath
    
    samtools index -@ 30 $(basename $fullpath)
done
