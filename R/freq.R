
#' Frequency Distribution
#'
#' Returns a frequency distribution with more detail than a simple count of objects.
#' @description
#' @param x the vector of observations
#' @keywords statistics, frequncy
#' @export

freq <- function(x){

  d <- cbind(
      n = table(x),
      n_cumm = cumsum(table(x)),
      perc = round(prop.table(table(x)) * 100, 4),
      perc_cumm = round(cumsum(prop.table(table(x))) * 100, 4)
  )

  d <- as.data.frame(d)

  d$object <- row.names(d)

  d <- d[, c(5,1:4)]

  d$object <- as.numeric(d$object)

  d <- d[order(d$object, decreasing = FALSE),]

  row.names(d) <- 1:nrow(d)

  d

}
