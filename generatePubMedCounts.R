library(dplyr)
library(biomaRt)

breast_pmids <- read.table("~/Downloads/pubmed_result_breast.txt")
gene2pubmed <- read.table("~/Downloads/gene2pubmed", col.names = c("taxid", "GeneID", "PubmedID"))
gene2pubmed_breast <- gene2pubmed[gene2pubmed$PubmedID %in% breast_pmids$V1, ]
gene2ensembl <- read.table("~/Downloads/gene2ensembl")
gene2ensembl <- gene2ensembl[,c("V2", "V3")]
genedf_breast <- inner_join(gene2pubmed_breast, gene2ensembl, by=c("GeneID" = "V2"))
genedf_breast <- genedf_breast %>% distinct()
genepubmedcounts_breast <- genedf_breast %>% group_by(V3) %>% count()
mart = useMart("ensembl", dataset = "hsapiens_gene_ensembl")
ensembl_hugo_breast <- getBM(attributes=c("ensembl_gene_id", "hgnc_symbol"), filters="ensembl_gene_id", values=genepubmedcounts_breast$V3, mart = mart)
finaldf <- inner_join(genepubmedcounts_breast, ensembl_hugo_breast, by=c("V3" = "ensembl_gene_id"))