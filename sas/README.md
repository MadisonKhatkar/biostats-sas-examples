# SAS Analysis: NHANES Sleep Duration and Blood Pressure

This folder contains a reproducible SAS analysis using data from the
National Health and Nutrition Examination Survey (NHANES) 2015–2018 cycles.

## Analysis Overview
The primary objective of this analysis is to evaluate the association
between self-reported sleep duration and mean systolic blood pressure (SBP)
among U.S. adults.

## Data Sources
Publicly available NHANES datasets were used, including:
- Demographics (DEMO)
- Sleep Disorders Questionnaire (SLQ)
- Blood Pressure (BPX, BPQ)
- Body Measures (BMX)
- Alcohol Use (ALQ)
- Smoking (SMQ)
- Diabetes (DIQ)
- Laboratory Measures (CBC, HDL, BIOPRO)

All data files are distributed by the CDC in XPT format and can be obtained
from the NHANES website.

## Key Methods
- Import of XPT files using SAS macros
- Merging multiple NHANES component datasets by participant identifier (SEQN)
- Data cleaning and exclusion based on missing or invalid values
- Creation of derived variables, including:
  - Mean systolic blood pressure
  - Categorical sleep duration groups (<6 hours, 6–8 hours, ≥8 hours)
- Descriptive statistics and visualization
- ANOVA and multivariable linear regression to assess associations between
  sleep duration and mean SBP while adjusting for demographic, behavioral,
  and clinical covariates

## Files
- `sas_nhanes_sleep_sbp_analysis.sas`  
  Main analysis script containing data import, cleaning, variable creation,
  and statistical modeling steps.

## Notes
- This script is intended as an example of graduate-level epidemiologic
  and biostatistical analysis using SAS.
- Data files are not included in this repository; users should download
  the required NHANES XPT files and update the project directory path
  accordingly.

