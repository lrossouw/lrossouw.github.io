# Update rt_estimates_za on website

# clear all
rm(list = ls())

# git tools
source("git_tools.R")

# set path
path = "."

# git pull
git_pull(path)

# copy data
file.copy(from = "../rt_estimates/estimating_r.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(
  from = paste0("../rt_estimates/estimating_r_za.html"),
  to = "covid-19/",
  overwrite = TRUE
)
file.copy(
  from = paste0("../rt_estimates/Rt_data_za.csv"),
  to = "covid-19/",
  overwrite = TRUE
)
git_add(path, path_to_add = "covid-19/estimating_r.html")
git_add(path, path_to_add = paste0("covid-19/estimating_r_za.html"))
git_add(path, path_to_add = paste0("covid-19/Rt_data_za.csv"))
message = paste0("Update estimating_r_za on ", Sys.time())
git_commit(path, message)
git_push(path)
