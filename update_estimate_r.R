# Update rt_estiamtes on website

# copy data
file.copy(from = "../COVID-19/rt_estimates/estimating_r.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../COVID-19/rt_estimates/Rt_data.csv",
          to = "covid-19/",
          overwrite = TRUE)


#git message
message = paste0("Update estimating_r on ", format(Sys.Date(), "%Y-%m-%d"))

# git stuff
source("git_tools.R")
git_update(path = ".",
           message = message)
