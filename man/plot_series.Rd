% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting.R
\name{plot_series}
\alias{plot_series}
\title{Generic Compartment Plot}
\usage{
plot_series(dt, compartment_order = c("S", "R", "I"))
}
\arguments{
\item{dt}{a \code{\link[data.table:data.table]{data.table::data.table()}} with column \code{t} (for simulation time),
optionally a \code{sample} column (for stochastic replicates), and overall in wide
format (each other column referring to compartment) or long format (having
\code{variable} and \code{value} columns, with \code{variable} indicating compartment and
\code{value} the value of that compartment at that time and optionally sample)}

\item{compartment_order}{a character vector, indicating the layer order for
the compartments. N.B. the "first" layer is the first layer drawn (i.e. the
bottom-most) and "last" is the last drawn (i.e. the top-most, typically most
visible).}
}
\description{
Provides a consistent plot of compartment model results across
all sessions.
}
\details{
This function is a convenient wrapper to create a
\code{\link[ggplot2:ggplot]{ggplot2::ggplot()}} object from typical series data output from example
simulations.
}
