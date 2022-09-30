
library(rvest)
library(GetoptLong)

version = readLines(url("https://ftp.ncbi.nih.gov/refseq/release/RELEASE_NUMBER"))


html = read_html("https://ftp.ncbi.nih.gov/refseq/release/complete/")

files = html %>% 
  html_elements("a") %>% 
  html_text2()
files = grep(".*.rna.gbff.gz$", files, value = TRUE)


links = paste("https://ftp.ncbi.nih.gov/refseq/release/complete/", files, sep = "")

options(timeout = 9999999)
for(i in seq_along(files)) {
	qqcat("downloading @{links[i]}, @{i}/@{length(files)}\n")
	download.file(links[i], paste0("refseq/", files[i]))
}
