prideRcompare
=============

An `R` package for comparing, and clustering [PRIDE Archive](http://www.ebi.ac.uk/pride/archive) 
projects. 

This package makes use of the [prideR](https://github.com/jadianes/prider) package.  

### Installation  

First, we need to install `devtools`:  

    install.packages(devtools)
    library(devtools)
   
Then we just call  

    install_github(username="Bioanalytics", repo="prideRcompare")

### Usage  

The following code  

    archive.accession.distance.retriever("PXD001034", project.count=100)
   
Returns the [*Jaccard similarity index*](http://en.wikipedia.org/wiki/Jaccard_index) 
between the PRIDE Archive project with accession `PXD001034` and the first 100 
projects returned by the PRIDE Archive web service (that currently are the 100 
most recent ones).  

Individual distances can be calculated using `distance.ProteinDetail` like in  

    p1034.protein.details <- get.list.ProteinDetail("PXD001034")
    p1156.protein.details <- get.list.ProteinDetail("PXD001156")
    distance.ProteinDetail(p1034.protein.details, p1156.protein.details)

Also applicable to lists using the function `distance.list.ProteinDetail`.  

