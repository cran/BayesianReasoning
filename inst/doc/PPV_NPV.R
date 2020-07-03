## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  # dpi=300,
  fig.height = 7,
  fig.width=10
)

## ---- echo = FALSE, message = FALSE, results = 'hide'-------------------------
library(BayesianReasoning)
library(patchwork)

## -----------------------------------------------------------------------------

  PPV_plot = PPV_heatmap(
    Min_Prevalence = 1,
    Max_Prevalence = 80,
    Sensitivity = 95,
    Max_FP = 15,
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
    Min_Prevalence = 1,
    Max_Prevalence = 80,
    Sensitivity = 90,
    Max_FP = 12.1,
    overlay = "area",
    overlay_prevalence_1 = 1,
    overlay_prevalence_2 = 69,
    overlay_position_FN = 5,
    label_title = "NPV",
    label_subtitle = "Screening test"
  )


## ---- fig.height = 12, fig.width=10-------------------------------------------

  (PPV_plot / NPV_plot) +  plot_layout(guides = 'collect')


