# Contributing to EMODnet Biology R Geospatial Tutorials

Thank you for your interest in contributing to this project! This document provides guidelines and best practices for contributing tutorials, code, and documentation.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Code Style Guidelines](#code-style-guidelines)
- [Adding New Tutorials](#adding-new-tutorials)
- [Pull Request Process](#pull-request-process)
- [Testing Requirements](#testing-requirements)
- [Documentation Standards](#documentation-standards)
- [Issue Reporting](#issue-reporting)

## Code of Conduct

We are committed to providing a welcoming and inclusive environment for all contributors. Please be respectful and professional in all interactions.

## Getting Started

### Development Setup

1. **Fork and clone the repository**

```bash
git clone https://github.com/YOUR-USERNAME/emodnet-bio-r-geo-tutorials.git
cd emodnet-bio-r-geo-tutorials
```

2. **Install R dependencies**

Open R or RStudio in the project directory and run:

```r
# Install required packages manually
install.packages(c("sf", "terra", "dplyr", "tidyr", "ggplot2", "tmap",
                   "emodnet.wfs", "emodnet.wcs"))

# For Tutorial 4, also install:
install.packages(c("CopernicusMarine", "worrms"))

# If EMODnet packages are not on CRAN yet:
install.packages("remotes")
remotes::install_github("EMODnet/emodnet.wfs")
remotes::install_github("EMODnet/emodnet.wcs")

# Optional: Use renv for reproducible environment (when available)
# renv::restore()
```

3. **Install Quarto**

Download and install Quarto from [quarto.org](https://quarto.org/docs/get-started/)

Verify installation:
```bash
quarto --version
```

4. **Create a feature branch**

```bash
git checkout -b feature/your-feature-name
```

5. **Build and preview the website locally**

From the terminal in the project directory:

```bash
quarto preview
```

Or from within R:

```r
quarto::quarto_preview()
```

The website will open in your default browser with live reload enabled - changes to `.qmd` files will automatically rebuild the relevant pages.

To render the complete website without preview:

```bash
quarto render
```

Output will be in the `_site/` directory.

### Repository Structure

Understanding the repository organization will help you contribute effectively:

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
├── _site/                           # Rendered website output (gitignored)
├── .github/
│   └── workflows/                   # CI/CD workflows
├── CONTRIBUTING.md                  # This file
├── README.md                        # User-facing documentation
└── LICENSE-*                        # License files
```

**Path conventions:** Always use project-relative paths (e.g., `/assets/logo.png` or `assets/logo.png`) in tutorials and website files for consistency and maintainability. Avoid absolute paths.

## Code Style Guidelines

### R Code

We follow the [tidyverse style guide](https://style.tidyverse.org/) with these key principles:

#### Naming Conventions

- **Variables and functions:** Use snake_case
  ```r
  # Good
  mpa_data <- read_wfs(...)
  calculate_overlap_area <- function(x, y) { ... }

  # Avoid
  MPAData <- read_wfs(...)
  calculateOverlapArea <- function(x, y) { ... }
  ```

- **Files:** Use lowercase with hyphens
  ```
  tutorial-1-wfs-mpa-infrastructure.qmd
  utils-spatial-functions.R
  ```

#### Code Organization

- **Line length:** Keep lines under 80 characters when possible
- **Indentation:** Use 2 spaces (not tabs)
- **Pipes:** Use the native pipe `|>` for new code
  ```r
  # Preferred
  data |>
    filter(year > 2010) |>
    group_by(region) |>
    summarise(mean_value = mean(value))
  ```

#### Comments

- Use `#` for single-line comments
- Add explanatory comments for complex logic
- Document functions using roxygen2-style comments when creating utility functions

```r
# Calculate overlap between two spatial objects
# Returns area in km²
calculate_overlap <- function(x, y) {
  st_intersection(x, y) |>
    st_area() |>
    units::set_units(km^2)
}
```

### Quarto Documents

#### YAML Front Matter

Include these essential fields:

```yaml
---
title: "Tutorial Title"
author: "Your Name"
date: last-modified
format:
  html:
    code-fold: false
    code-tools: true
    toc: true
    toc-depth: 3
execute:
  warning: false
  message: false
  cache: true
---
```

#### Document Structure

Organize tutorials with clear sections:

1. **Introduction** - Overview and learning objectives
2. **Prerequisites** - Required packages and knowledge
3. **Setup** - Load packages and set parameters
4. **Main Content** - Step-by-step workflow
5. **Results** - Key findings and visualizations
6. **Summary** - Recap and next steps
7. **References** - Data sources and citations

#### Code Chunks

- Use descriptive chunk labels: `{r setup}`, `{r load-data}`, `{r plot-map}`
- Set appropriate chunk options:
  ```r
  #| label: load-mpa-data
  #| cache: true
  #| message: false
  ```

- Include explanatory text before and after code chunks
- Keep chunks focused on single tasks

#### Writing Style

- Use clear, concise language
- Write in present tense
- Address the reader directly ("we will", "you can")
- Explain *why* not just *what*

## Adding New Tutorials

### Tutorial Checklist

Before submitting a new tutorial, ensure it includes:

- [ ] Clear learning objectives
- [ ] Real-world use case or research question
- [ ] Complete, executable code
- [ ] Explanatory text for each step
- [ ] At least one map visualization
- [ ] Data source citations
- [ ] Estimated completion time
- [ ] Difficulty level (beginner/intermediate/advanced)

### Tutorial Structure Template

```markdown
---
title: "Your Tutorial Title"
author: "Your Name"
date: last-modified
format:
  html:
    code-fold: false
    code-tools: true
    toc: true
---

## Introduction

Brief description of the tutorial and what users will learn.

**Learning Objectives:**
- Objective 1
- Objective 2

**Estimated Time:** XX minutes

**Difficulty Level:** Beginner/Intermediate/Advanced

## Prerequisites

### Required Packages
```{r}
#| label: setup
library(emodnet.wfs)
# ... other packages
```

## Main Content

[Your tutorial content here]

## Summary

Key takeaways and suggested next steps.

## Data Sources

- EMODnet Biology: [URL]
- [Other sources]

## References

[Citations]
```

### Adding Tutorial to Website

1. Create your `.qmd` file in the `tutorials/` directory
2. Update `_quarto.yml` to add the tutorial to the navigation:

```yaml
website:
  navbar:
    left:
      - text: "Tutorials"
        menu:
          - text: "Tutorial 1: ..."
            href: tutorials/tutorial-1-wfs-mpa-infrastructure.qmd
          - text: "Your New Tutorial"
            href: tutorials/your-tutorial-name.qmd
```

3. Add a brief description on the main `index.qmd` page

### Data and Caching

- Use the `data-cache/` directory for cached data (gitignored)
- Document any external data dependencies
- Use reasonable cache expiry for WFS/WCS requests
- Include data provenance information

```r
# Good practice: set up caching
cache_dir <- "data-cache"
if (!dir.exists(cache_dir)) dir.create(cache_dir)

cache_file <- file.path(cache_dir, "mpa_data.rds")
if (file.exists(cache_file)) {
  mpa_data <- readRDS(cache_file)
} else {
  mpa_data <- emodnet.wfs::get_layers(...)
  saveRDS(mpa_data, cache_file)
}
```

## Pull Request Process

### Before Submitting

1. **Test your changes locally**
   - Run `quarto preview` to check rendering
   - Execute all code chunks to ensure they run without errors
   - Check that links work correctly
   - Verify maps and visualizations render properly

2. **Review your changes**
   ```bash
   git diff
   ```

3. **Commit with clear messages**
   ```bash
   git commit -m "Add tutorial on XYZ analysis"
   ```

   Use conventional commit prefixes:
   - `feat:` - New tutorial or major feature
   - `fix:` - Bug fix or correction
   - `docs:` - Documentation updates
   - `style:` - Formatting changes
   - `refactor:` - Code restructuring
   - `test:` - Adding tests
   - `chore:` - Maintenance tasks

### Pull Request Guidelines

1. **Create a descriptive PR title**
   - Good: "Add tutorial on combining EMODnet and Copernicus data"
   - Avoid: "Update files"

2. **Provide context in the PR description**
   - What does this PR add/fix?
   - Why is this change needed?
   - What testing have you done?
   - Link related issues

3. **PR Template**
   ```markdown
   ## Description
   Brief description of changes

   ## Type of Change
   - [ ] New tutorial
   - [ ] Bug fix
   - [ ] Documentation update
   - [ ] Code improvement

   ## Testing
   - [ ] Tested locally with `quarto preview`
   - [ ] All code chunks execute without errors
   - [ ] Links and cross-references work

   ## Related Issues
   Closes #XX
   ```

4. **Respond to feedback**
   - Be open to suggestions
   - Make requested changes in new commits

5. **Keep PRs focused**
   - One feature/fix per PR
   - Avoid mixing unrelated changes

## Testing Requirements

### Code Testing

While formal unit tests are not required for tutorial code, ensure:

1. **All code chunks execute successfully**
   ```bash
   quarto render tutorials/your-tutorial.qmd
   ```

2. **Handle common errors gracefully**
   - Check for failed API requests
   - Validate spatial operations
   - Test with different parameter values

3. **Verify outputs**
   - Maps render correctly
   - Tables display properly
   - Calculations produce expected results

### Data Validation

```r
# Example: Validate downloaded data
stopifnot(
  nrow(mpa_data) > 0,
  st_crs(mpa_data) == st_crs(4326),
  all(!is.na(mpa_data$geometry))
)
```

### Manual Testing Checklist

Before submitting, verify:

- [ ] Code runs from top to bottom without errors
- [ ] External data sources are accessible
- [ ] Maps display with proper projections
- [ ] File paths use project-relative paths
- [ ] No absolute paths (e.g., `/Users/yourname/...`)
- [ ] Images and assets load correctly
- [ ] Cross-references work
- [ ] Code is well-commented

## Documentation Standards

### Tutorial Documentation

- **Clear objectives:** State what users will learn
- **Step-by-step explanation:** Don't skip steps
- **Context for code:** Explain why, not just what
- **Reproducibility:** All code should be self-contained
- **Citations:** Reference data sources and methods

### Code Comments

```r
# Good: Explains why
# Filter to North Sea region (IHO Sea Area 2) to reduce data volume
north_sea <- sea_areas |> filter(iho_id == 2)

# Avoid: Redundant
# Filter to IHO ID 2
north_sea <- sea_areas |> filter(iho_id == 2)
```

### Function Documentation

If creating helper functions, document them:

```r
#' Calculate Spatial Overlap Area
#'
#' Computes the intersection area between two spatial objects
#'
#' @param x An sf object
#' @param y An sf object
#' @return Numeric vector of areas in km²
calculate_overlap <- function(x, y) {
  st_intersection(x, y) |>
    st_area() |>
    units::set_units(km^2) |>
    as.numeric()
}
```

### README Updates

If your contribution affects setup or usage, update the README:
- New dependencies
- Changed prerequisites
- Updated build instructions
- New tutorial descriptions

## Issue Reporting

### Bug Reports

Include:
- Description of the issue
- Steps to reproduce
- Expected vs. actual behavior
- System information (R version, OS, package versions)
- Error messages (full output)

Template:
```markdown
**Description:**
Brief description of the bug

**To Reproduce:**
1. Step 1
2. Step 2
3. See error

**Expected Behavior:**
What should happen

**System Info:**
- R version:
- Quarto version:
- OS:
- Package versions:

**Error Message:**
```
Paste error here
```
```

### Feature Requests

Describe:
- The problem or use case
- Proposed solution
- Alternative approaches considered
- Example usage (if applicable)

### Questions

- Check existing issues and discussions first
- Use GitHub Discussions for general questions
- Use Issues for specific bugs or features

## Additional Resources

- [Tidyverse Style Guide](https://style.tidyverse.org/)
- [Quarto Documentation](https://quarto.org/docs/guide/)
- [EMODnet Data Portal](https://emodnet.eu)
- [emodnet.wfs Documentation](https://github.com/EMODnet/emodnet.wfs)
- [emodnet.wcs Documentation](https://github.com/EMODnet/emodnet.wcs)

## Questions?

If you have questions about contributing:
- Open a [Discussion](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/discussions)
- Contact the maintainers via [Issues](https://github.com/EMODnet/emodnet-bio-r-geo-tutorials/issues)

Thank you for contributing to EMODnet Biology R Geospatial Tutorials!
