% Generated by roxygen2 (4.0.1): do not edit by hand
\name{archive.project.distance.retriever}
\alias{archive.project.distance.retriever}
\title{Returns the distance between a ProjectSummary instance and a list of
target ProjectSummary instances}
\usage{
archive.project.distance.retriever(source.project, target.projects.list,
  protein.count = 100)
}
\arguments{
\item{source.project.accession}{the accession for the source project}

\item{target.projects}{the number of project to consider - default is 10}

\item{protein.count}{the number of proteins to consider from each
project - default is 100}
}
\value{
The distances simplified as a vector
}
\description{
Returns the distance between a ProjectSummary instance and a list of
target ProjectSummary instances
}
\details{
TODO
}
\author{
Jose A. Dianes
}

