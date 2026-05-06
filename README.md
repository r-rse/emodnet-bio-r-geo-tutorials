# EMODnet Biology R Geospatial Tutorials

[![Quarto Publish](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/actions/workflows/publish.yml/badge.svg)](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/actions/workflows/publish.yml)
[![License: CC BY 4.0](https://img.shields.io/badge/License%20(content)-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![License: MIT](https://img.shields.io/badge/License%20(code)-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A collection of R-based geospatial tutorials demonstrating how to access and analyze marine biological and environmental data from EMODnet Biology and other EMODnet thematic services using the `emodnet.wfs` and `emodnet.wcs` R packages.

## Overview

These tutorials provide practical, reproducible workflows for working with EMODnet's Web Feature Service (WFS) and Web Coverage Service (WCS) data. They cover a range of marine spatial analysis scenarios, from basic data access to complex multi-source integrations.

### Tutorials

1.  **Detecting Overlaps Between Marine Protected Areas and Subsea Infrastructure** - Uses `emodnet.wfs` to identify spatial overlaps between MPAs and human activities in the North Sea

2.  **Accessing and Analyzing WCS Raster Layers** - Demonstrates `emodnet.wcs` by exploring zooplankton distributions in relation to plaice nursery grounds

3.  **Combining WFS and WCS Data** - Integrates vector and raster data to investigate biodiversity change in relation to depth in the North Sea

4.  **Integrating Multiple Data Sources** - Advanced tutorial combining EMODnet services with Copernicus Marine Service data and trait databases to explore functional ecology in the Aegean Sea

## Using These Tutorials

### Online Access

The tutorials are available as an interactive website at: **https://emodnet.github.io/emodnet-bio-r-geo-tutorials/**

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

The tutorials are bundled as an R package with helper functions and cached data. Installing the package from GitHub also pulls in every R dependency the tutorials need (including `emodnet.wfs` and `emodnet.wcs`, plus website-only extras), so this is a single one-liner:

``` r
# install pak if you don't have it
install.packages("pak")

# install the tutorials package and ALL dependencies
# (Imports + Suggests from DESCRIPTION, plus website-only deps)
pak::pak(
  "EMODnet/emodnet-bio-r-geo-tutorials",
  dependencies = c("all", "Config/Needs/website")
)
```

`emodnet.wfs` is on [CRAN](https://cran.r-project.org/package=emodnet.wfs); `emodnet.wcs` is installed from the `EMODnet/emodnet.wcs` GitHub repository via the `Remotes:` field in `DESCRIPTION`. `pak` resolves both transparently.

## Working With the Tutorials

### For Learners: Running Tutorials Interactively

If you want to work through the tutorials in your own R environment:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/EMODnet/emodnet-bio-r-geo-tutorials.git
   cd emodnet-bio-r-geo-tutorials
   ```

2. **Install required packages** (see [R Package Installation](#r-package-installation) above)

3. **Open tutorial files:**
   - Tutorial files are in the `tutorials/` directory (`.qmd` files)
   - Open them in RStudio or your preferred editor
   - Run code chunks interactively (`Ctrl/Cmd + Enter`)

4. **Work through at your own pace:**
   - Code chunks can be run independently
   - Modify code to explore different scenarios
   - Create your own variations based on the examples

### For Contributors: Building the Website Locally

If you want to preview the full website or contribute changes:

1. **Install Quarto** (≥ 1.5): [Download here](https://quarto.org/docs/get-started/)

2. **Clone and setup:**
   ```bash
   git clone https://github.com/EMODnet/emodnet-bio-r-geo-tutorials.git
   cd emodnet-bio-r-geo-tutorials
   ```

3. **Install R packages** (see [R Package Installation](#r-package-installation))

4. **Preview the site:**
   ```bash
   quarto preview
   ```
   - Opens browser with live-reloading preview
   - Changes auto-refresh as you edit

5. **Build the site:**
   ```bash
   quarto render
   ```
   - Generates site in `_site/` directory
   - Check `_site/index.html` to verify build

6. **Refresh caches before submitting PRs:**
   ```bash
   # Remove freeze cache and re-execute all code
   rm -rf _freeze/
   quarto render --cache-refresh

   # Or for a single tutorial
   rm -rf _freeze/tutorials/tutorial-01/
   quarto render tutorials/tutorial-01.qmd --cache-refresh
   ```
   This ensures tutorials run correctly with current package versions. See [CONTRIBUTING.md](CONTRIBUTING.md#data-and-caching) for details on caching.

### Troubleshooting Workflow Failures

If the [CI/CD workflow](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/actions/workflows/publish.yml) fails:

**1. Check the workflow run:**
   - Click the badge: [![Quarto Publish](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/actions/workflows/publish.yml/badge.svg)](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/actions/workflows/publish.yml)
   - Review error messages in failed steps

**2. Common issues:**
   - **R package errors**: Package versions may have changed - update `DESCRIPTION`
   - **EMODnet service issues**: WFS/WCS endpoints may be temporarily down - check [EMODnet status](https://monitor.emodnet.eu/)
   - **Broken links**: Check the "Check links with Lychee" step job summary
   - **Render errors**: Test locally with `quarto render` to reproduce

**3. Broken links (scheduled runs):**
   - Weekly checks create [issues with label `scheduled-check`](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/labels/scheduled-check)
   - Review and fix broken external links or update exclusions
   - Internal links usually indicate missing files or incorrect paths

**4. Test locally first:**
   ```bash
   # Reproduce the CI environment
   quarto render
   # If successful locally but fails in CI, check package versions
   ```

**5. Need help?**
   - [Open an issue](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/issues)
   - Tag maintainers if urgent

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
Krystalli, A. (2025). EMODnet Biology R Geospatial Tutorials [Data set].
https://github.com/EMODnet/emodnet-bio-r-geo-tutorials
```

## Links

-   **EMODnet:** [emodnet.eu](https://emodnet.eu)
-   **emodnet.wfs Package:** [github.com/EMODnet/emodnet.wfs](https://github.com/EMODnet/emodnet.wfs)
-   **emodnet.wcs Package:** [github.com/EMODnet/emodnet.wcs](https://github.com/EMODnet/emodnet.wcs)
-   **Tutorial Website:** [emodnet.github.io/emodnet-bio-r-geo-tutorials](https://emodnet.github.io/emodnet-bio-r-geo-tutorials/)

## Contact & Support

-   **Report issues:** [GitHub Issues](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/issues)
-   **Questions:** Open a [Discussion](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/discussions)

## Acknowledgements

The European Marine Observation and Data Network (EMODnet) is financed by the European Union under Regulation (EU) 2021/1139 of the European Parliament and of the Council of 7 July 2021 establishing the European Maritime, Fisheries and Aquaculture Fund. Ref: CINEA/EMFAF/2022/3.5.2/SI2.895681

Copyright © 2025 European Climate, Infrastructure and Environment Executive Agency (CINEA).

### Reviewers

Thanks to Maëlle Salmon ([@maelle](https://github.com/maelle)) and Joana Beja ([@JoBeja](https://github.com/JoBeja)) for thorough review of the tutorials and supporting documentation.
