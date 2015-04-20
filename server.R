#call functions from the R script 'pss_sunctions.R'
source('pss_functions.R')

library(ggplot2)
library(Hmisc)
library(plyr)
library(dplyr)

shinyServer(function(input,output){ 
  plotInput.power <- reactive({
    power.out <- powerChiP(min(input$Nrange),max(input$Nrange),min(input$RRrange),max(input$RRrange),input$alpha,
                           input$nratio,input$p1)
  })

  output$powTableP <- renderDataTable(
    power01 <- plotInput.power() %>% mutate(N=as.factor(N), n1=as.factor(n1), n2=as.factor(n2)),
    options=list(searching=FALSE))

  output$powPlotP <- renderPlot({
    ggplot(plotInput.power(),aes(N,power,color=as.factor(RR))) + geom_line(size=.8) + 
      scale_colour_discrete(name="RR") + geom_hline(yintercept = .8, linetype = "longdash") +
      xlab('Sample size (N)') + ylab('Power') +
      theme(panel.background=element_blank(), panel.grid.minor=element_blank(), 
            panel.grid.major=element_blank(), axis.line=element_line(colour="light grey"), axis.text=element_text(colour='black'))
  }) 

  plotInput.N <- reactive({
    N.out <- powerChiN(input$power,input$RR,input$alpha,min(input$nratiorange),max(input$nratiorange),
                       min(input$p1range),max(input$p1range))
  })

  output$powTableN <- renderDataTable(
    power01 <- plotInput.N() %>% mutate(N=as.factor(N), n1=as.factor(n1), n2=as.factor(n2)),
    options=list(searching=FALSE))
  
  output$powPlotN <- renderPlot({
    ggplot(plotInput.N(),aes(N,p1,color=as.factor(nratio))) + geom_line(size=.8) + 
      scale_colour_discrete(name="nratio") + 
      xlab('Sample size (N)') + ylab('Proportion with outcome in unexposed (p1)') +
      theme(panel.background=element_blank(), panel.grid.minor=element_blank(), 
            panel.grid.major=element_blank(), axis.line=element_line(colour="light grey"), axis.text=element_text(colour='black'))
  }) 
})
