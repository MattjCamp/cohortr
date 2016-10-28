library(testthat)
library(dplyr)

context("SAMPLE STUDENT DATABASE")

test_that("DB WORKS", {

  d <-
    "SELECT * FROM students" %>%
    pull_data()

  b <-
    d %>%
    is.sample.standardized()

  expect_true(b)

})

