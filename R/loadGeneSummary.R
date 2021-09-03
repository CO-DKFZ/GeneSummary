
cache = new.env()

# == title
# Load gene summary table
#
# == param
# -organism Name of the organism (e.g. "Homo sapiens") or the corresponding taxon ID (e.g. 9606).
# -status Status of the review of the genes.
#
# == details
# The gene summaries are extracted from RefSeq database (https://ftp.ncbi.nih.gov/refseq/release/complete/*.rna.gbff.gz).
# Gene summaries are available in the "COMMENT" section of the ``*rna.gbff.gz`` files.
#
# The Perl script used to parse ``*rna.gbff.gz`` files is available in ``system.file("extdata", "parse_refseq.pl", package = "GeneSummary")``.
#
# The data is based on RefSeq release 207 (https://ftp.ncbi.nih.gov/refseq/release/RELEASE_NUMBER ).
#
# == value
# A data frame with the following columns:
#
# -RefSeq_accession RefSeq accession. Note there is also the version number after the accession.
# -Organism Full organism name.
# -Taxon_ID Taxon ID of the organism.
# -Gene_ID Entrez gene ID.
# -Review_status Status of the review of the gene.
# -Gene_summary A long description of the gene.
#
# == example
# df = loadGeneSummary(9606)
# dim(df)
# head(df)
loadGeneSummary = function(organism = 9606,
	status = c("reviewed", "predicted", "inferred", "validated", "provisional")) {
	if(is.null(cache$table)) {
		cache$table = readRDS(system.file("extdata", "refseq_gene_summary.rds", package = "GeneSummary"))
	}

	tb = cache$table

	if(!is.null(organism)) {
		
		if(is.numeric(organism)) {
			tb = tb[tb$Taxon_ID == organism, , drop = FALSE]
		} else if(is.character(organism)) {
			if(grepl("^\\d+$", organism)) {
				tb = tb[tb$Taxon_ID == as.numeric(organism), , drop = FALSE]
			} else {
				tb = tb[tb$organism == organism, , drop = FALSE]
			}
		}
	}

	if(length(setdiff(status, c("reviewed", "predicted", "inferred", "validated", "provisional")))) {
		stop("`status` only takes values in reviewed/predicted/inferred/validated/provisional.")
	}

	status_map = c(
		"reviewed" = "REVIEWED REFSEQ",
		"predicted" = "PREDICTED REFSEQ",
		"inferred" = "INFERRED REFSEQ",
		"validated" = "VALIDATED REFSEQ",
		"provisional" = "PROVISIONAL REFSEQ")
	status = status_map[status]
	tb = tb[tb$Review_status %in% status, , drop = FALSE]
    rownames(tb) = NULL
    tb
}
