
# Reads, cleans and packages the spreadsheet downloaded from WICHE
# website with 2016 projections. The workbook is located in this directory
# and was downloaded from here:
# http://knocking.wiche.edu/s/All-Enrollment-and-Graduate-Projections-neh9.xlsx
# NOTE change the working directory to this location to run this code

library(cohortr)
library(datapointsr)
library(stringr)

file <- "All+Enrollment+and+Graduate+Projections.xlsx"

# Read Original

w <- read_excel(path = file, sheet = "Projections")
w <- w[, 1:16]
w <- as.data.points(w, category_cols = c(1:3))

# Read New R/E

w_new <- read_excel(path = file, sheet = "Additional REs")
w_new <- w_new[, 1:16]
w_new <- as.data.points(w_new, category_cols = c(1:3))

# Combine

w <- bind_rows(w, w_new)

w <-
  w %>%
  filter(!STABR %in% c("_W", "_S", "_E", "_N"),
         !is.na(value))

# Clean

w <-
  w %>%
  mutate(STABR = str_trim(str_to_lower(STABR)),
         STABR = ifelse(STABR == "_u", "us", STABR))

# Package

wiche <- tibble::as_tibble(wiche)
devtools::use_data(wiche, wiche, overwrite = TRUE)

