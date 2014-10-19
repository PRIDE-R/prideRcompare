#' Returns the distance between a project given by its accessions and the lates
#' archive projects given by the PRIDE Archive web service
#'
#' @param source.project.accession the accession for the source project
#' @param project.count the number of project to consider - default is 10
#' @param protein.count the number of proteins to consider from each 
#' project - default is 100
#' @return The distances simplified as a vector
#' @author Jose A. Dianes
#' @details TODO
#' @import prider
#' @export
archive.accession.distance.retriever <- function(source.project.accession, 
                                                 project.count=10, 
                                                 protein.count=100) {

    # first of all, get the source project protein details
    source.project <- get.ProjectSummary(
        source.project.accession)

    # now get the target project's
    target.projects.list <- get.list.ProjectSummary(project.count)

    # prepare results
    results <- archive.project.distance.retriever(
        source.project,
        target.projects.list,
        protein.count
        )

    return (results)
    
}

#' Returns the distance between a ProjectSummary instance and a list of 
#' target ProjectSummary instances
#'
#' @param source.project.accession the accession for the source project
#' @param target.projects the number of project to consider - default is 10
#' @param protein.count the number of proteins to consider from each 
#' project - default is 100
#' @return The distances simplified as a vector
#' @author Jose A. Dianes
#' @details TODO
#' @import prider
#' @export
archive.project.distance.retriever <- function( source.project, 
                                                target.projects.list, 
                                                protein.count=100) {
    
    # first of all, get the source project protein details
    source.project.protein.details <- get.list.ProteinDetail(
        accession(source.project), protein.count)
    
    # now get the target project's
    target.projects.protein.details.list <- lapply(
        target.projects.list, 
        function(x) { get.list.ProteinDetail(accession(x), protein.count)}
    )
    
    # prepare results
    results <- distance.df.ProteinDetail(
        source.project.protein.details,
        sapply(target.projects.list, accession),
        target.projects.protein.details.list
    )
    
    return (results)
    
}