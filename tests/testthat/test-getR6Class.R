# library(testthat)
#
# context("getR6Class")
#
# parent <- R6::R6Class("parent")
# child <- R6::R6Class("child",inherit = parent)
#
# test_that("getR6Class",{
#   parent <- R6::R6Class("parent")
#   child <- R6::R6Class("child",inherit = parent)
#   expect_equal(getR6Class(child$new(), n.par = 0),"child")
#   expect_equal(getR6Class(child$new(), n.par = 1),"parent")
#   expect_equal(class(getR6Class(parent$new(), F, n.par = 0)),"R6ClassGenerator")
#   expect_error(getR6Class(parent$new(), n.par = 1))
# })
