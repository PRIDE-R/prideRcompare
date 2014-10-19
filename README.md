prideRcompare
=============

An `R` package for comparing and clustering [PRIDE Archive](http://www.ebi.ac.uk/pride/archive) 
projects. 

This package makes use of the [prideR](https://github.com/jadianes/prider) package.  

### Installation  

First, we need to install `devtools`:  

    install.packages(devtools)
    library(devtools)
   
Then we just call  

    install_github(username="Bioanalytics", repo="prideRcompare")

### Usage  

#### Archive distance calculators

The following code  

    archive.accession.distance.retriever("PXD001034", project.count=100)
   
Returns the [*Jaccard similarity index*](http://en.wikipedia.org/wiki/Jaccard_index) 
between the PRIDE Archive project with accession `PXD001034` and the first 100 
projects returned by the PRIDE Archive web service (that currently are the 100 
most recent ones).  

We can use `ProjectDetail` objects in a similar way.  

#### Individual distances

Individual distances can be calculated using `distance.ProteinDetail` like in  

    p1034.protein.details <- get.list.ProteinDetail("PXD001034")
    p1156.protein.details <- get.list.ProteinDetail("PXD001156")
    distance.ProteinDetail(p1034.protein.details, p1156.protein.details)

Also applicable to lists using the function `distance.list.ProteinDetail` and
`distance.df.ProteinDetail`.  

#### Clustering  

We can cluster lists of `ProteinDetail` and `ProjectSummary` instances, although
in the end the clustering is always done on the protein details and therefore 
the later method uses the former one through the PRIDE Archive web service. In
order to be a good citizen, the recommenden usage is through `ProteinDetail` 
obtaining first the list of lists of protein details for each project.  

    cancer.projects.100 <- search.list.ProjectSummary("cancer", 100)
    cancer.projects.100.protein.details.100 <- lapply(cancer.projects.100, function(x) {get.list.ProteinDetail(accession(x), 100)})
    cancer.clusters.100.100 <- cluster.ProteinDetails(cancer.projects.100.protein.details.100, cancer.projects.100.accessions)

That will give us a hierarchical cluster objects (as generated by `hclust`) that
we can use to find out clusters (e.g. 5 clusters) using:

    cancer.projects.100.accessions <- sapply(cancer.projects.100, accession)
    cutree.labels(cancer.clusters.100.100, 5, cancer.projects.100.accessions)

Or just plot:

    plot(cancer.clusters.100.100, cancer.projects.100.accessions, main="Clustering of latest 100 cancer projects")



