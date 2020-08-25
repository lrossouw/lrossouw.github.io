# Update rt_estimates on website

# copy data
file.copy(from = "../rt_estimates/estimating_r.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/Rt_data.csv",
          to = "covid-19/",
          overwrite = TRUE)



# git stuff
source("git_tools.R")
message = paste0("Update estimating_r on ", Sys.time())
path = "."
git_add(path, path_to_add = "covid-19/estimating_r.html")
git_add(path, path_to_add = "covid-19/Rt_data.csv")
git_commit(path, message)
git_push(path)
