params <-
list(package_creation = FALSE)

## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dpi = 60,
  fig.height = 10,
  fig.width = 14
)

## ---- echo = FALSE, message = FALSE, results = 'hide'-------------------------
library(BayesianReasoning)

# FROM: https://community.rstudio.com/t/internet-resources-should-fail-gracefully/49199/12
safely_show_image_Rmd <- function(remote_file, name_image) {
  try_GET <- function(x, ...) {
    tryCatch(
      httr::GET(url = x, httr::timeout(1), ...),
      error = function(e) conditionMessage(e),
      warning = function(w) conditionMessage(w)
    )
  }
  is_response <- function(x) {
    class(x) == "response"
  }
  
  # First check internet connection
  if (!curl::has_internet()) {
    message("No internet connection.")
    return(invisible(NULL))
  }
  # Then try for timeout problems
  resp <- try_GET(remote_file)
  if (!is_response(resp)) {
    message(resp)
    return(invisible(NULL))
  }
  # Then stop if status > 400
  if (httr::http_error(resp)) { 
    httr::message_for_status(resp)
    return(invisible(NULL))
  }
  
  # Output
  paste0("![", name_image, "](", remote_file, ")")
}


## ----echo=FALSE, results='asis'-----------------------------------------------

# If we are creating the README params$package_creation will be TRUE 
if (params$package_creation) {

  cat(paste0("[", safely_show_image_Rmd(remote_file = "https://www.r-pkg.org/badges/version/BayesianReasoning", name_image = "CRAN status"), "]", "(https://cran.r-project.org/package=BayesianReasoning)"))
  cat(paste0("[", safely_show_image_Rmd(remote_file = "https://codecov.io/gh/gorkang/BayesianReasoning/branch/master/graph/badge.svg", name_image = "Codecov test coverage"), "]", "(https://app.codecov.io/gh/gorkang/BayesianReasoning?branch=master)"))
  cat(paste0("[", safely_show_image_Rmd(remote_file = "http://cranlogs.r-pkg.org/badges/BayesianReasoning", name_image = "downloads"), "]", "(https://cran.r-project.org/package=BayesianReasoning)"))
  cat(paste0("[", safely_show_image_Rmd(remote_file = "https://img.shields.io/badge/lifecycle-experimental-orange.svg", name_image = "Lifecycle: experimental"), "]", "(https://lifecycle.r-lib.org/articles/stages.html#experimental)"))
  cat(paste0("[", safely_show_image_Rmd(remote_file = "https://zenodo.org/badge/93097662.svg", name_image = "DOI"), "]", "(https://zenodo.org/badge/latestdoi/93097662)"))

}

## ----heatmap------------------------------------------------------------------

PPV_heatmap(min_Prevalence = 1,
            max_Prevalence = 1000, 
            Sensitivity = 100, limits_Specificity = c(90, 100),
            Language = "en")
            

## ----NPV-heatmap--------------------------------------------------------------

PPV_heatmap(PPV_NPV = "NPV",
            min_Prevalence = 800, max_Prevalence = 1000, 
            Specificity = 95, limits_Sensitivity = c(90, 100),
            Language = "en")


## ----area---------------------------------------------------------------------

PPV_heatmap(min_Prevalence = 1, max_Prevalence = 1200, 
            Sensitivity = 81, 
            limits_Specificity = c(94, 100),
            label_subtitle = "Prenatal screening for Down Syndrome by Age",
            overlay = "area",
            overlay_labels = "40 y.o.",
            overlay_position_FP = 4.8,
            overlay_prevalence_1 = 1,
            overlay_prevalence_2 = 68)


## ----area2--------------------------------------------------------------------

PPV_heatmap(min_Prevalence = 1, max_Prevalence = 1200, 
            Sensitivity = 81, 
            limits_Specificity = c(94, 100),
            label_subtitle = "Prenatal screening for Down Syndrome by Age", 
            overlay_extra_info = TRUE,
            overlay = "area",
            overlay_labels = "40 y.o.",
            overlay_position_FP = 4.8,
            overlay_prevalence_1 = 1,
            overlay_prevalence_2 = 68)


## ----line---------------------------------------------------------------------

PPV_heatmap(min_Prevalence = 1, max_Prevalence = 1800, 
            Sensitivity = 90, 
            limits_Specificity = c(84, 100),
            label_subtitle = "PPV of Mammogram for Breast Cancer by Age",
            overlay = "line", 
            overlay_labels = c("80 y.o.", "70 y.o.", "60 y.o.", "50 y.o.", "40 y.o.", "30 y.o.", "20  y.o."),
            overlay_position_FP = c(6.5, 7, 8, 9, 12, 14, 14),
            overlay_prevalence_1 = c(1, 1, 1, 1, 1, 1, 1),
            overlay_prevalence_2 = c(22, 26, 29, 44, 69, 227, 1667))
                

## ----line-2-------------------------------------------------------------------

PPV_heatmap(min_Prevalence = 1, max_Prevalence = 2000, Sensitivity = 81, 
            limits_Specificity = c(94, 100),
            label_subtitle = "Prenatal screening for Down Syndrome by Age",
            overlay = "line",
            overlay_labels = c("40 y.o.", "30 y.o.", "20 y.o."),
            overlay_position_FP = c(4.8, 4.8, 4.8),
            overlay_prevalence_1 = c(1, 1, 1),
            overlay_prevalence_2 = c(68, 626, 1068))
                

## ----diagnostic---------------------------------------------------------------

PPV_diagnostic_vs_screening(max_FP = 10, 
                            Sensitivity = 100, 
                            prevalence_screening_group = 1000, 
                            prevalence_diagnostic_group = 2)
                            

