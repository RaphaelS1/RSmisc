#' @title Automatic Generation of Validaton Functions
#'
#' @description This function uses the generalised assertion functions to assign assert/check/test/is
#' functions to the given environment for quick deployment of validation checks. See examples
#' for how it is used in distr6.
#'
#' @usage makeChecks(assertionName, cond, errormsg, args = alist(x=),
#'   pos = -1)
#'
#' @param assertionName name that follows assert/check/test/is
#' @param cond Boolean condition to check
#' @param errormsg Error message to produce
#' @param args Generic argument names for object to validate. See Details.
#' @param pos Environment position to assign functions to. See Details.
#'
#' @examples
#'  makeChecks(assertionName = "Numeric",
#'      cond = inherits(x,"numeric"),
#'      errormsg = paste(x,"is not numeric"), pos = 1)
#'  assertNumeric(as.numeric(0)) # silent
#'  checkNumeric(as.numeric(1)) # TRUE
#'  testNumeric("a") # FALSE
#'  isNumeric("2") # FALSE
#'
#' @details This generates simplified version of more complex assertion and validation
#'   functions that can be found in libraries such as \code{\link{checkmate}}. The purpose
#'   of which is to easily define validation checks that are used throughout distr6.
#'
#'   By default, validations are only made in relation to one argument however this can be
#'    extended by adding arguments to the \code{args} parameter. For example, \code{args = alist(x=, y=,...)}.
#'    Validation functions are assigned to the current parent environment, which is often .GlobalEnv
#'    however when loading and attaching libraries, it is the current library being loaded.
#'
#' @export
makeChecks <- function(assertionName, cond, errormsg, args = alist(x=),
                       pos = -1){
  cond = substitute(cond)
  errormsg = substitute(errormsg)
  value = function(x){}
  formals(value) = args
  body(value) = substitute(assertThat(x,arg1,arg2),list(arg1=cond,arg2=errormsg))
  assign(paste0("assert",assertionName), value = value,
         pos = pos)

  body(value) = substitute(checkThat(arg1,arg2),list(arg1=cond,arg2=errormsg))
  assign(paste0("check",assertionName), value = value,
         pos = pos)

  body(value) = substitute(testThat(arg1),list(arg1=cond))
  assign(paste0("test",assertionName), value = value,
         pos = pos)

  body(value) = substitute(isThat(arg1),list(arg1=cond))
  assign(paste0("is",assertionName), value = value,
         pos = pos)
}
