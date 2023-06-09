% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/network_functions.R
\name{network_sample_ReedFrost}
\alias{network_sample_ReedFrost}
\title{sample a series of Reed-Frost SIR simulations}
\usage{
network_sample_ReedFrost(
  n,
  parms,
  func = network_dReedFrost,
  setup_fun = network_build,
  ref_seed = 0
)
}
\arguments{
\item{n}{an integer; how many samples?}

\item{parms}{parameters passed to \code{func}.}

\item{func}{an R function, defined as \verb{function(t, y, parms, ...)}, which
returns a graph capturing state changes. The graph must have the same
vertices and edges as in \code{y}, but can have different attributes.}

\item{ref_seed}{a random seed reference value; each sample run seed is offset
from this value}

\item{setup_func}{a function to create new networks; must have the same
signature as \url{network_build}}
}
\value{
a \link[data.table:data.table]{data.table::data.table}, a sample column (integer, 1:\code{n}) &
columns from \link{network_flatten}
}
\description{
sample a series of Reed-Frost SIR simulations
}
