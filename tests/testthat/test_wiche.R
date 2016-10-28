library(testthat)
library(dplyr)

context("WICHE DATA")

test_that("LOOKUP FUNCTION WORKS", {

  d <-
    lookup_wiche()

  expect_equal(d$n, 3000793)

})

