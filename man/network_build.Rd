% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/network_functions.R
\name{network_build}
\alias{network_build}
\title{Base SIR network for networks exercises}
\usage{
network_build(parms)
}
\arguments{
\item{parms, }{a \code{list(N = integer, p = probability)}; the Reed-Frost model
parameters.}
}
\value{
an \link{igraph}, fully connected, with undirected edges, and \code{parms$N}
vertices. Initialized with one \emph{I}nfectious vertex, and \code{\link[igraph:edge_attr]{igraph::edge_attr()}}
\code{draw}, a random deviate on (0, 1).
}
\description{
Base SIR network for networks exercises
}
\details{
Note, this step actually performs all the relevant random number
draws, therefore to get matching results (e.g. to compare to other students)
the random number seed must be set ahead of calling this
}
\section{Asides}{

Note that in the function body, the first vertex is set to "I".
Does it matter which individual is set to "I"? Why or why not?

The function uses \code{V(network)$state <- "S"} because its
more obvious for beginners what that does. However, why might
e.g. \code{V(network)$state <- network$states[1]} be preferable? Where else
in the \code{MTM::network_...} function definitions would that pattern also
be preferred?

In the Reed-Frost model, how many times does a particular connection
between individuals need to be considered for transmission? What are some
model additions (\emph{e.g.} different transitions) that would change how many
times a connection is tested?
}

\examples{
require(MTM)

# repeat these next steps a few times, w/ different `N`
# to see how `network_build()` works.
sirpop <- network_build(list(N=30, p=0.2))
network_quickplot(sirpop, edgeargs = list(), vertexargs = list())

}
