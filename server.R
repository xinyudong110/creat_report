library(shiny)
library(DT)
library(shinydashboard)
library(ggplot2)
library(tools)
library(tidyverse)
library(readxl)
library(zoo)
library(VIM)
library(DataExplorer)
library(openxlsx)

library(xml2)
library(rvest)
library(knitr)
library(rmarkdown)
library(htmlwidgets)


server<-function(input,output,session){
  
  options(shiny.error = browser)
  
  options = list(
    viewer = NULL  # Disable automatic opening of the viewer
  )
  
  file_name <-paste0(runif(1)*1000000000000000,".html")
  
  #Sys.setenv(PANDOC = "/usr/bin/pandoc")
  
  
  cat("<!DOCTYPE html>",file = file_name)
  DataExplorer::create_report(mtcars,output_file = file_name,output_dir =getwd(),config = configure_report(
    add_plot_str = FALSE,
    add_plot_qq = FALSE,
    add_plot_prcomp = FALSE,
    add_plot_boxplot = FALSE,
    add_plot_scatterplot = FALSE,
    global_ggtheme = quote(theme_light())
  ))
  #xml2::write_html(rvest::html_node(xml2::read_html(file_name), "body"), file = file_name)
  output$Eda_file <- renderUI(includeHTML(file_name))
  
  
  
}



