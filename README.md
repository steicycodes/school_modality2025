# The Switch: Determinants of Family School Modality Choices during the COVID-19 Pandemic

This repository contains the reproduction code for an honors thesis examining K-12 enrollment transitions in the United States between 2020 and 2024. The research focuses on the movement between public, private, and homeschooling sectors during the pandemic period.

## Research Summary

The study utilizes discrete choice duration models and multinomial logistic regressions to identify familial characteristics associated with school switching. It investigates how socioeconomic factors, geographic location, and attitudinal leanings influenced parental decision-making during the COVID-19 crisis.

### Key Findings
* **Urbanicity**: Families in urban environments were significantly more likely to report private schooling compared to those in rural areas.
* **Income**: High-income households showed greater mobility toward private options, while low-income households had the highest rates of transitioning into homeschooling.
* **Political & Media Trust**: Trust in Fox News was a strong predictor for exiting public schools in early phases of the pandemic.
* **Persistence**: Approximately 43% of public school starters who switched modes had not returned to public schools by the end of the observation period.

## Data and Methodology

The project employs data from the **Understanding America Study (UAS)**, specifically the **Understanding Coronavirus in America (UCA)** panel.

* **Sample**: 3,975 unique respondents across 33,832 total observations.
* **Temporal Scope**: The analysis is divided into four phases, spanning from the initial pandemic shock in April 2020 to stabilization in February 2024.

## Reproduction Methodology

### Data Cleaning and Processing
* Merging 14 UCA datasets and 5 post-pandemic waves (UAS 461, 475, 502, 559, 584).
* Handling missing urbanicity and political data merged from the UAS U.S. Election Longitudinal Study.
* Generating the perceived COVID-19 risk factor variable using estimated chances of contracting and dying from the virus.
* Constructing an exposure to remote learning variable at the census tract level.

### Statistical Analysis
* **Discrete Choice Duration Models**: Executed in Stata to determine how long public school starters "survive" in the public school system.
* **Multinomial Logistic Regressions**: Executed in Stata to analyze the probability of choosing specific school types across the four phases.
* **Random Forest Robustness**: Flexible machine learning models executed in Python to ensure consistency across methods.
* **Data Visualization**: Alluvial diagrams and plots generated in R to visualize student movement.
