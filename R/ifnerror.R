#' @title If-else Wrapper for Errors
#' @description Tests if an expression evaluates to an error, if so calls stopwarn
#' otherwise does whatever is given as argument.
#' @param expr expression to test for error.
#' @param noerror expression to be called if no error.
#' @param error one of 'warn' or 'stop', passed to stopwarn.
#' @param silent logical, if TRUE (default) then error returned silently.
#' @seealso \code{\link{stopwarn}}
#' @details Tests for an error or nerror (no error) from given expression. If an error is found
#' then either returns NULL with warning or breaks code. If nerror then returns the given expression.
#'
#' @examples
#' \dontrun{
#' ifnerror(1/2,print("Success"))
#' ifnerror(1/"a",print("Success"),"stop",silent = F)
#' }
#'
#' @export
ifnerror <- function(expr, noerror, error = "warn", silent = T){
  x = try(expr, silent)
  if(inherits(x, "try-error")){
    stopwarn(error, "Error not Nerror!")
  } else {
    noerror
  }
}
