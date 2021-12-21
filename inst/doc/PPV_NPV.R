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
library(patchwork)

## -----------------------------------------------------------------------------

  PPV_plot = PPV_heatmap(
    min_Prevalence = 1, max_Prevalence = 80, 
    Sensitivity = 95,
    limits_Specificity = c(85, 100),
    overlay = "area",
    overlay_prevalence_1 = 1,
    overlay_prevalence_2 = 69,
    overlay_position_FP = 12.1,
    label_title = "PPV",
    label_subtitle = "Screening test"
  )    



## -----------------------------------------------------------------------------

  NPV_plot = PPV_heatmap(
    PPV_NPV = "NPV",
    min_Prevalence = 1,
    max_Prevalence = 80,
    Specificity = 87.9,
    overlay = "area",
    overlay_prevalence_1 = 1,
    overlay_prevalence_2 = 69,
    overlay_position_FN = 5,
    label_title = "NPV",
    label_subtitle = "Screening test"
  )


## ---- fig.height = 14, fig.width = 12-----------------------------------------

  (PPV_plot / NPV_plot) +  plot_layout(guides = 'collect')


