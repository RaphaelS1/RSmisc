% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assertThat.R
\name{assertThat}
\alias{assertThat}
\alias{checkThat}
\alias{testThat}
\alias{isThat}
\title{Generalised Validation Functions}
\usage{
assertThat(x, cond, errormsg)

checkThat(cond, errormsg)

testThat(cond)

isThat(cond)
}
\arguments{
\item{x}{Object to perform checks on}

\item{cond}{Boolean condition to check}

\item{errormsg}{Error message to produce}
}
\value{
\code{assertThat} returns self invisibly if checks pass, otherwise error

\code{checkThat} returns TRUE if checks pass, otherwise error message as string

\code{testThat} returns TRUE if checks pass, otherwise FALSE

\code{isThat} returns TRUE if checks pass, otherwise FALSE
}
\description{
These functions are generalised and simplified based on the package \code{checkmate}.
  They are used primarily for the function \code{\link{makeChecks}} that automatically generates
  checkmate-style custom validation functions.
}
\examples{
x = 1:10
cond = inherits(x, "integer")
errormsg = "Not integer"
assertThat(x, cond, errormsg)
checkThat(cond, errormsg)
testThat(cond)
isThat(cond)

}
\seealso{
\code{\link[checkmate]{assert}}
}
