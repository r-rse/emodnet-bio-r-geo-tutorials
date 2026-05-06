#' Build output path for rendered artifacts
#'
#' Constructs an absolute path anchored at the Quarto project root, so files
#' written from inside a chunk (e.g. standalone htmlwidgets saved via
#' `tmap_save()`) land in a stable location regardless of the chunk's working
#' directory. Falls back to the bare filename when not inside a Quarto project.
#'
#' @param filename The filename to save (e.g., "interactive_map.html")
#' @param subdir Optional subdirectory relative to the project root
#'   (e.g., "tutorials/maps"). Created if it does not already exist.
#' @return Full path to save the file
#' @export
get_output_path <- function(filename, subdir = NULL) {
  project_root <- quarto::find_project_root()
  if (is.null(project_root)) {
    return(filename)
  }

  dir <- if (is.null(subdir)) project_root else file.path(project_root, subdir)
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
  }
  file.path(dir, filename)
}
