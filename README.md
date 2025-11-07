# EMODnet Biology R Geospatial Tutorials

[![License: CC BY 4.0](https://img.shields.io/badge/License%20(content)-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: MIT](https://img.shields.io/badge/License%20(code)-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A collection of R-based geospatial tutorials demonstrating how to access and analyze marine biological and environmental data from EMODnet Biology and other EMODnet thematic portals using the `emodnet.wfs` and `emodnet.wcs` R packages.

## Overview

These tutorials provide practical, reproducible workflows for working with EMODnet's Web Feature Service (WFS) and Web Coverage Service (WCS) data. They cover a range of marine spatial analysis scenarios, from basic data access to complex multi-source integrations.

### Tutorials

1.  **Detecting Overlaps Between Marine Protected Areas and Subsea Infrastructure** - Uses `emodnet.wfs` to identify spatial overlaps between MPAs and human activities in the North Sea

2.  **Accessing and Analyzing WCS Raster Layers** - Demonstrates `emodnet.wcs` by exploring zooplankton distributions in relation to plaice nursery grounds

3.  **Combining WFS and WCS Data** - Integrates vector and raster data to investigate biodiversity change in relation to depth in the North Sea

4.  **Integrating Multiple Data Sources** - Advanced tutorial combining EMODnet services with Copernicus Marine Service data and trait databases to explore functional ecology in the Aegean Sea

## Using These Tutorials

### Online Access

The tutorials are available as an interactive website at: *(URL to be added once deployed)*

### Prerequisites

To follow along with the tutorials, you'll need:

**Required Knowledge:**
-   Basic to intermediate R programming
-   Familiarity with geospatial concepts (vectors, rasters, coordinate reference systems)
-   Understanding of pipe operators (`|>` or `%>%`)

**Software:**
-   **R** (≥ 4.1.0) - [Download here](https://cran.r-project.org/)
-   **RStudio** (recommended) - [Download here](https://posit.co/download/rstudio-desktop/)

### R Package Installation

Install the required packages to run the tutorial code:

*Note:** EMODnet packages are not yet on CRAN, install from GitHub:
``` r
# EMODnet packages are not on CRAN yet:
install.packages("pak")
# install emodnet.wfs
# from ropensci r-universe
install.packages("emodnet.wfs", repos = c("https://ropensci.r-universe.dev", "https://cloud.r-project.org"))
# or dev version from GitHub
pak::pak("EMODnet/emodnet.wfs")
# install emodnet.wcs
# dev version from GitHub
pak::pak("EMODnet/emodnet.wcs")

# Install required packages manually
pak::pak(c("sf", "terra", "dplyr", "tidyr", "ggplot2", "tmap"))

# For Tutorial 4, also install:
pak::pak(c("CopernicusMarine", "worrms"))
```

## Contributing

We welcome contributions! Whether you want to:
-   Report a bug or suggest improvements
-   Add a new tutorial
-   Fix errors or improve documentation

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on the contribution process.

## License

This project uses a dual license:

-   **Tutorial content** (text, documentation): [CC-BY 4.0](LICENSE-CC-BY-4.0)
-   **Code** (R scripts, functions): [MIT License](LICENSE-MIT)

See [LICENSE](LICENSE) for an overview and individual license files for full legal text.

## Citation

If you use these tutorials in your research or teaching, please cite them using the information provided in our [CITATION.cff](CITATION.cff) file.

**On GitHub:** Click the "Cite this repository" button in the repository sidebar to get formatted citations in various styles (APA, BibTeX, etc.).

**Manual citation format:**
```
[Authors] (2025). EMODnet Biology R Geospatial Tutorials [Data set].
https://github.com/r-rse/emodnet-bio-r-geo-tutorials
```

_Note: A DOI will be added once the tutorials are archived on Zenodo._

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
