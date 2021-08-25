# RefSeq Gene Summaries

### Install

```r
if (!requireNamespace("GeneSummary", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("jokergoo/GeneSummary")
```

### Usage

```r
library(GeneSummary)
tb = loadGeneSummary(organism = 9606)
# # or use the full organism name
# tb = loadGeneSummary(organism = "Homo sapiens")
dim(tb)
```

```
## [1] 50550     6
```

```r
head(tb)
```

```

##      RefSeq_accession     Organism Taxon_ID Gene_ID   Review_status
## 1170   NM_001368885.1 Homo sapiens     9606    1305 REVIEWED REFSEQ
## 1171   NM_001368886.1 Homo sapiens     9606    1305 REVIEWED REFSEQ
## 3590      NR_148047.2 Homo sapiens     9606    6867 REVIEWED REFSEQ
## 3591      NR_148053.2 Homo sapiens     9606    6867 REVIEWED REFSEQ
## 3596   NM_001374457.1 Homo sapiens     9606    6597 REVIEWED REFSEQ
## 4569      NR_148052.2 Homo sapiens     9606    6867 REVIEWED REFSEQ
## 
## 1170 This gene encodes the alpha chain of one of the nonfibrillar collagens. The function of this gene product is not known, however, it has been detected at low levels in all connective tissue-producing cells so it may serve a general function in connective tissues. Unlike most of the collagens, which are secreted into the extracellular matrix, collagen XIII contains a transmembrane domain and the protein has been localized to the plasma membrane. The transcripts for this gene undergo complex and extensive splicing involving at least eight exons. Like other collagens, collagen XIII is a trimer; it is not known whether this trimer is composed of one or more than one alpha chain isomer. A number of alternatively spliced transcript variants have been described, but the full length nature of some of them has not been determined.
## 1171 This gene encodes the alpha chain of one of the nonfibrillar collagens. The function of this gene product is not known, however, it has been detected at low levels in all connective tissue-producing cells so it may serve a general function in connective tissues. Unlike most of the collagens, which are secreted into the extracellular matrix, collagen XIII contains a transmembrane domain and the protein has been localized to the plasma membrane. The transcripts for this gene undergo complex and extensive splicing involving at least eight exons. Like other collagens, collagen XIII is a trimer; it is not known whether this trimer is composed of one or more than one alpha chain isomer. A number of alternatively spliced transcript variants have been described, but the full length nature of some of them has not been determined.
## 3590 This locus may represent a breast cancer candidate gene. It is located close to FGFR1 on a region of chromosome 8 that is amplified in some breast cancers. Several transcript variants encoding different isoforms have been found for this gene.
## 3591 This locus may represent a breast cancer candidate gene. It is located close to FGFR1 on a region of chromosome 8 that is amplified in some breast cancers. Several transcript variants encoding different isoforms have been found for this gene.
## 3596 The protein encoded by this gene is a member of the SWI/SNF family of proteins and is similar to the brahma protein of Drosophila. Members of this family have helicase and ATPase activities and are thought to regulate transcription of certain genes by altering the chromatin structure around those genes. The encoded protein is part of the large ATP-dependent chromatin remodeling complex SNF/SWI, which is required for transcriptional activation of genes normally repressed by chromatin. In addition, this protein can bind BRCA1, as well as regulate the expression of the tumorigenic protein CD44. Mutations in this gene cause rhabdoid tumor predisposition syndrome type 2. Multiple transcript variants encoding different isoforms have been found for this gene.
## 4569 This locus may represent a breast cancer candidate gene. It is located close to FGFR1 on a region of chromosome 8 that is amplified in some breast cancers. Several transcript variants encoding different isoforms have been found for this gene.
```

### License

MIT @ Zuguang Gu


