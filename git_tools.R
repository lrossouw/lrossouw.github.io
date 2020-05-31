
git_add_all <- function(path) {
  command = paste0("git ",
                   "-C ",
                   "\"",
                   path,
                   "\" ",
                   "add ",
                   "-A ")
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

git_update <- function(path, message=NULL) {
  if(is.null(message)){
    message=paste0("Update at ",format(Sys.time(),))
  }
  git_add_all(path)
  git_commit(path, message)
  git_push(path)
}
