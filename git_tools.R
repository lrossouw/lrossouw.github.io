
git_add <- function(path, path_to_add) {
  command = paste0("git ",
                   "-C ",
                   "\"",
                   path,
                   "\" ",
                   "add ",
                   path_to_add)
  system(command, show.output.on.console = TRUE)
}

git_log <- function(path) {
  command = paste0("git ",
                   "-C ",
                   "\"",
                   path,
                   "\" ",
                   "log")
  system(command, show.output.on.console = TRUE)
}

git_commit <- function(path, message) {
  command = paste0("git ",
                   "-C ",
                   "\"",
                   path,
                   "\" ",
                   "commit ",
                   "-m ",
                   "\"",
                   message,
                   "\"")
  system(command, show.output.on.console = TRUE)
}

git_push <- function(path) {
  command = paste0("git ",
                   "-C ",
                   "\"",
                   path,
                   "\" ",
                   "push")
  system(command, show.output.on.console = TRUE)
}
