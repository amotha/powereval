# powereval

powereval is a shiny app that enables interactive computation of the sample size required or evaluation of the power for a
test intended to determine if there is an association between the probability of an outcome of interest and the level of 
the exposure factor. In other words, Power and Sample Size for Two-Sample Proportions Test. The computations are based on 
the Pearson-s chi-squared test for two independent binomial populations and are performed for a two-sided hypothesis test. 

## Parameters used in the computations

These parameters are all inter-related such that if you know some you can estimate the others so need not provide all to 
get power/sample size.

* Risk-ratio: corresponds to the smallest reduction in the risk (effect size) that one would like to be able to detect, 
e.g. effect size of 20% => RR of 80%
* alpha :Confidence level desired
* Level of power desired
* n1 and/or n2 : sample sizes in the un-exposed and exposed groups respectivelly, corresponding to prevalence of the 
exposure
* p1 and/or p2 : proportion developing the disease in the unexposed group and exposed group respectively (usually 
estimated from previous research
* nratio : ratio of un-exposed subjects to exposed subjects (n2/n1)

## Packages required

powereval makes use of:
* Power and Sample Size for Two-Sample Binomial Test from [Hmisc](https://github.com/harrelfe/Hmisc.git),
* a grammar of graphics from [ggplot2](http://github.com/hadley/ggplot2),
* reactive programming from [shiny](http://github.com/rstudio/shiny),
* data transformation pipelines from [dplyr](http://github.com/hadley/dplyr).

## Installation 

Install the latest release version  of the packages below from CRAN with:

```R
install.packages("ggplot2")
install.packages("plyr")
install.packages("dplyr")
install.packages("Hmisc")
```
