

# == title (variable:GeneSummary)
# Version and source information
#
# == example
# GeneSummary
GeneSummary = list(
	built_date = "2022-09-30",
	source = "https://ftp.ncbi.nih.gov/refseq/release/complete/*.rna.gbff.gz",
	refseq_version = "214",
	orgainsms = 129

)
class(GeneSummary) = "GeneSummary_info"

# == title
# Print the GeneSummary_info object
#
# == param
# -x A ``GeneSummary_info`` object.
# -... Other arguments
#
# == value
# No value is returned.
#
# == example
# GeneSummary
print.GeneSummary_info = function(x, ...) {
	cat("RefSeq gene summaries\n")
	cat("  RefSeq release:", x$refseq_version, "\n")
	cat("  Source:", x$source, "\n")
	cat("  Number of organisms:", x$orgainsms, "\n")
	cat("  Built date: ", x$built_date, "\n")
}
