## Aim

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada enim at pulvinar placerat. Pellentesque pharetra, lacus sit amet lobortis interdum, magna massa accumsan justo, ac fringilla felis orci ac mi. Cras aliquam turpis id consequat pharetra. Sed commodo, ex in porttitor rutrum, ipsum ipsum vehicula sapien, quis pharetra orci justo in sem. Mauris ac viverra orci. 

## Methods

Curabitur non nisl nulla. Aliquam a turpis mauris. Nunc ac fermentum sapien. Phasellus feugiat sagittis lorem vitae congue. Nunc et leo in neque commodo vehicula vel sit amet elit. Cras finibus purus sed luctus dignissim. Quisque tortor nibh, scelerisque id blandit nec, dignissim vel neque. Proin at leo id eros lacinia bibendum. Donec sollicitudin nec felis eu lobortis.

## Data origins

FASTQ files

- https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20210910_NOV918_o25873
- https://fgcz-gstore.uzh.ch/projects/p3664/NovaSeq_20201030_NOV494_o23103

## Repository structure

- `00_data_download`
- `01_create_configs` for snakePipes
- `02_run` similarly, mapping and ChIP processing
- `data/eigs.txt`, immediate early genes (some to be checked only at the promoter level (?))

## TODO

- [x] Retrieve data
- [x] Set-up Snakepipes
- [r] Mapping, QC samples, clustering, inputs
- [] ChiP norm, peak calling
- [] QC signal, controls centromeres and cFos surroundings
- [] Evaluate csaw outputs, shall centromeres be filtered out?
- [] Motif detection

## Started

Izaskun Mallona
Thu Sep 16 14:14:20 CEST 2021
