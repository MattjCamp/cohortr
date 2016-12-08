#' Pull Data
#'
#' Pulls data from the active database instance or the provided dbr object.
#' @keywords database
#' @param sql The SQL code to be executed
#' @param db Specify different database (dbr object)
#' @export

pull_data <- function(sql, db_alt = NULL){

  if (is.null(db_alt)) {

    d <- tryCatch({

      d <- tibble::as_tibble(db$query(sql))
      d

      }, error = function(err) {

        db <<- cohortr::db_connect()
        d <- tibble::as_tibble(db$query(sql))
        d

        })

  } else {
      d <- tibble::as_tibble(db_alt$query(sql))
  }

  d

}
