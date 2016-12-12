library(testthat)
library(dplyr)

context("WICHE DATA")

test_that("LOOKUP FUNCTION WORKS", {

  d <-
    lookup_wiche(location = "pa")

  # NOTE this test refects numbers from the 2016 WICHE data release and
  # will fail until the WICHE data sources are updated in these packages.

  expect_equal(d$n, 123758)

})

