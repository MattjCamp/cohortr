library(testthat)
library(dplyr)

context("WICHE DATA")

test_that("LOOKUP FUNCTION WORKS", {

  d <-
    lookup_wiche(location == "pa")

  expect_equal(d$n, 123758)

})

