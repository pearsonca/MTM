% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stochdisc_functions.R
\name{stochdisc_sample}
\alias{stochdisc_sample}
\title{Sample a Discrete Stochastic Simulation}
\usage{
stochdisc_sample(
  n,
  parms,
  func = stochdisc_dReedFrost,
  setup_fun = function(ps) c(S = ps$N - 1, I = 1, R = 0),
  ref_seed = 0
)
}
\arguments{
\item{n}{an integer; how many samples?}

\item{parms}{a list of parameters to pass to \code{func}.}

\item{func}{a function that computes the change in state; see
\code{\link[deSolve:ode]{deSolve::ode()}} for details of the function signature.}

\item{ref_seed}{a random seed reference value; each sample run seed is offset
from this value}

\item{setup_func}{a function to create new populations}
}
\value{
a \code{\link[data.table:data.table]{data.table::data.table()}}, with a \code{sample} column
(\code{integer}, 1:\code{n}) & columns from \code{\link[=stochdisc_solve]{stochdisc_solve()}}
}
\description{
Sample a Discrete Stochastic Simulation
}
\examples{
require(MTM)
ps <- list(N = 100, p = 0.02)
samples.dt <- stochdist_sample(100, parms = ps)
# final sizes:
samples.dt[, .(final_size = R[.N]), by=sample]

}
\seealso{
Other stochdisc: 
\code{\link{stochdisc_dReedFrost}()},
\code{\link{stochdisc_solve}()}
}
\concept{stochdisc}
