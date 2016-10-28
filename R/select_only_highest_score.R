
#' Selects Highest Score
#'
#' Selects distinct examinees with the highest score
#' @keywords database, state, location
#' @param sql SQL code from a cohort sample
#' @export
#' @examples
#' @return A data frame with distinct cohort records

select_only_highest_score <- function(sample_sql,
                                      by_exam = FALSE){

  library(magrittr)

  if (by_exam) {
    sample_sql[1] %>%
    coderr::code_sql_select(select.cols = c("person","year", "exam", "max(score) as score", "tg","us","location","school","district","sector","race","gender","waiver"),
                            group.by.cols = c("person","year", "exam", "tg","us","location","school","district","sector","race","gender","waiver"))
  } else {
    sample_sql[1] %>%
    coderr:: code_sql_select(select.cols = c("person","year", "'ap' as exam", "max(score) as score", "tg","us","location","school","district","sector","race","gender","waiver"),
                             group.by.cols = c("person","year", "tg","us","location","school","district","sector","race","gender","waiver"))
  }
}
