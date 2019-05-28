library(testthat)

context("makeChecks")

test_that("checks",{
  expect_silent(makeChecks(assertionName = "Numeric",
                           cond = inherits(x,"numeric"),
                           errormsg = paste(x,"is not numeric"), pos = 1))
  expect_silent(assertNumeric(as.numeric(0)))
  expect_true(checkNumeric(as.numeric(1)))
  expect_false(testNumeric("a"))
  expect_false(isNumeric("a"))
})
