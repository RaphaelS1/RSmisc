library(testthat)

context("Test Message")

msgFun <- function() message("Test Function")
noMsgFun <- function() return("Test Function")

test_that("message true",{
  expect_true(testMessage(msgFun()))
})

test_that("message false",{
  expect_false(testMessage(noMsgFun()))
})
