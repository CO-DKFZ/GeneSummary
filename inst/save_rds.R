df = read.table("refseq_gene_summary.txt", header = TRUE, sep = "\t", quote = "")
saveRDS(df, file = "GeneSummary/inst/extdata/refseq_gene_summary.rds", compress = "xz")
