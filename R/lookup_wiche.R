
#' Lookup WICHE Enrollment Projections
#'
#' Quick lookup function for the WICHE table
#' @keywords participation rates
#' @param location state abbreviation in lowercase or us for entire nation
#' @param sector identifies all, public or non-public schools
#' @param race identifies all or particular races
#' @param gender idenifies the sex
#' @param grade grade level number or g for graduates
#' @param year academic year ending, so 2015-2016 would be expressed as 2016
#' @export

lookup_wiche <- function(location = "us",
                         sector = "p",
                         race = "all",
                         gender = "all",
                         grade = "g",
                         year = NULL){

  if (is.null(year))
    year <- as.numeric(stringr::str_match(Sys.Date(), "[0-9]{4}"))

  l <- location
  s <- sector
  r <- race
  g  <-  gender
  gr  <-  grade
  y <-  year

  wiche %>%
    dplyr::filter(location %in% l,
                  sector %in% s,
                  race %in% r,
                  gender %in% g,
                  grade %in% gr,
                  year %in% y)

}
