#!/bin/bash
source activate LTR_retrieve
export PATH=/public1/home/sc30797/kevin/software/genometools-install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_Finder-master/source/:$PATH
export PATH=/public1/home/sc30797/kevin/software/blast+/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/hmmer-3.3.2/install/bin/:$PATH
export PATH=/public1/home/sc30797/kevin/software/LTR_retriever-master/:$PATH

pbhifiasm=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/Mo17.p_ctg.sort.forward.fa
pbcanu=/public1/home/sc30797/wangzijian/update_Mo17/00_assembly/canu2/01_anchor/Mo17.contigs.sort.forward.fa

RepeatMasker   -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/final_repeat.lib.fasta -gff   -dir HifiasmSort ${pbhifiasm}
sed 1,3d HifiasmSort/Mo17.p_ctg.sort.forward.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' - > HifiasmSort/Mo17.p_ctg.sort.forward.fa.raw.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl \
	HifiasmSort/Mo17.p_ctg.sort.forward.fa.raw.bed \
	HifiasmSort/Mo17.p_ctg.sort.forward.fa.for_draw.bed \
	HifiasmSort/Mo17.p_ctg.sort.forward.fa.for_draw.hl
RepeatMasker   -pa 64 -no_is  -lib /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/hifiasm2/01_anchor/final_repeat.lib.fasta -gff   -dir CanuSort ${pbcanu}
sed 1,3d HifiasmSort/Mo17.p_ctg.sort.forward.fa.out | awk '{print $5"\t"$6"\t"$7"\t"$10"\t"$11}' - > CanuSort/Mo17.contigs.sort.forward.fa.raw.bed
perl /public1/home/sc30797/wangzijian/scripts/read_extend_contig/extract_type_local_rDNA.pl \
	CanuSort/Mo17.contigs.sort.forward.fa.raw.bed \
	CanuSort/Mo17.contigs.sort.forward.fa.for_draw.bed \
	CanuSort/Mo17.contigs.sort.forward.fa.for_draw.hl


cat HifiasmSort/Mo17.p_ctg.sort.forward.fa.for_draw.hl \
 CanuSort/Mo17.contigs.sort.forward.fa.for_draw.hl \
 /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/07_show_readDepth_Ab_region/changed_name_Mo17_ont_origin_asm.for_draw.hl \
 > three_asm.hl