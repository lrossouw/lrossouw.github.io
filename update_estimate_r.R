# Update rt_estimates on website

# copy data
file.copy(from = "../rt_estimates/estimating_r.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/estimating_r_world.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/estimating_r_ca.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/estimating_r_uk.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/estimating_r_za.html",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/Rt_data.csv",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/Rt_data_ca.csv",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/Rt_data_uk.csv",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/Rt_data_za.csv",
          to = "covid-19/",
          overwrite = TRUE)
file.copy(from = "../rt_estimates/uk_utla.gif",
          to = "covid-19/",
          overwrite = TRUE)



# git stuff
source("git_tools.R")
message = paste0("Update estimating_r on ", Sys.time())
path = "."
git_pull(path)
git_add(path, path_to_add = "covid-19/estimating_r.html")
git_add(path, path_to_add = "covid-19/estimating_r_world.html")
git_add(path, path_to_add = "covid-19/estimating_r_ca.html")
git_add(path, path_to_add = "covid-19/estimating_r_uk.html")
git_add(path, path_to_add = "covid-19/estimating_r_za.html")
git_add(path, path_to_add = "covid-19/Rt_data.csv")
git_add(path, path_to_add = "covid-19/Rt_data_ca.csv")
git_add(path, path_to_add = "covid-19/Rt_data_uk.csv")
git_add(path, path_to_add = "covid-19/Rt_data_za.csv")
git_add(path, path_to_add = "covid-19/uk_utla.gif")
git_commit(path, message)
git_push(path)
