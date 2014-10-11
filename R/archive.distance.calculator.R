#' Returns the distance between a ProjectDetail instance and a list of target details
#'
#' @param source.project.accession the accession for the source project
#' @param project.count the number of project to consider - default is 10
#' @param protein.count the number of proteins to consider from each project - default is 100
#' @return The distances simplified as a vector
#' @author Jose A. Dianes
#' @details TODO
#' @export
archive.accession.distance.retriever <- function(source.project.accession, project.count=10, protein.count=100) {
    # first of all, get the source project protein details
    source.project.protein.details <- get.list.ProteinDetail(source.project.accession, protein.count)
    
    # now get the target project's
    target.project.list <- get.list.ProjectSummary(project.count)
    target.project.protein.detail.list <- lapply(target.project.list, function(x) { get.list.ProteinDetail(accession(x), protein.count)})
        
    # prepare results
    results <- data.frame(project.accession=sapply(target.project.list, accession))
    
    # calculate distances from source to each target
    results$distance <- distance.list.ProteinDetail(source.project.protein.details, target.project.protein.detail.list)
    
    results
    
}