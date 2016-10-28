
#' Lookup State Information
#'
#' Quick lookup function for the states table
#' @keywords state abbreviations and descriptions
#' @export
#' @examples

lookup_states <- function(...){

  dplyr::filter(states, ...)

}
