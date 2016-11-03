# Returns the standard deviation for a population (using N and not N-1 as denominator)

#' Standard Deviation for Population
#'
#' Returns the standard deviation for a population (using N and not N-1 as denominator)
#' @description The fact that R is missing this is baffling, but we need this all the time when we are doing descriptive statistics so here it is.
#' @param x the vector of observations
#' @keywords statistics, standard deviation, variability
#' @source http://stackoverflow.com/a/30812437/131753
#' @export

sdp <- function(x){

  # I adapted this from an answer I found
  # on Stack Overflow

  # Reference

  # http://stackoverflow.com/a/30812437/131753

  pop.var <- var(x, na.rm = TRUE) * (length(x) - 1) / length(x)

  sqrt(pop.var)

}
