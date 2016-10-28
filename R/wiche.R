#' WICHE Projections
#'
#'  High school graduate forecasts from The Western Interstate Commission for Higher Education (WICHE)
#'
#' @format A data frame with 193,024 rows and 6 variables:
#' \describe{
#'   \item{location}{state abbreviation in lowercase}
#'   \item{sector}{identifies all, public or non-public schools}
#'   \item{race}{identifies all or particular races}
#'   \item{grade}{grade level number or 'graduates'}
#'   \item{year}{academic year ending, so 2015-2016 would be expressed as 2016}
#'   \item{n}{the number of students enrolled}
#'   ...
#' }
#' @source {http://www.wiche.edu/knocking-8th}
#' @examples
"wiche"
