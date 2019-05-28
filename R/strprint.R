#' @title String Representation of Print
#' @name strprint
#' @description Extends S3 dispatch of strprint to lists and any R6 class.
#' @details strprint is a suggested method that should be included in all R6 classes to be passed to
#' methods such as \code{cat}, \code{summary} and \code{print}. Additionally can be used to easily
#' parse R6 objects into data-frames, see examples.
#'
#' @param x R6 object
#' @param ... Additional arguments
#' @usage strprint(x,...)
#'
#' @examples
#' ClassExample <- R6::R6Class("ClassExample",public=list(
#' strprint = function() return("Test"),
#' print = function() print(strprint)))
#' ce = ClassExample$new()
#' print(ce)
#' data.frame(A = strprint(ce))
#' strprint(ce)
#' strprint(list(ce,ce))
#'
#' @export
strprint <- function(x,...){
  UseMethod("strprint", x)
}

#' @rdname strprint
#' @export
strprint.R6 <- function(x,...){
  return(x$strprint())
}

#' @rdname strprint
#' @export
strprint.list <- function(x,...){
  return(lapply(x,strprint))
}

