#' @title Generalised Validation Functions
#'
#' @description These functions are generalised and simplified based on the package \code{checkmate}.
#'   They are used primarily for the function \code{\link{makeChecks}} that automatically generates
#'   checkmate-style custom validation functions.
#'
#' @return \code{assertThat} returns self invisibly if checks pass, otherwise error
#' @usage assertThat(x, cond, errormsg)
#'
#' @param x Object to perform checks on
#' @param cond Boolean condition to check
#' @param errormsg Error message to produce
#'
#' @seealso \code{\link[checkmate]{assert}}
#'
#' @examples
#' x = 1:10
#' cond = inherits(x, "integer")
#' errormsg = "Not integer"
#' assertThat(x, cond, errormsg)
#' checkThat(cond, errormsg)
#' testThat(cond)
#' isThat(cond)
#'
#' @export
assertThat <- function(x, cond, errormsg){
  if(cond)
    invisible(x)
  else
    stop(errormsg)
}

#' @name checkThat
#' @rdname assertThat
#' @return \code{checkThat} returns TRUE if checks pass, otherwise error message as string
#' @usage checkThat(cond, errormsg)
#' @export
checkThat <- function(cond, errormsg){
  if(cond)
    return(TRUE)
  else
    return(errormsg)
}

#' @name testThat
#' @rdname assertThat
#' @return \code{testThat} returns TRUE if checks pass, otherwise FALSE
#' @usage testThat(cond)
#' @export
testThat <- function(cond){
  if(cond)
    return(TRUE)
  else
    return(FALSE)
}

#' @name isThat
#' @rdname assertThat
#' @return \code{isThat} returns TRUE if checks pass, otherwise FALSE
#' @usage isThat(cond)
#' @export
isThat <- function(cond){
  return(testThat(cond))
}
