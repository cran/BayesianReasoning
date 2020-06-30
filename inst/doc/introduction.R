## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dpi=300,
  fig.height = 10,
  fig.width=14
)

## ---- echo = FALSE, message = FALSE, results = 'hide'-------------------------
library(BayesianReasoning)

## ----heatmap------------------------------------------------------------------

PPV_heatmap(Min_Prevalence = 1,
            Max_Prevalence = 1000, 
            Sensitivity = 100, 
            Max_FP = 2, 
            Language = "en")
            

## ----NPV-heatmap--------------------------------------------------------------

PPV_heatmap(PPV_NPV = "NPV",
            Min_Prevalence = 800,
            Max_Prevalence = 1000, 
            Sensitivity = 80, 
            Max_FP = 5, 
            Language = "en")


## ----area---------------------------------------------------------------------

PPV_heatmap(Min_Prevalence = 1, Max_Prevalence = 1200, Sensitivity = 81, Max_FP = 5,
            label_subtitle = "Prenatal screening for Down Syndrome by Age",
            overlay = "area",
            overlay_labels = "40 y.o.",
            overlay_position_FP = 4.8,
            overlay_prevalence_1 = 1,
            overlay_prevalence_2 = 68)


## ----line---------------------------------------------------------------------
PPV_heatmap(Min_Prevalence = 1, Max_Prevalence = 1800, Sensitivity = 90, Max_FP = 15, 
            label_subtitle = "PPV of Mammogram for Breast Cancer by Age",
            overlay = "line", 
            overlay_labels = c("80 y.o.", "70 y.o.", "60 y.o.", "50 y.o.", "40 y.o.", "30 y.o.", "20  y.o."),
            overlay_position_FP = c(6.5, 7, 8, 9, 12, 14, 14),
            overlay_prevalence_1 = c(1, 1, 1, 1, 1, 1, 1),
            overlay_prevalence_2 = c(22, 26, 29, 44, 69, 227, 1667))
                

## ----line-2-------------------------------------------------------------------

PPV_heatmap(Min_Prevalence = 1, Max_Prevalence = 1200, Sensitivity = 81, Max_FP = 5,
            label_subtitle = "Prenatal screening for Down Syndrome by Age",
            overlay = "line",
            overlay_labels = c("40 y.o.", "35 y.o.", "30 y.o.", "25 y.o.", "20 y.o."),
            overlay_position_FP = c(4.8, 4.8, 4.8, 4.8, 4.8),
            overlay_prevalence_1 = c(1, 1, 1, 1, 1),
            overlay_prevalence_2 = c(68, 249, 626, 946, 1068))
                

## ----diagnostic---------------------------------------------------------------

PPV_diagnostic_vs_screening(Max_FP = 10, 
                            Sensitivity = 100, 
                            prevalence_screening_group = 1000, 
                            prevalence_diagnostic_group = 2)
                            

