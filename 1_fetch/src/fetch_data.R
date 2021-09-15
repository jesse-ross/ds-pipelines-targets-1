library(sbtools)

# Get the data from ScienceBase
fetch_sb_file <- function(sb_id, name, output_file) {
  item_file_download(sb_id = sb_id,
                     names = name,
                     destinations = output_file,
                     overwrite_file = TRUE)
  return(output_file)
}