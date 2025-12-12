#' Get Quarto project output directory
#'
#' Reads the `output-dir` setting from `_quarto.yml` if it exists.
#' Returns NULL if not in a Quarto project or if `output-dir` is not set.
#'
#' @return Character string with output directory path, or NULL
#' @export
get_quarto_output_dir <- function() {
  quarto_yml <- here::here("_quarto.yml")
  if (!file.exists(quarto_yml)) {
    return(NULL)
  }
  yaml::read_yaml(quarto_yml)$project$`output-dir`
}

#' Build output path for rendered artifacts
#'
#' Constructs the appropriate output path for files that need to be saved
#' alongside rendered HTML (e.g., interactive widgets saved as standalone HTML).
#' When rendering as a Quarto project, saves to the output directory; otherwise
#' saves to the current directory.
#'
#' @param filename The filename to save (e.g., "interactive_map.html")
#' @param subdir Optional subdirectory within the output dir (e.g., "tutorials")
#' @return Full path to save the file
#' @export
get_output_path <- function(filename, subdir = NULL) {
  output_dir <- get_quarto_output_dir()

  if (!is.null(output_dir)) {
    if (!is.null(subdir)) {
      file.path(here::here(output_dir), subdir, filename)
    } else {
      file.path(here::here(output_dir), filename)
    }
  } else {
    filename
  }
}
