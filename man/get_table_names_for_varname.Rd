% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/petable.R
\name{get_table_names_for_varname}
\alias{get_table_names_for_varname}
\title{Get Table Names for a Given Variable Name}
\usage{
get_table_names_for_varname(con, varname, series = NULL)
}
\arguments{
\item{con}{A database connection object.}

\item{varname}{The name of the variable to search for in the \code{variable_names_epcf} table.}

\item{series}{Optional. The series to filter the tables by their \code{Begin.Year}. Default is NULL.}
}
\value{
A data frame with the selected \code{Data.File.Name} and \code{Begin.Year}.
}
\description{
This function fetches the table names from a database for a given variable name
and optionally for a specific series. It retrieves the \code{Data.File.Name} for each unique
year, and if there are multiple tables for a given year, it selects the table with the most rows.
}
\details{
This function performs the following steps:
\enumerate{
\item Filters the \code{variable_names_epcf} table to get the \code{Data.File.Name} and \code{Begin.Year} for the given \code{varname}.
\item If \code{series} is provided, filters the tables by the year associated with the series.
\item Groups the tables by \code{Begin.Year} and counts the number of tables for each year.
\item For each year, if there is only one table, it selects that table. If there are multiple tables, it counts the number of rows in each table and selects the table with the most rows.
}
}
\examples{
\dontrun{
# Assuming you have a database connection `con`:
con <- dbConnect(RSQLite::SQLite(), ":memory:")

# Get table names for a variable name "your_variable_name":
get_table_names_for_varname(con, "your_variable_name")

# Get table names for a variable name "your_variable_name" and series "your_series":
get_table_names_for_varname(con, "your_variable_name", series = "your_series")
}

}
