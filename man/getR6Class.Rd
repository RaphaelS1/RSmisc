% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getR6Class.R
\name{getR6Class}
\alias{getR6Class}
\title{Get R6 Class Name}
\usage{
getR6Class(object, classname = TRUE, n.par = 0, pos = -1)
}
\arguments{
\item{object}{R6 object.}

\item{classname}{logical, if TRUE (default), returns the name of the class otherwise returns the class.}

\item{n.par}{numeric, which class should be returned? By default returns the class of the object, increasing
the number returns parents of the class (if applicable).}

\item{pos}{environment to search in, default is -1 (current)}
}
\value{
string giving R6 class name.
}
\description{
Gets the name of the given R6 object
}
\details{
The function works for R6 objects not classes. If the function fails make sure the
class is first constructed. This is a wrapper for class(object) when the object may have multiple
levels of inheritance, additionally it ensures the correct classname is used in case of a complex
naming scheme.
}
\examples{
parent <- R6::R6Class("parent")
child <- R6::R6Class("child",inherit = parent)
getR6Class(child$new(), n.par = 0)
getR6Class(child$new(), n.par = 1)
getR6Class(parent$new(), FALSE, n.par = 0)

\dontrun{
getR6Class(parent$new(), parent = 1)
}

}
