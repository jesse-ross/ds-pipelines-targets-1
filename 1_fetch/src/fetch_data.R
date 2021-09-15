library(sbtools)

# Get the data from ScienceBase
fetch_data <- function() {
  mendota_file <- '1_fetch/out/model_RMSEs.csv'
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv',
                     destinations = mendota_file, overwrite_file = TRUE)
  return(mendota_file)
}