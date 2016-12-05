library(testthat)
library(dplyr)

context("STATES DATA")

test_that("LOOKUP FUNCTION WORKS", {

  d <-
    lookup_states()

  expect_false(all(is.na(d)))

})

