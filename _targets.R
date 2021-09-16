library(targets)
source("1_fetch/src/fetch_data.R")
source("2_process/src/process_data.R")
source("3_visualize/src/visualize_data.R")

list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    fetch_sb_file(sb_id = "5d925066e4b0c4f70d0d0599",
                  name = "me_RMSE.csv",
                  output_file = "1_fetch/out/model_RMSEs.csv"),
    packages = c("sbtools"),
    format = "file",
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    process_data(mendota_file = model_RMSEs_csv,
                 output_file = "2_process/out/model_summary_results.csv"),
    packages = c("dplyr", "stringr"),
    format = "file",
  ),
  # Create a plot
  tar_target(
    figure_1_png,
    plot_rmse_data(data_file = eval_data,
                   output_file = "3_visualize/out/figure_1.png"), 
    packages = c("dplyr"),
    format = "file",
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    create_diagnostic_text(mendota_file = model_RMSEs_csv,
                           output_file = "2_process/out/model_diagnostic_text.txt"), 
    packages = c("dplyr", "whisker", "stringr"),
    format = "file",
  )
)