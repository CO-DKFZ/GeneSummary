\name{loadGeneSummary}
\alias{loadGeneSummary}
\title{
Load gene summary table
}
\description{
Load gene summary table
}
\usage{
loadGeneSummary(organism = 9606,
    status = c("reviewed", "predicted", "inferred", "validated", "provisional"))
}
\arguments{

  \item{organism}{Name of the organism (e.g. "Homo sapiens") or the corresponding taxon ID (e.g. 9606).}
  \item{status}{Status of the review of the genes.}

}
\details{
The gene summaries are extracted from RefSeq database (https://ftp.ncbi.nih.gov/refseq/release/complete/*.rna.gbff.gz).
Gene summaries are available in the "COMMENT" section of the \code{*rna.gbff.gz} files.

The Perl script used to parse \code{*rna.gbff.gz} files is available in \code{system.file("extdata", "parse_refseq.pl", package = "GeneSummary")}.

The data is based on RefSeq release 207 (\url{https://ftp.ncbi.nih.gov/refseq/release/RELEASE_NUMBER} ).
}
\value{
A data frame with the following columns:

\describe{
  \item{RefSeq_accession}{RefSeq accession. Note there is also the version number after the accession.}
  \item{Organism}{Full organism name.}
  \item{Taxon_ID}{Taxon ID of the organism.}
  \item{Gene_ID}{Entrez gene ID.}
  \item{Review_status}{Status of the review of the gene.}
  \item{Gene_summary}{A long description of the gene.}
}
}
\examples{
df = loadGeneSummary(9606)
dim(df)
head(df)
}
