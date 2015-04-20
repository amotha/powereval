shinyUI(navbarPage("powereval",
  tabPanel("Two-Sample Proportions",
   sidebarLayout(
     sidebarPanel(
       conditionalPanel(
         condition="input.conditionedPanels==1 | input.conditionedPanels==3",
         sliderInput("Nrange", label = h6("Range of sample size"),
                     min=20, max=4000,step=100, value=c(1000,2000), sep = ""),
         sliderInput("RRrange", label=h6("Range of risk ratio (RR)"),
                     min=0.1, max=1.0, value=c(0.6,0.8), step=0.1),
         numericInput("nratio", label = h6("Exposure prevalence ratio = n2/n1"), value=0.1, min=0.1, max=20, step=0.1),
         helpText(h6('n1= sample size un-exposed and n2=sample size exposed')),
         numericInput("p1", label = h6("Proportion with outcome in un-exposed (p1)"), value=0.2, min=0.1, max =0.9, step=0.1)),
       conditionalPanel(
         condition="input.conditionedPanels==2 | input.conditionedPanels==4",
         sliderInput("p1range", label=h6("Range of proportion with outcome in un-exposed (p1)"),
                     min=0.1, max=0.9, value=c(0.1,0.9), step=.1),
         sliderInput("nratiorange", label=h6("Range of Exposure Prevalence Ratio (nratio)"),
                     min=0.1, max=20, value=c(0.1,0.3), step=.1),
         helpText(h6('Exposure Prevalence Ratio (nratio) = n2/n1 where n1=size of un-exposed group and n2=size of exposed group')),
         numericInput("RR", label = h6("Risk Ratio"), value=0.8, min=0.1, max =0.9, step=0.1),
         numericInput("power", label=h6("Power"), value=0.8, min=0.1, max =0.9, step=0.1)),
       conditionalPanel(
         condition="input.conditionedPanels==1 | input.conditionedPanels==2 | input.conditionedPanels==3 | 
         input.conditionedPanels==4",
         numericInput("alpha", "Significance level (0.05, 0.01, 0.001)", value=0.05, min=0.001, max =0.05))),
     mainPanel(
       tabsetPanel(
         tabPanel("Description", value=5, h3("Power and Sample Size for Two-Sample Proportions Test"),
                  p('The goal of this analysis is to determine the sample size required or evaluate the power for a test intended to
                      determine if there is an association between the probability of an outcome of interest and the level of the 
                      exposure factor. The computations are based on the ',strong('Pearson-s chi-squared test') ,' for two independent 
                      binomial populations and are performed for a two-sided hypothesis test.'),
                  br(),
                  h4('Parameters used in the computations'),
                  p('These parameters are all inter-related such that if you know some you can estimate the others so need not provide 
                    all to get power/sample size.'),
                  p(strong('Risk-ratio:'), 'corresponds to the smallest reduction in the risk (effect size) that one would like to be able to
                     detect, e.g. effect size of 20% => RR of 80%'),
                  p(strong('alpha'), ':Confidence level desired'),
                  p('Level of ', strong('power'), 'desired'),
                  p(strong('n1'), ' and/or', strong('n2'),': sample sizes in the un-exposed and exposed groups respectivelly, corresponding to prevalence of
                    the exposure'),
                  p(strong('p1'),' and/or ', strong('p2'), ': proportion developing the outcome in the unexposed group and exposed group respectively (usually estimated from previous
                    research'),
                  p(strong('nratio'),': ratio of un-exposed subjects to exposed subjects (n2/n1)')),
         tabPanel("Power vs N vs RR Plot", value=3, h4("Power vs N over RR plot"),
                  p('Evaluate the ', strong('power'), ' for a range of sample sizes and effect sizes given a fixed value of other study 
                    parameters.'), plotOutput("powPlotP", width=900)),
         tabPanel("p1 vs N vs nratio Plot", value=4, h4("p1 vs N over nratio plot"),
                  p('Compute the ', strong('sample size'), ' for a range of control-group (unexposed) proportions developing the 
                      outcome and a range of exposure prevalence ratios (n2/n1), given a fixed value of other study parameters.'),
                  plotOutput("powPlotN", width=900)),
         tabPanel("Power vs N vs RR Table", value=1, h4("Power vs N over RR table"),
                  p('Evaluate the ', strong('power'), ' for a range of sample sizes and effect sizes given a fixed value of other study 
                    parameters.'), dataTableOutput("powTableP")),
         tabPanel("p1 vs N vs nratio Table", value=2, h4("p1 vs N over nratio table"),
                  p('Compute the ', strong('sample size'), ' for a range of control-group (unexposed) proportions developing the 
                      outcome and a range of exposure prevalence ratios (n2/n1), given a fixed value of other study parameters.'), 
                  dataTableOutput("powTableN")),
         id="conditionedPanels"))))             
))
