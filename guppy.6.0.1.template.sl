#!/bin/bash -e

#SBATCH --account=agresearch03174
#SBATCH --job-name=nanoBees[name]
#SBATCH --time=08:00:00 # Walltime (HH:MM:SS)
#SBATCH --partition=gpu
##SBATCH --gres=gpu:1
#SBATCH --gpus-per-node=A100:1
#SBATCH --mem=40G
#SBATCH --cpus-per-task=4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ben.perry@agresearch.co.nz

module load ont-guppy-gpu/6.0.1

guppy_basecaller \
-i /nesi/nobackup/agresearch03174/[sequencer ouput run directory] \
-s /nesi/nobackup/agresearch03174/[output directory] \
--config /opt/nesi/CS400_centos7_bdw/ont-guppy-gpu/6.0.1/data/[correct guppy model].cfg \
--device auto \
--recursive \
--records_per_fastq 0 \ # Meant to put all fastq in 1 file, but does not... Put each fastq in a different file...
--compress_fastq \
--min_qscore 7 \
--barcode_kits [barcoding kit eg."EXP-PBC096"] \
--trim_barcodes \
--trim_primers \
--trim_strategy dna \
--detect_mid_strand_adapter \
--do_read_splitting \
#--verbose_logs
