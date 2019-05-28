library(testthat)

context("strprint")

ClassExample <- R6::R6Class("ClassExample",public=list(
 strprint = function() return("Test")))

test_that("strprint.R6",{
  expect_equal(strprint(ClassExample$new()),"Test")
})

test_that("strprint.list",{
  expect_equal(strprint(list(ClassExample$new(),ClassExample$new())),list("Test","Test"))
})
