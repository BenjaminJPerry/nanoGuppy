# Nanopore Guppy Base Calling Slurm Scripts

1. Take the complete output directory from nanopore run and move to `nesi/nobackup/[agresearch#####/project]`.

2. guppy v6.0.1 base calling and trimming on NeSI with slurm (see `guppy.6.0.1.template.sl`).  
`guppy_basecaller \`  
`-i /nesi/nobackup/agresearch03174/[sequencer ouput run directory] \`  
`-s /nesi/nobackup/agresearch03174/[output directory] \`  
`--config /opt/nesi/CS400_centos7_bdw/ont-guppy-gpu/6.0.1/data/[correct guppy model].cfg \`  
`--device auto \`  
`--recursive \`  
`--records_per_fastq 0 \` # Meant to put all reads in a single fastq file, does not.  
`--compress_fastq \`  
`--min_qscore 7 \`  
`--barcode_kits [barcoding kit eg."EXP-PBC096"] \`  
`--trim_barcodes \`  
`--trim_primers \`  
`--trim_strategy dna \`  
`--detect_mid_strand_adapter \`  
`--do_read_splitting`  
