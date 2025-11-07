# EMODnet Biology R Geospatial Tutorials

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

``` r
# Install EMODnet packages
install.packages("emodnet.wfs")
install.packages("emodnet.wcs")

# Install supporting packages
install.packages(c("sf", "terra", "dplyr", "tidyr", "ggplot2", "tmap"))

# For Tutorial 4, also install:
install.packages(c("CopernicusMarine", "worrms"))
```

**Note:** If packages are not yet on CRAN, install from GitHub:
``` r
install.packages("remotes")
remotes::install_github("EMODnet/emodnet.wfs")
remotes::install_github("EMODnet/emodnet.wcs")
```

## Contributing

We welcome contributions! Whether you want to:
-   Report a bug or suggest improvements
-   Add a new tutorial
-   Fix errors or improve documentation

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on the contribution process.

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
