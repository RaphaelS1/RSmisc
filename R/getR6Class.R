#' @title Get R6 Class Name
#' @description Gets the name of the given R6 object
#' @param object R6 object.
#' @param classname logical, if TRUE (default), returns the name of the class otherwise returns the class.
#' @param n.par numeric, which class should be returned? By default returns the class of the object, increasing
#' the number returns parents of the class (if applicable).
#' @param pos environment to search in, default is -1 (current)
#' @return string giving R6 class name.
#' @details The function works for R6 objects not classes. If the function fails make sure the
#' class is first constructed. This is a wrapper for class(object) when the object may have multiple
#' levels of inheritance, additionally it ensures the correct classname is used in case of a complex
#' naming scheme.
#'
#' @examples
#' parent <- R6::R6Class("parent")
#' child <- R6::R6Class("child",inherit = parent)
#' getR6Class(child$new(), n.par = 0)
#' getR6Class(child$new(), n.par = 1)
#' getR6Class(parent$new(), FALSE, n.par = 0)
#'
#' \dontrun{
#' getR6Class(parent$new(), parent = 1)
#' }
#'
#' @export
getR6Class <- function(object, classname = TRUE, n.par = 0, pos = -1){
  if(classname)
    return(get(class(object)[[n.par+1]], pos = pos)$classname)
  else
    return(get(class(object)[[n.par+1]], pos = pos))
}
