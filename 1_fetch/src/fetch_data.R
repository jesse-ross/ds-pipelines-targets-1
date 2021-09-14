
library(dplyr)
library(readr)
library(stringr)
library(sbtools)
library(whisker)



# Get the data from ScienceBase
get_data <- function() {
  mendota_file <- 'out/model_RMSEs.csv'
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv',
                     destinations = mendota_file, overwrite_file = TRUE)
}