#' @title Helper Function for Validation Errors
#' @description Matches error type to stop or warning and produces the respective error and
#' returns NULL.
#' @param error one of 'warn' or 'stop'. Taken as warning if not 'stop'.
#' @param error.msg string to parse as error message.
#' @return error if 'error' == 'stop'; NULL and warning otherwise.
#' @examples
#'
#' \dontrun{
#' if(2 > 1) stopwarn("warn", "This number is too big")
#' if(2 < 3) stopwarn("stop", "This number is too small")
#' }
#'
#' @export
stopwarn <- function(error = "warn", error.msg){
  checkmate::assert(error == "warn", error == "stop",
                    .var.name = "'error' should be one of 'warn' or 'stop'.")
  if(error == "stop")
    stop(error.msg)
  else{
    warning(error.msg, call. = F)
    return(NULL)
  }
}
