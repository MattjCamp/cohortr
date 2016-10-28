#' Is this Sample Standardized?
#'
#' Looks to make sure that the data.frame columns meet the requirements for standard visualizations.
#' @description If the data.frame passes the test then we know for sure that it will have the expected standard columns that can be used in typical analysis and visualizations. This function looks for these columns in this order: person, year, exam, score, tg, us, location, school, district, sector, race, gender, waiver

#' @keywords sample
#' @param df the data.frame that you want to test
#' @export
#' @examples
#' @return Boolean indicating whether the data.frame is sanitized

is.sample.standardized <- function(df){

  l <- length(names(df))

  if (l > 13)
    df <- df %>% select(1:13)

  sample_names <- names(df)

  ref <- c("person", "year", "exam", "score",
           "tg", "us", "location",
           "school", "district", "sector",
           "race", "gender", "waiver")

  all(sample_names == ref) == TRUE

}