# Update rt_estiamtes on website

# copy data
file.copy(from = "../rt_estimates/estimating_r.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/Rt_data.csv",
          to = "covid-19/",
          overwrite = TRUE)


#git message
message = paste0("Update estimating_r on ", Sys.time())

# git stuff
source("git_tools.R")
git_update(path = ".",
           message = message)
