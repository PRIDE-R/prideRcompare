#' Returns the Jaccard distance between two ProjectDetail instances
#'
#' @param project1.ProteinDetail the first protein details
#' @param project2.ProteinDetail the second protein details
#' @return The distance
#' @author Jose A. Dianes
#' @details TODO
#' @export
distance.ProteinDetail <- function(project1.ProteinDetail, project2.ProteinDetail) {
    project1.protein.accessions <- sapply(project1.ProteinDetail,accession)
    project2.protein.accessions <- sapply(project2.ProteinDetail,accession)
    accessions.intersect <- intersect(project1.protein.accessions,project2.protein.accessions)
    accessions.union <- union(project1.protein.accessions,project2.protein.accessions)
    
    jaccard.distance <- length(accessions.intersect) / length(accessions.union)
    
    return(jaccard.distance)
    
}

#' Returns the distance between a ProjectDetail instance and a list of target details
#'
#' @param source.ProteinDetail the firts protein details
#' @param target.list.ProteinDetail the target list
#' @return The distances simplified as a vector
#' @author Jose A. Dianes
#' @details TODO
#' @export
distance.list.ProteinDetail <- function(source.ProteinDetail, target.list.ProteinDetail) { 
    sapply(target.list.ProteinDetail, function(x) { distance.ProteinDetail(source.ProteinDetail,x)})   
}

