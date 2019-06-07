#' @title If-else Wrapper for Errors
#' @description Tests if an expression evaluates to an error, if so calls stopwarn
#' otherwise does whatever is given as argument.
#' @param expr expression to test for error.
#' @param noerror expression to be called if no error.
#' @param error one of 'warn', 'stop', or an expression. See Details.
#' @param silent logical, if TRUE (default) then error returned silently.
#' @seealso \code{\link{stopwarn}}
#' @details Tests for an error or nerror (no error) from given expression. If an error is found
#' then either calls stopwarn if 'warn', 'stop' or 'NULL' are supplied, otherwise evaluates
#' the given expression. If nerror then returns the given expression.
#'
#' @examples
#' \dontrun{
#' ifnerror(1/2,print("Success"))
#' ifnerror(1/"a",print("Success"),"stop",silent = F)
#' ifnerror(1/"a",print("Nerror"),print("Error!"),silent = T)
#' }
#'
#' @export
ifnerror <- function(expr, noerror, error = NULL, silent = T){
  x = try(expr, silent)
  if(inherits(x, "try-error")){
    if(is.null(error) | error == "warn")
      stopwarn("warn", "Error not Nerror!")
    else if(error == "stop")
      stopwarn("stop", "Error not Nerror!")
    else
      error
  } else {
    noerror
  }
}
