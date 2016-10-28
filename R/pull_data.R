#' Pull Data
#'
#' Pulls data from the active database instance, if none exists this function attempts to connect to Cornerstone using the function database_cornerstone (which you need to code with your credientials)
#' @keywords database
#' @param sql The SQL code to be executed
#' @export
#' @examples
#'

pull_data <- function(sql){

  if (!exists("db")) {
    db <- dbr::sqlite(system.file("extdata", "test_scores.db", package = "cohortr"))
  } else {
    if (is.null(db)) {
      db <- dbr::sqlite(system.file("extdata", "test_scores.db", package = "cohortr"))
    }
  }

  tibble::as_tibble(db$query(sql))

}

