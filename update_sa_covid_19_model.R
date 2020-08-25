# Update model to website.

# copy data
file_list = list.files(path = "../covid19model/South_Africa/results/",
                       pattern = "^projections-mob-base-south_africa-",
                       full.names = TRUE)

file.copy(from = file_list,
          to = "covid-19/",
          overwrite = TRUE)

file.copy(from = "../covid19model/modelling_covid-19_in_south_africa_at_a_provincial_level.html",
          to = "covid-19/",
          overwrite = TRUE)

# do git stuff
source("git_tools.R")
message = paste0("Update SA COVID-19 Model ", Sys.time())
path = "."
git_add(path, path_to_add = "covid-19/modelling_covid-19_in_south_africa_at_a_provincial_level.html")
git_add(path, path_to_add = "covid-19/projections-mob-base-south_africa*")
git_commit(path, message)
git_push(path)
