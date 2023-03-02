library(shiny)
library(DT)
library(tidyverse)
library(htmltools)
library(utf8)
library(leaflet)

library(DBI)
library(RMariaDB)

# https://cran.r-project.org/web/packages/logr/vignettes/logr.html
library(logr) # not decided
library(loggit) # not decided, latest 2022-05-02

library(readODS)
library(readxl)
library(openxlsx)

options(encoding = 'UTF-8')

# 2022-04-22
source("accession_transformation.R")
source("database-connection2.R")
source("excel2.R")

library(assertr)

# color coding https://community.rstudio.com/t/color-cells-in-dt-datatable-in-shiny/2288/3
library(formattable)
