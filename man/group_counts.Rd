% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/groupCounts.R
\name{group_counts}
\alias{group_counts}
\title{Count by group(s)}
\usage{
group_counts(data, ...)
}
\arguments{
\item{data}{A tibble of interest the contains the data to pull counts from}

\item{...}{A list of variables present in the tibble to group-by. When not present, returns the total count in the tibble}
}
\value{
A tibble containing the summarized counts for each group in the variable(s) specified, sorted in decreasing order of count
}
\description{
This function returns the counts of specified group(s) within a tibble,
sorted in decreasing order of count
}
\examples{
group_counts(datateachr::vancouver_trees, neighbourhood_name)
datateachr::vancouver_trees \%>\% group_counts(neighbourhood_name)
group_counts(datateachr::vancouver_trees, neighbourhood_name, curb, height_range_id)
group_counts(tibble::as_tibble(iris), Species)
}
