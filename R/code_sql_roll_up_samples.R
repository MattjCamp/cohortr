

#' Rolls up Sample Years
#'
#' Selects distinct examinees with the highest score
#' @param years the years to roll up
#' @param sample_function function that makes a sample for a single year
#' @return A data frame with distinct cohort records
#' @export

code_sql_roll_up_samples <- function(years, sample_function) {

  sql <- sample_function(years[1])
  l <- length(years)
  if (l > 1)
    for (i in 2:l)
      sql <- sprintf("%s UNION %s", sql,
                     sample_function(years[i]))
  sql

}

