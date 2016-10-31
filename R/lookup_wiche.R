
#' Lookup WICHE Enrollment Projections
#'
#' Quick lookup function for the WICHE table
#' @keywords participation rates
#' @export
#' @examples

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
