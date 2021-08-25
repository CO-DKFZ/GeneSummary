# https://ftp.ncbi.nih.gov/refseq/release/complete/*.rna.gbff.gz


use strict;

open my $out, ">refseq_gene_summary.txt";
print $out "RefSeq_accession\tOrganism\tTaxon_ID\tGene_ID\tReview_status\tGene_summary\n";

foreach my $file (glob("refseq/*.rna.gbff.gz")) {
	parse_rna_gbff($file, $out);
}

close $out;

# parse_rna_gbff("refseq/complete.2204.rna.gbff.gz", $out);

sub parse_rna_gbff {
	my $file = shift;
	my $out = shift;

	print "parsing $file...\n";
	open my $fh, "gzcat $file |" or die "An error\n";

	my $accession = "";
	my $organism = "";
	my $summary = "";
	my $review = "";
	my $gene_id = "";
	my $taxon_id = "";

	while(my $line = <$fh>) {
		if($line =~/^LOCUS/) {
			$accession = "";
			$organism = "";
			$summary = "";
			$review = "";
			$gene_id = "";
			$taxon_id = "";

			while($line = <$fh>) {
				if($line =~/^VERSION/) {
					$line =~/^VERSION\s+(\S+)$/;
					$accession = $1;
				} elsif($line =~/^\s+ORGANISM/) {
					$line =~/^\s+ORGANISM\s+(\S.*)$/;
					$organism  = $1;
				} elsif($line =~/^COMMENT\s+/) {
					$line =~/^COMMENT\s+(.*)?:/;
					$review = $1;
					$summary = read_comment($fh);
				} elsif($line =~/^\s+gene\s+/) {
					$gene_id = read_gene_id($fh);
				} elsif($line =~/^\s+source\s+/) {
					$taxon_id = read_taxon_id($fh);
				}

				if($line =~/^\/\//) {
					if($summary ne "") {
						if($summary !~/\.$/) {
							$summary .= ".";
						}
						print $out "$accession\t$organism\t$taxon_id\t$gene_id\t$review\t$summary\n";
					}
					# print "$accession\t$gene_id\n";
					last;
				}
			}
		}
	}
}

sub read_comment {
	my $fh = shift;
	my $summary = "";
	my $flag = 0;

	while(my $line = <$fh>) {

		if($line =~/^\S/) {
			last;
		}
		if($line =~/^\s+Summary/) {
			$flag = 1;
		}
		if($flag) {
			chomp $line;
			$line =~s/^\s+//g;
			$summary .= " $line";	
		}

	}
	$summary =~s/^\s*Summary:\s*//g;
	$summary =~s/\s*\[[^\[\]]*?\].*$//g;

	return $summary;
}

sub read_gene_id {
	my $fh = shift;
	my $gene_id = "";

	while(my $line = <$fh>) {
		if($line =~/db_xref="GeneID:(\d+)"/) {
			$gene_id = $1;
			last;
		}
		
		if($line !~/^                     /) {
			last;
		}
	}
	return $gene_id;
}

sub read_taxon_id {
	my $fh = shift;
	my $taxon_id = "";

	while(my $line = <$fh>) {
		if($line =~/db_xref="taxon:(\d+)"/) {
			$taxon_id = $1;
			last;
		}
		
		if($line !~/^                     /) {
			last;
		}
	}
	return $taxon_id;
}

