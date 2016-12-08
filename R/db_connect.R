
#' DB Connection
#'
#' Connects to a database
#' @keywords database
#' @param database Prefix to match on
#' @export

db_connect <- function(database = "test_scores"){

  if (!database %in% c("test_scores"))
    stop(sprintf("cohortr:db_connect %s is not supported yet. Either support or use another database", database))

  if (stringr::str_to_lower(stringr::str_trim(database)) == "test_scores") {

    db <<- dbr::sqlite(system.file("extdata", "test_scores.db", package = "cohortr"))

  }

  db

}
