#Project Lecture - Prokka code: Genome Annotation -> we will not find anything at the species level because we already know that we are working with an unknown SGB -> a process of taxonomy association was already done
#For each FASTA file, that contains the contigs, we do prokka

conda activate prokka

prokka --help

bunzip2 *bz2

for mag in $(ls *.fn*a);
do
prokka --kingdom Bacteria --outdir SGB15132_prokka_output/${mag//.f*} --prefix ${mag} ${mag};
done

# Annotations:
#  --kingdom [X]     Annotation mode: Archaea|Bacteria|Mitochondria|Viruses (default 'Bacteria') -> to have a faster annotation

#All the MAGs have been annotated, for each we created several outputs files:
#(1) .fna file -> complete nucleotide FASTA file
#(2) .faa file -> protein FASTA file -> contains the amminoacids of the encoded proteins -> We have multiples protein ID because from the genome we can translate more than one protein -> ID of the proteins
#(3) .tsv file -> table summary -> tab-separated file of all the features of protein_loci -> with a description -> functional annotation
#(4) .txt file -> summary containing statistics relating to the annotated features found such as the number of contigs, the number of CDS, the number of rRNA and tRNA and the number of bases.
#(5) .gbk file -> standard genome bank file -> we have more info like db_xref (=linking DNA sequence records to other external databases), etc
#(6) .gff -> contains both the sequences and their annotations. It can be viewed directly in Artemis or IGV -> most important file -> this is the file we are going to use with roary.

#How many CDS (coding sequences) were found in one of your MAGs?
cat ${sample_name}.txt
#To look at all the values in all the files -> grep -w 'CDS' */*.txt -> minimum value of CDS is 2651
#CDS: protein coding sequence (CDS) region of each gene. CDS is a sequence of nucleotides that corresponds with the sequence of amino acids in a protein

#RESULTS:
ChengpingW_2017__AS103raw__bin.22/ChengpingW_2017__AS103raw__bin.22.fa.txt:CDS: 2651
ChengpingW_2017__AS126raw__bin.3/ChengpingW_2017__AS126raw__bin.3.fa.txt:CDS: 3111
ChengpingW_2017__AS71raw__bin.22/ChengpingW_2017__AS71raw__bin.22.fa.txt:CDS: 3136
ChuDM_2017__NCS-037-Stool-infant_microbiome__bin.9/ChuDM_2017__NCS-037-Stool-infant_microbiome__bin.9.fna.txt:CDS: 3272
FengQ_2015__SID531403__bin.23/FengQ_2015__SID531403__bin.23.fa.txt:CDS: 2970
LiJ_2014__V1.CD3-0-PN__bin.12/LiJ_2014__V1.CD3-0-PN__bin.12.fa.txt:CDS: 3093
LiJ_2014__V1.CD37-4__bin.8/LiJ_2014__V1.CD37-4__bin.8.fa.txt:CDS: 3676
LiJ_2014__V1.FI13__bin.53/LiJ_2014__V1.FI13__bin.53.fa.txt:CDS: 3644
LiJ_2014__V1.FI23__bin.8/LiJ_2014__V1.FI23__bin.8.fa.txt:CDS: 3347
LiJ_2017__H1M413822__bin.2/LiJ_2017__H1M413822__bin.2.fa.txt:CDS: 2935
LiJ_2017__H2M414927__bin.27/LiJ_2017__H2M414927__bin.27.fa.txt:CDS: 3045
LiJ_2017__H2M514906__bin.6/LiJ_2017__H2M514906__bin.6.fa.txt:CDS: 3407
LiJ_2017__H2M514930__bin.15/LiJ_2017__H2M514930__bin.15.fa.txt:CDS: 2820
LiJ_2017__H3M419939__bin.30/LiJ_2017__H3M419939__bin.30.fa.txt:CDS: 3354
LiJ_2017__H3M513141__bin.21/LiJ_2017__H3M513141__bin.21.fa.txt:CDS: 3013
LiJ_2017__H3M516909__bin.13/LiJ_2017__H3M516909__bin.13.fa.txt:CDS: 2712
LiuW_2016__SRR3993021__bin.12/LiuW_2016__SRR3993021__bin.12.fa.txt:CDS: 3360
QinN_2014__LD-31__bin.16/QinN_2014__LD-31__bin.16.fa.txt:CDS: 3268
ShaoY_2019__b3f12016-7ae6-11e9-a106-68b59976a384__bin.13/ShaoY_2019__b3f12016-7ae6-11e9-a106-68b59976a384__bin.13.fna.txt:CDS: 3197
ShaoY_2019__bac71bf2-7ae6-11e9-a106-68b59976a384__bin.5/ShaoY_2019__bac71bf2-7ae6-11e9-a106-68b59976a384__bin.5.fna.txt:CDS: 3084
ShaoY_2019__bd927b56-7ae6-11e9-a106-68b59976a384__bin.19/ShaoY_2019__bd927b56-7ae6-11e9-a106-68b59976a384__bin.19.fna.txt:CDS: 3524
ShaoY_2019__e9d50bc0-7ae6-11e9-a106-68b59976a384__bin.3/ShaoY_2019__e9d50bc0-7ae6-11e9-a106-68b59976a384__bin.3.fna.txt:CDS: 3021
ShaoY_2019__SID62cbe612-7ae6-11e9-a106-68b59976a384__bin.1/ShaoY_2019__SID62cbe612-7ae6-11e9-a106-68b59976a384__bin.1.fna.txt:CDS: 3659
ViscontiA_2019__SID590632__bin.32/ViscontiA_2019__SID590632__bin.32.fna.txt:CDS: 3206
ViscontiA_2019__SID729461__bin.8/ViscontiA_2019__SID729461__bin.8.fna.txt:CDS: 3465
VogtmannE_2016__MMRS85438660ST-27-0-0__bin.31/VogtmannE_2016__MMRS85438660ST-27-0-0__bin.31.fa.txt:CDS: 3935
WampachL_2018__V3_C111__bin.11/WampachL_2018__V3_C111__bin.11.fna.txt:CDS: 3216
XieH_2016__YSZC12003_36695__bin.47/XieH_2016__YSZC12003_36695__bin.47.fa.txt:CDS: 3669
XieH_2016__YSZC12003_37283__bin.33/XieH_2016__YSZC12003_37283__bin.33.fa.txt:CDS: 3128
YuJ_2015__SZAXPI003419-6__bin.12/YuJ_2015__SZAXPI003419-6__bin.12.fa.txt:CDS: 2677
YuJ_2015__SZAXPI015232-18__bin.15/YuJ_2015__SZAXPI015232-18__bin.15.fa.txt:CDS: 3252



#How many hypothetical proteins?
grep –c hypothetical */*.tsv -> to look at the value for all the different MAGs we have -> minimal value: 1190

#RESULTS:
ChengpingW_2017__AS103raw__bin.22/ChengpingW_2017__AS103raw__bin.22.fa.tsv:1190
ChengpingW_2017__AS126raw__bin.3/ChengpingW_2017__AS126raw__bin.3.fa.tsv:1421
ChengpingW_2017__AS71raw__bin.22/ChengpingW_2017__AS71raw__bin.22.fa.tsv:1475
ChuDM_2017__NCS-037-Stool-infant_microbiome__bin.9/ChuDM_2017__NCS-037-Stool-infant_microbiome__bin.9.fna.tsv:1548
FengQ_2015__SID531403__bin.23/FengQ_2015__SID531403__bin.23.fa.tsv:1377
LiJ_2014__V1.CD3-0-PN__bin.12/LiJ_2014__V1.CD3-0-PN__bin.12.fa.tsv:1418
LiJ_2014__V1.CD37-4__bin.8/LiJ_2014__V1.CD37-4__bin.8.fa.tsv:1965
LiJ_2014__V1.FI13__bin.53/LiJ_2014__V1.FI13__bin.53.fa.tsv:1889
LiJ_2014__V1.FI23__bin.8/LiJ_2014__V1.FI23__bin.8.fa.tsv:1664
LiJ_2017__H1M413822__bin.2/LiJ_2017__H1M413822__bin.2.fa.tsv:1388
LiJ_2017__H2M414927__bin.27/LiJ_2017__H2M414927__bin.27.fa.tsv:1435
LiJ_2017__H2M514906__bin.6/LiJ_2017__H2M514906__bin.6.fa.tsv:1694
LiJ_2017__H2M514930__bin.15/LiJ_2017__H2M514930__bin.15.fa.tsv:1252
LiJ_2017__H3M419939__bin.30/LiJ_2017__H3M419939__bin.30.fa.tsv:1665
LiJ_2017__H3M513141__bin.21/LiJ_2017__H3M513141__bin.21.fa.tsv:1394
LiJ_2017__H3M516909__bin.13/LiJ_2017__H3M516909__bin.13.fa.tsv:1193
LiuW_2016__SRR3993021__bin.12/LiuW_2016__SRR3993021__bin.12.fa.tsv:1703
QinN_2014__LD-31__bin.16/QinN_2014__LD-31__bin.16.fa.tsv:1566
ShaoY_2019__b3f12016-7ae6-11e9-a106-68b59976a384__bin.13/ShaoY_2019__b3f12016-7ae6-11e9-a106-68b59976a384__bin.13.fna.tsv:1534
ShaoY_2019__bac71bf2-7ae6-11e9-a106-68b59976a384__bin.5/ShaoY_2019__bac71bf2-7ae6-11e9-a106-68b59976a384__bin.5.fna.tsv:1454
ShaoY_2019__bd927b56-7ae6-11e9-a106-68b59976a384__bin.19/ShaoY_2019__bd927b56-7ae6-11e9-a106-68b59976a384__bin.19.fna.tsv:1830
ShaoY_2019__e9d50bc0-7ae6-11e9-a106-68b59976a384__bin.3/ShaoY_2019__e9d50bc0-7ae6-11e9-a106-68b59976a384__bin.3.fna.tsv:1413
ShaoY_2019__SID62cbe612-7ae6-11e9-a106-68b59976a384__bin.1/ShaoY_2019__SID62cbe612-7ae6-11e9-a106-68b59976a384__bin.1.fna.tsv:1902
ViscontiA_2019__SID590632__bin.32/ViscontiA_2019__SID590632__bin.32.fna.tsv:1549
ViscontiA_2019__SID729461__bin.8/ViscontiA_2019__SID729461__bin.8.fna.tsv:1813
VogtmannE_2016__MMRS85438660ST-27-0-0__bin.31/VogtmannE_2016__MMRS85438660ST-27-0-0__bin.31.fa.tsv:2149
WampachL_2018__V3_C111__bin.11/WampachL_2018__V3_C111__bin.11.fna.tsv:1565
XieH_2016__YSZC12003_36695__bin.47/XieH_2016__YSZC12003_36695__bin.47.fa.tsv:1917
XieH_2016__YSZC12003_37283__bin.33/XieH_2016__YSZC12003_37283__bin.33.fa.tsv:1543
YuJ_2015__SZAXPI003419-6__bin.12/YuJ_2015__SZAXPI003419-6__bin.12.fa.tsv:1200
YuJ_2015__SZAXPI015232-18__bin.15/YuJ_2015__SZAXPI015232-18__bin.15.fa.tsv:1614



#How many known proteins?
grep –c –v hypothetical ${sample_name}.tsv
# Annotation: -v, --invert-match -> select non-matching lines -> so here we select the known proteins -> these proteins, since are known are memorized in the data with thei name

#-> to look at the total numbers of proteins from a .tsv file, both known and unknown we need the following command: grep -c 'CDS' */*.tsv

#RESULTS:
ChengpingW_2017__AS103raw__bin.22/ChengpingW_2017__AS103raw__bin.22.fa.tsv:1502
ChengpingW_2017__AS126raw__bin.3/ChengpingW_2017__AS126raw__bin.3.fa.tsv:1736
ChengpingW_2017__AS71raw__bin.22/ChengpingW_2017__AS71raw__bin.22.fa.tsv:1700
ChuDM_2017__NCS-037-Stool-infant_microbiome__bin.9/ChuDM_2017__NCS-037-Stool-infant_microbiome__bin.9.fna.tsv:1770
FengQ_2015__SID531403__bin.23/FengQ_2015__SID531403__bin.23.fa.tsv:1640
LiJ_2014__V1.CD3-0-PN__bin.12/LiJ_2014__V1.CD3-0-PN__bin.12.fa.tsv:1716
LiJ_2014__V1.CD37-4__bin.8/LiJ_2014__V1.CD37-4__bin.8.fa.tsv:1761
LiJ_2014__V1.FI13__bin.53/LiJ_2014__V1.FI13__bin.53.fa.tsv:1797
LiJ_2014__V1.FI23__bin.8/LiJ_2014__V1.FI23__bin.8.fa.tsv:1724
LiJ_2017__H1M413822__bin.2/LiJ_2017__H1M413822__bin.2.fa.tsv:1576
LiJ_2017__H2M414927__bin.27/LiJ_2017__H2M414927__bin.27.fa.tsv:1630
LiJ_2017__H2M514906__bin.6/LiJ_2017__H2M514906__bin.6.fa.tsv:1746
LiJ_2017__H2M514930__bin.15/LiJ_2017__H2M514930__bin.15.fa.tsv:1604
LiJ_2017__H3M419939__bin.30/LiJ_2017__H3M419939__bin.30.fa.tsv:1722
LiJ_2017__H3M513141__bin.21/LiJ_2017__H3M513141__bin.21.fa.tsv:1658
LiJ_2017__H3M516909__bin.13/LiJ_2017__H3M516909__bin.13.fa.tsv:1548
LiuW_2016__SRR3993021__bin.12/LiuW_2016__SRR3993021__bin.12.fa.tsv:1693
QinN_2014__LD-31__bin.16/QinN_2014__LD-31__bin.16.fa.tsv:1742
ShaoY_2019__b3f12016-7ae6-11e9-a106-68b59976a384__bin.13/ShaoY_2019__b3f12016-7ae6-11e9-a106-68b59976a384__bin.13.fna.tsv:1706
ShaoY_2019__bac71bf2-7ae6-11e9-a106-68b59976a384__bin.5/ShaoY_2019__bac71bf2-7ae6-11e9-a106-68b59976a384__bin.5.fna.tsv:1678
ShaoY_2019__bd927b56-7ae6-11e9-a106-68b59976a384__bin.19/ShaoY_2019__bd927b56-7ae6-11e9-a106-68b59976a384__bin.19.fna.tsv:1744
ShaoY_2019__e9d50bc0-7ae6-11e9-a106-68b59976a384__bin.3/ShaoY_2019__e9d50bc0-7ae6-11e9-a106-68b59976a384__bin.3.fna.tsv:1655
ShaoY_2019__SID62cbe612-7ae6-11e9-a106-68b59976a384__bin.1/ShaoY_2019__SID62cbe612-7ae6-11e9-a106-68b59976a384__bin.1.fna.tsv:1818
ViscontiA_2019__SID590632__bin.32/ViscontiA_2019__SID590632__bin.32.fna.tsv:1705
ViscontiA_2019__SID729461__bin.8/ViscontiA_2019__SID729461__bin.8.fna.tsv:1699
VogtmannE_2016__MMRS85438660ST-27-0-0__bin.31/VogtmannE_2016__MMRS85438660ST-27-0-0__bin.31.fa.tsv:1837
WampachL_2018__V3_C111__bin.11/WampachL_2018__V3_C111__bin.11.fna.tsv:1687
XieH_2016__YSZC12003_36695__bin.47/XieH_2016__YSZC12003_36695__bin.47.fa.tsv:1794
XieH_2016__YSZC12003_37283__bin.33/XieH_2016__YSZC12003_37283__bin.33.fa.tsv:1633
YuJ_2015__SZAXPI003419-6__bin.12/YuJ_2015__SZAXPI003419-6__bin.12.fa.tsv:1520
YuJ_2015__SZAXPI015232-18__bin.15/YuJ_2015__SZAXPI015232-18__bin.15.fa.tsv:1683


#Figure: distribution of the completeness? Search in the net

#EC_number -> in the .tsv file it corresponds to the Enzyme Commission number (EC number) -> a numerical classification scheme for enzymes, based on the chemical reactions they catalyze.


#Lecture pangenome analysis:
#Pangenome -> union of core genes and accessory gene -> in our case it is the union of all the genome we have

#Shell genome -> genes present in >= 2 strains
#Cloud genome: genes present in just 1 strains

#Close pangenome
#Open pangenome -> if we keep adding genomes, we see more accessory function

#Roary analyse the pangenome and uses the output of prokka for that.

#Plot te output of roary:
#The more genomes we add, the pangenome size increase -> we explore more diversity -> we have a bogger diversity -> ergo: open pangenome
#If the species live in an open enviroemt in which it can share info with other species -> usually open pangenome.

#Commands:
1) Get prokka GFF output and put into a same directory
2) conda activate roary
3) roary -h -> to look at the help. Today we will use it in two ways.
4) mkdirGFF && cd GFF
5) cp ../*/*gff ~/GFF
6) roary *.gff -f roary_out -i 95 -cd 90
-i = percentage identity of blastp -> if we put 99% we are mosre strict and we donot consider the same genes -> we consider different two genes that differs only of one SNP -> the core genome can be more small -> if we put 95% we are less stringet and the core genome can be more expanded. 
-cd = percentage of isolates a gene must be in to be core [default: 99] -> because we are creating the core genes -> everithying that is present in 90% of the MAGs are considered as core genomes -> we can change to 80/85 % and see what happens to the core genomes.
7) cd roary_out
Several outputs get created:
----->gene_presence_absence.csv: The gene presence and absence spreadsheet lists each gene and which samples it is present in.

1-> The gene name, which is the most frequently occurring gene name from the sequences in the cluster. If there is no gene name, then it is given a generic unique name group_XXX.
2-> A non unique gene name, where sequences with the same gene name have ended up in different groups. It might be because of split genes, or miss annotation.
3-> Functional annotation. The most frequently occurring functional annotation from the cluster is used.
4-> Number of isolates represented in the cluster.
5-> Number of sequences in the cluster.
6-> Average number of sequences per isolate. This is normally 1. If this is greater than 1 then there is over clustering and the paralogs couldn’t be split.
7-> Genome fragment, where there is evidence at the contig level that the genes are linked.
8-> Order within fragment, combined with the genome fragment this gives an indication of the order of genes within the graph. In Excel, sort on Column G and H.
9-> Accessory Fragment is where core genes are excluded and there is evidence at contig level that the genes are linked.
10-> Accessory order with fragment, combined with the Accessory fragment this gives an indication of the order of genes within the accessory graph. In Excel, sort on columns I and J.
11-> Comments on the quality of the cluster. Miss predictions are noted, as are single genes on single contigs, which can be evidence of low level contamination.
12-> Minimum sequence length in nucleotides of the cluster.
13-> Maximum sequence length in nucleotides of the cluster.
14-> Average sequence length in nucleotides of the cluster.
15-> Presence and absence of genes in each sample, with the corresponding source Gene ID.

-----> summary:statistics.txt -> core genes, soft genes, cloud genes
8) cat summary_statistics.txt

Core genes (90% <= strains <= 100%) 2178
Soft core genes (89% <= strains < 90%) 0
Shell genes (15% <= strains < 89%) 1908
Cloud genes (0% <= strains < 15%) 2178
Total genes (0% <= strains <= 100%) 6264

-> we get the number of genes fresent in the genomes and the percentage -> example: 2178 genes where present in >=90% of the strains

Number of genes in the core and accessory. A text file with an overview of the genes and how frequently they occur in the input isolates. If the number of core genes is 0 it can indicate you have some contamination. Likewise if the total number of genes is very high.

9) gene_presence_absence.csv

query_pan_genome -> -a STR  action (union/intersection/complement/gene_multifasta/difference) [union] -> NB da lo stesso output name a tutti!!

10) How big is the pangenome? query_pan_genome -a union (=to look at the pangenome) GFF/*.gff

This will give us a file called pan_genome_results that contains a list of all genes in all samples, i .e. the pan genome.
Have a look at the first ten lines of the newly generated file: head pan_genome_results -> the list contains the names of the clusters (this is usually the most frequently occurring gene name from the sequences in the cluster or, if there is no gene name, a generic unique name group_XXX).
For each cluster, there is a tab separated list of each sample specific gene belonging in that cluster.

11) How big is the pangenome? query_pan_genome -a intersection (=to look at the core) GFF/*.gff
 

12) How big is the pangenome? query_pan_genome -a complement (=to look at the accessory) GFF/*.gff

Total line with: wc -l pane_genome_result_*
We get:
5070 pan_genome_results_complement
1194 pan_genome_results_intersection
6264 pan_genome_results_union


USEFUL NOTEBOOK: https://notebook.community/ssjunnebo/pathogen-informatics-training/Notebooks/ROARY/results



Plot the outputs of roary using the .R at following page: https://github.com/sanger-pathogens/Roary/blob/master/bin/create_pan_genome_plots.R
1) open RStudio
2) Run the code create_pan_genome.R, remember to be in the right directory with the input files needed!
Outputs files:
-blast_identity_frequency.png
-number_new_genes.png
-number_of_conserved_genes.png
-number_of_genes_in_pan.png
-number_of_unique_genes.png
-conserved_vs_totalgene.png -> pangenome closed/open -> We see what happens when the more genomes are inserted -> we need to see if a plateaux is reached or not -> comment on this and make deduction if the pangenome is open or not -> we see what happens to the conserved genomes and what happens to the total genome
-unique_vs_new_genes.png -> in the Rtab files, does unique gene mean genes that are only present in one strain? and new gene mean genes that are not found in previous strains?


NB: Article for analysis od unique_vs_new_genes and conserved_vs_totalgene: https://journals.asm.org/doi/10.1128/spectrum.02654-21
Roary pangenome plots were examined to assess the relationships between number of genes identified and number of genomes used.
These plots showed that saturation in the number of new (Fig. 2A) and conserved genes (Fig. 2B) identified was reached after including fewer than 20 genomes,
consistent with a restricted gonococcal pangenome size. As a feature, Roary splits variants of the same gene into multiple unique genes where these have less than 95% similarity.
Therefore, the number of unique (Fig. 2A) and total genes (Fig. 2B) identified correlated with the number of gene variants defined, which in turn increased as more genomes were examined.
This indicates that, in the gonococcus, diversity within genes increases proportionally as more genomes are examined, whereas diversity in genome content saturizes with less than 20 genomes.
This also showed that the subset of 765 isolates was sufficient to capture the full extent of the gonococcal pangenome.


Extra plotting:
NB. remember that for the plotting you probably need to move out of the roary enviroment -> conda deactivate roary

1) Download the .py: curl https://raw.githubusercontent.com/sangerpathogens/Roary/master/contrib/roary_plots/roary_plots.py -o roary_plots.py

The plotting script requires two files that Roary generated:
-accessory_binary_genes.fa.newick  -> tree based on the geen_presence_absenceof the genes,
-gene_presence_absence.csv.

2) python roary_plots.py -h
-> we have info on the help, and we understand which are the input and output files
3) python roary_plots.py accessory_binary_genes.fa.newick gene_presence_absence.csv

Different plots are returned:
- pie chart -> how many genes are in the core and accessory, clouds and shell
- matrix graphic with the tree of presence_absence + heatmap with the genes present and not -> we can see that the core genes are present everywhere while there are some genes present in only one -> we can see a tree but important, it is not a complete clustering
- pangenome_frequency -> the genes present in one genome are a lot, these are the accessory genes, the core genes are found at the end of the plot of the frequency -> genes present in all the genomes -> comment on the fact that the number of the accessoty is way bigger that the number of the core gene.
-> see how these plots change when we change the -i and -cd parameters

DA CHIEDERE COME MAI CI VENGONO RISULTATI DIVERSI SUL summary_statistics !!!!!!!!!!!!!!!!!!!!

Roary with alignment
1) roary *.gff -f roary_out_alignment –e -n -i 95 -cd 90
OR 
roary *.gff -f roary_out_alignment –e -n -i 95 -cd 90 -p INT_Value -> We can speed it up increasing the number of threads, the default is one -> increase with the parameter -p INT_Value
-> we set 8 thread

This command produces a core gene alignment, to get a better tree -> thanks to the -e parameter.
Can also use the -n parameter, and we get a faster alignment. If we don't use -n it uses PRANK instead of mafft and it takes a little more time -> take some hours!!
PRANK: https://pubmed.ncbi.nlm.nih.gov/24170401/ (alternatively: mafft)



LAB- PROJECT: Taxonomic assignment and phylogenetic analysis

Phylogenetic structure of our bins (Roary + FastTree)

RECAP: genomes in fasta files -> blast -> hits and creation of clusters -> core genes and accessory ones.

Roary: gene clustering + pangenome presence/absence of gene families (or clusters)

Closed pangenome if no matter how many mags we add, we don't have new genes.
Open pangenome if there are always new genes -> increase the size of the pangenome.


OUR CASE: we should fit a curve to see if it gets or not to a plateux.  With 30 genomes it is difficut to say, we can argue that the initial slope is high but at the end (when we almost added all the genomes), the slope decrease and almost go to a plateux. Looking at the new vs total genes, we can see that, adding new genomes doesn't give new information, almost at zero when we add the last genome (the 30th), we can therefore say that the pangenome is closed.

1) Look at the tree without the alignment -> accessory_binary_genes.fa.newick
Visualize trees via:
-> iTOL: https://itol.embl.de/ -> we can upload a tree file -> we can see how the different MAGs are distributes -> look at the branches and if the MAGs of the same dataset are in the same branch -> like if the CHN samples are togheter -> if two branches/leafs are very close to each other in the orizontal point of view -> they usually are part of the same dataset.
                               -> WE CAN CHANGE THE APPEARANCE OF THE TREE ADDING COLOURS OR ADDING THE TAXONOMY
-> Archaeopteryx: https://www.phylosoft.org/archaeopteryx/
-> ggtree R package



2) Core gene alignment tree (Roary -e) -> once we have an alignment built
1-> conda activate roary (our inviroment with FastTree)
2-> FastTree
3-> FastTree -nt < core_gene_alignment.aln > core_gene.tre
4-> FastTreeMP –gtr –nt –out core_gene.tre core_gene_alignment.aln
-> gtr -- generalized time-reversible model (nucleotide alignments only)
-> nt for nucleotides
-> out for the output

FastTree

#tune some parameters to speed it up:
1-> FastTreeMP -pseudo -spr 4 -mlacc 2 -slownni -fastest -no2nd -mlnni 4 -gtr -nt -out core_gene_quick_tre core_gene_alignment.aln 

pseudo -- to use pseudocounts (recommended for highly gapped sequences)
fastest -- speed up the neighbor joining phase & reduce memory usage
topology refinement parameters: -spr, -mlnni, -
Visualize tree: https://itol.embl.de/ -> let's see if it is different -> we can add numbers in the tree (control panel -> advanced ) -> between 0 and 1 -> if =1 then we suppost completly the separation of the branches, low number means that there is a small support for the split of the branches -> we are not sure that these two branches are separated or not -> low numbers in the leaf is not a big problem, in the main branchesit is because the tree is not so affidabile!
-> output of the MSA should be more accurate -> look at th enumbers in the branches!!

We can compare the two trees -> the second one is based on the MSA of the core genes while the first one is based on the presence absence


LAB - TAXONOMIX CHARACTERIZATION + ANNOTATION 
-> name for the taxa levels that were selected/associated
-> we use phyloPLHAn -> taxonomic assignemnt, for each genome, if there is less than 5% distance then it associate that bin to that taxonomic annotation

mkdir phylophlan_input -> contains the fatsa files of teh MAGS
conda activate ppa (=our enviroment for phylophlan)

phylophlan_metagenomic -i Phylophlan/ -o phylophlan_output --nproc 4 -n 1 (=return the best match, with a large database we use -n 5) --database_update -d CMG2324 (our database) --verbose

cat phyloplan_out.tsv   -> 



