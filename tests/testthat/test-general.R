
df = loadGeneSummary(9606)

test_that("test general", {
	expect_equal(length(unique(df$Organism)), 1)
	expect_equal(length(unique(df$Taxon_ID)), 1)
})


df = loadGeneSummary(NULL, status = "reviewed")
test_that("test reviewed", {
	expect_equal(length(unique(df$Review_status)), 1)
})

df = loadGeneSummary(NULL, status = c("reviewed", "provisional"))
test_that("test reviewed and provisional", {
	expect_equal(length(unique(df$Review_status)), 2)
})
