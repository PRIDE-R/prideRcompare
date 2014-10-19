#' Returns a list of clusters given a list of prideR projects as an input.
#' That is, culsters the projects given as an input using hierarchical 
#' clustering and the distance.ProteinDetail function
#'
#' @param projects the projects summaries
#' @param protein.count the number of proteins to consider from each 
#' project - default is 100
#' @param method the clustering method as specified in 'hclust' - default 
#' is 'complete'
#' @return The list of clusters
#' @author Jose A. Dianes
#' @details TODO
#' @export
cluster.ProjectSummary <- function(projects, protein.count=100, method="complete") {
    projects.protein.details <- 
        lapply(
            projects,
            function(x) { get.list.ProteinDetail(accession(x), protein.count)}
            )
    project.accessions <- sapply(projects, function(x) { accession })
    return (cluster.ProteinDetails(projects.protein.details, project.accessions, method))
}

#' Returns a list of clusters given a list of lists of ProteinDetails as 
#' an input.
#'
#' @param protein.details the protein details to cluster
#' @param method the clustering method as specified in 'hclust' - default 
#' is 'complete'
#' @return The list of clusters
#' @author Jose A. Dianes
#' @details TODO
#' @export
cluster.ProteinDetails <- function(protein.details, method="complete") {
    dist.matrix <- dist(distance.matrix.ProteinDetails(protein.details))
    clusters <- hclust(dist.matrix, method)
    return (clusters)
}

#' Returns a distance matrix for a given protein details list
#'
#' @param protein.details the list of protein details
#' @return The distnace matrix
#' @author Jose A. Dianes
#' @details TODO
#' @export
distance.matrix.ProteinDetails <- function(protein.details) {
    sapply(protein.details, function(x) {distance.list.ProteinDetail(x,protein.details)})
}

#' Returns a list of lists of projects given by a hierarchical cluster object 
#' and a number of clusters to consider
#'
#' @param clusters the cluster object as produced by hclust
#' @param count the number clusters to consider
#' @param labels the prideR projects that produced the clusters
#' @return The projects grouped by cluster
#' @author Jose A. Dianes
#' @details TODO
#' @export
cutree.labels <- function(clusters, count, labels) {
    cu <- cutree(clusters, count)
    result <- lapply(seq(1:count), function(i) {labels[cu==i]})
    
    return (result)
}