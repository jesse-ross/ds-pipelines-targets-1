library(targets)
source("1_fetch/src/fetch_data.R")
source("2_process/src/process_data.R")
source("3_visualize/src/visualize_data.R")

list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    fetch_data(),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    process_data(mendota_file = model_RMSEs_csv),
    format = "file"
  ),
  # Create a plot
  tar_target(
    figure_1_png,
    plot_rmse_data(data_file = eval_data), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    create_diagnostic_text(mendota_file = eval_data), 
    format = "file"
  )
)
