library(testthat)
library(dplyr)
library(coderr)

context("SAMPLE STUDENT DATABASE")

test_that("DB WORKS", {

  d <-
    "students" %>%
    code_sql_sample("year in (2011, 2012, 2013, 2014, 2015)") %>%
    pull_data()

  b <-
    d %>%
    is.sample.standardized()

  expect_true(b)

})

