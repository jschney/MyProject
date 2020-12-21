setwd("C:/Users/i23764/OneDrive - Verisk Analytics/Documents/R/MyProject")
mainDir <- getwd()
subDir_rawData <- "raw_data"

ifelse(!dir.exists(file.path(mainDir,subDir_rawData)),
       dir.create(file.path(mainDir,subDir_rawData)), FALSE)

require(RCurl)
require(tidyverse)

setwd("./raw_data")
ftp <- "ftp://ftp.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/"

filenames <- getURL(ftp , dirlistonly=T ) %>%
  str_split("\n") %>%
  
  details <- filenames[grepl("details", filenames)]

for (i in seq_along(details)) {
  download.file(paste0(ftp,details[i]), destfile = paste0(mainDir,"/",subDir_rawData))
}



