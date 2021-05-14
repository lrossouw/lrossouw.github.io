# Update rt_estimates on website

# clear all
rm(list = ls())

# git tools
source("git_tools.R")

# set path
path = "."

# git pull
git_pull(path)

# get args
args = commandArgs(trailingOnly = TRUE)

# estimates
valid_args = c("ca", "uk", "za", "world")

# check args
if (length(args) == 1) {
  if (args[1] %in% valid_args) {
    # copy data
    file.copy(from = "../rt_estimates/estimating_r.html",
              to = "covid-19/",
              overwrite = TRUE)
    file.copy(
      from = paste0("../rt_estimates/estimating_r_files"),
      to = "covid-19/",
      overwrite = TRUE,
      recursive =  TRUE
    )
    file.copy(
      from = paste0("../rt_estimates/estimating_r_", args[1], ".html"),
      to = "covid-19/",
      overwrite = TRUE
    )
    file.copy(
      from = paste0("../rt_estimates/estimating_r_", args[1], "_files"),
      to = "covid-19/",
      overwrite = TRUE,
      recursive =  TRUE
    )
    part <- ifelse(args[1] == "world", "", paste0("_", args[1]))
    file.copy(
      from = paste0("../rt_estimates/Rt_data", part, ".csv"),
      to = "covid-19/",
      overwrite = TRUE
    )
    git_add(path, path_to_add = "covid-19/estimating_r.html")
    git_add(path, path_to_add = "covid-19/estimating_r_files")
    git_add(path, path_to_add = paste0("covid-19/estimating_r_", args[1],".html"))
    git_add(path, path_to_add = paste0("covid-19/estimating_r_", args[1],"_files"))
    git_add(path, path_to_add = paste0("covid-19/Rt_data", part, ".csv"))
    if (args[1] == "uk") {
      file.copy(from = "../rt_estimates/uk_utla.gif",
                to = "covid-19/",
                overwrite = TRUE)
      git_add(path, path_to_add = "covid-19/uk_utla.gif")
    } else if (args[1] == "za") {
      file.copy(from = "../rt_estimates/za.gif",
                to = "covid-19/",
                overwrite = TRUE)
      git_add(path, path_to_add = "covid-19/za.gif")
    }
    message = paste0("Update estimating_r_",args[1]," on ", Sys.time())
    git_commit(path, message)
    git_push(path)
  }
}
