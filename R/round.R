#' Override R Rounding
#'
#' Rounds like SAS or Excel with faced with .5
#' @param x the number to round
#' @param digits how many decimal points do you want?
#' @keywords round
#' @export
#' @examples
#' # Left to it's own devices, R will always round to the even digit. Most
#' # people don't expect this and tools like Excel and SAS will not behave
#' # in this way. For example, here is what round will do when faced with
#' # a vector of numbers that end in .5
#'
#' round(c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5))
#'
#' [1] 2 2 4 4 6 6
#'
#' # You probably expect this to be 2, 3, 4, 5, 6, 7 and that is indeed
#' # what would have happened in Excel. But, R rounding is based on IEC 60559.
#' # This stinks, so in cohortr round is overriden. When you import the
#' # cohortr library this is what the behavior of round is:
#'
#' library(cohortr)
#'
#' round(c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5))
#'
#' [1] 2 3 4 5 6 7

round = function(x, digits = 0) {

  ifelse(!is.na(x), {

    made.x.negative <- FALSE

    ifelse(x < 0, {
      x <- x * -1
      made.x.negative <- TRUE
    }, x <- x)

    d <- 10 ^ digits
    x <- x * d
    x <- x + 0.5
    x <- as.character(x)
    x <- as.numeric(x)
    x <- trunc(x);
    x <- x / d
    if (made.x.negative)
      x <- x * -1

    x },
    x )

  }
