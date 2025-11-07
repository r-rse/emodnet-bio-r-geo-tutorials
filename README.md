# EMODnet Biology R Geospatial Tutorials

A collection of R-based geospatial tutorials demonstrating how to access and analyze marine biological and environmental data from EMODnet Biology and other EMODnet thematic portals using the `emodnet.wfs` and `emodnet.wcs` R packages.

## Overview

These tutorials provide practical, reproducible workflows for working with EMODnet's Web Feature Service (WFS) and Web Coverage Service (WCS) data. They cover a range of marine spatial analysis scenarios, from basic data access to complex multi-source integrations.

### Tutorials

1.  **Detecting Overlaps Between Marine Protected Areas and Subsea Infrastructure** - Uses `emodnet.wfs` to identify spatial overlaps between MPAs and human activities in the North Sea

2.  **Accessing and Analyzing WCS Raster Layers** - Demonstrates `emodnet.wcs` by exploring zooplankton distributions in relation to plaice nursery grounds

3.  **Combining WFS and WCS Data** - Integrates vector and raster data to investigate biodiversity change in relation to depth in the North Sea

4.  **Integrating Multiple Data Sources** - Advanced tutorial combining EMODnet services with Copernicus Marine Service data and trait databases to explore functional ecology in the Aegean Sea

## Prerequisites

### Required Knowledge

-   Basic to intermediate R programming
-   Familiarity with geospatial concepts (vectors, rasters, coordinate reference systems)
-   Understanding of pipe operators (`|>` or `%>%`)

### Software Requirements

-   **R** (≥ 4.1.0)
-   **Quarto** (≥ 1.3.0)
-   **RStudio** (recommended but not required)

### R Package Dependencies

-   **Core packages:** `emodnet.wfs`, `emodnet.wcs`
-   **Geospatial:** `sf`, `terra`
-   **Data manipulation:** `dplyr`, `tidyr`
-   **Visualization:** `ggplot2`, `tmap`
-   **Additional (Tutorial 4):** `CopernicusMarine`, `worrms`

## Installation

### Install EMODnet R Packages

``` r
# Install from CRAN (when available)
install.packages("emodnet.wfs")
install.packages("emodnet.wcs")

# Or install development versions from GitHub
# install.packages("remotes")
remotes::install_github("EMODnet/emodnet.wfs")
remotes::install_github("EMODnet/emodnet.wcs")
```

### Install Quarto

Download and install Quarto from [quarto.org](https://quarto.org/docs/get-started/)

## Local Development

### Clone the Repository

``` bash
git clone https://github.com/EMODnet/emodnet-bio-r-geo-tutorials.git
cd emodnet-bio-r-geo-tutorials
```

### Install R Dependencies

Open R or RStudio in the project directory and run:

``` r
# Option 1: Install required packages manually
install.packages(c("sf", "terra", "dplyr", "tidyr", "ggplot2", "tmap"))

# Option 2: Use renv for reproducible environment (when available)
# renv::restore()
```

### Build the Website Locally

From the terminal in the project directory:

``` bash
quarto preview
```

Or from within R:

``` r
quarto::quarto_preview()
```

The website will open in your default browser with live reload enabled - changes to `.qmd` files will automatically rebuild the relevant pages.

### Build Static Site

To render the complete website without preview:

``` bash
quarto render
```

Output will be in the `_site/` directory.

## Repository Structure

```         
.
├── _quarto.yml                      # Quarto website configuration
├── index.qmd                        # Landing page
├── about.qmd                        # About page
├── styles.css                       # Custom CSS styles
├── tutorials/                       # Tutorial .qmd files
│   ├── tutorial-1-wfs-mpa-infrastructure.qmd
│   ├── tutorial-2-wcs-zooplankton.qmd
│   ├── tutorial-3-wfs-wcs-biodiversity.qmd
│   └── tutorial-4-multi-source-aegean.qmd
├── assets/                          # Images, logos, and static files
├── data-cache/                      # Cached data for development (gitignored)
└── .github/
    └── workflows/                   # CI/CD workflows (to be added)
```

**Path conventions:** Use project-relative paths (e.g., `/assets/logo.png`) throughout for consistency and maintainability.

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:

-   Code style and formatting
-   Pull request process
-   How to add new tutorials
-   Testing requirements
-   Documentation standards

## License

This project uses a dual license:

-   **Tutorial content** (text, documentation): [CC-BY 4.0](LICENSE-CC-BY)
-   **Code** (R scripts, functions): [MIT License](LICENSE-MIT)

See individual LICENSE files for details.

## Citation

If you use these tutorials in your research or teaching, please cite:

```         
(Citation details to be added - see CITATION.cff)
```

## Links

-   **EMODnet Portal:** [emodnet.eu](https://emodnet.eu)
-   **emodnet.wfs Package:** [github.com/EMODnet/emodnet.wfs](https://github.com/EMODnet/emodnet.wfs)
-   **emodnet.wcs Package:** [github.com/EMODnet/emodnet.wcs](https://github.com/EMODnet/emodnet.wcs)
-   **Tutorial Website:** (URL to be added once deployed)

## Contact & Support

-   **Report issues:** [GitHub Issues](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/issues)
-   **Questions:** Open a [Discussion](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/discussions)

## Acknowledgments

These tutorials were developed as part of the EMODnet Biology project. EMODnet is funded by the European Commission's Directorate-General for Maritime Affairs and Fisheries (DG MARE).

*(Additional funding and copyright information to be added)*

------------------------------------------------------------------------

**Status:** This project is in active development. Tutorials and documentation are being added incrementally.
