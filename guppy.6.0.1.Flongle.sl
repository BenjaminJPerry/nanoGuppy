#!/bin/bash -e

#SBATCH --account=agresearch03174
#SBATCH --job-name=nanoBeesFlongle
#SBATCH --time=08:00:00 # Walltime (HH:MM:SS)
#SBATCH --partition=gpu
##SBATCH --gres=gpu:1
#SBATCH --gpus-per-node=A100:1
#SBATCH --mem=40G
#SBATCH --cpus-per-task=4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ben.perry@agresearch.co.nz

# move data to correct location
# cp -r /nesi/project/agresearch03174/Bees/raw_data/Bee_csd_plt1_FLG/no_sample/20201028_0258_MN31995_AEZ732_d4038022  /nesi/nobackup/agresearch03174/Bees/20201028_0258_MN31995_AEZ732_d4038022

module load ont-guppy-gpu/6.0.1

guppy_basecaller \
-i /nesi/nobackup/agresearch03174/Bees/20201028_0258_MN31995_AEZ732_d4038022 \
-s /nesi/nobackup/agresearch03174/Bees/220304_Flongle_guppy_v601_r941_450bps_sup \
--config /opt/nesi/CS400_centos7_bdw/ont-guppy-gpu/6.0.1/data/dna_r9.4.1_450bps_sup.cfg \
--device auto \
--recursive \
--records_per_fastq 0 \
--compress_fastq \
--min_qscore 7 \
--barcode_kits "EXP-PBC096" \
--trim_barcodes \
--trim_primers \
--trim_strategy dna \
--detect_mid_strand_adapter \
--do_read_splitting \
#--verbose_logs
