#' @title  Count by group(s)

#' @description This function returns the counts of specified group(s) within a tibble,
#' sorted in decreasing order of count
#'
#' @export
#' @param data A tibble of interest the contains the data to pull counts from
#' @param ... A list of variables present in the tibble to group-by. When not present, returns the total count in the tibble
#' @return A tibble containing the summarized counts for each group in the variable(s) specified, sorted in decreasing order of count
#' @examples
#' group_counts(datateachr::vancouver_trees, neighbourhood_name)
#' datateachr::vancouver_trees %>% group_counts(neighbourhood_name)
#' group_counts(datateachr::vancouver_trees, neighbourhood_name, curb, height_range_id)
#' group_counts(tibble::as_tibble(iris), Species)

group_counts <- function(data, ...) {
  stopifnot(tibble::is_tibble(data))
  data %>%
    dplyr::group_by(...) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::arrange(dplyr::desc(count))
}
