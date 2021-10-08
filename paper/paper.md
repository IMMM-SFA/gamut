---
title: 'gamut: A Geospatial R Package to Analyze Multisector Urban Teleconnections'
tags:
- R
- Multisector Dynamics
- Water
- Energy
- Land
- Urban
- Geospatial
date: "30 September 2021"
output:
  html_document: 
    df_print: paged
authors:
- name: Kristian D. Nelson
  orcid: 0000-0002-6745-167X
  affiliation: 1
- name: Sean W. Turner
  orcid: 0000-0003-4400-9800
  affiliation: 1
- name: Chris R. Vernon
  orcid: 0000-0002-3406-6214
  affiliation: 1
- name: Jennie S. Rice
  orcid: 0000-0002-7833-9456
  affiliation: 1
bibliography: paper.bib
affiliations:
- name: Pacific Northwest National Laboratory
  index: 1
---

### Summary

Most cities in the United States withdraw surface water to meet public water supply needs. The lands on which this water is generated are often developed for human activities&mdash;such as agriculture, mining, and industry&mdash;that may compete for water resources or contaminate water supplies. Cities are thereby connected to other sectors through their water supply catchments. This connection is an example of an multisectoral urban teleconnection, which is a "conceptual framework that explicitly links land changes to underlying urbanization dynamics" [@Seto:2012]. This term was brought about to bring greater understanding of the connections between urbanization and land use changes [@Seto:2012]. The Geospatial Analytics for Multisectoral Urban Teleconnections (`gamut`) package provides national-scale information on these urban teleconnections by combining land use data with hydrological analysis to characterize urban source watershed human interactions across the conterminous United States (Figure 1).

![The `gamut` package analyzes urban cities and their watersheds all across the conterminous U.S. As shown in the figure, it can look at characteristics like land use inside watershed boundaries.](gamut_figure.png){ width=95% }

The `gamut` package computes dozens of city-level metrics that inform on the geographical nature of surface water supply catchments and the presence, intensity, and impact of human activities in those catchments. Each city’s watersheds are based on the Urban Water Blueprint [@McDonald:2014], which is enhanced with source contribution estimates as well as river flow and high-resolution runoff [@Nelson:2021]. `gamut` first uses the watershed boundary as a selector for several geospatial layers relating to electricity generation, agriculture, industry and economic developments, and water infrastructure (dams, reservoirs, aqueducts). Similar to other multi-sector packages, `gamut` produces its results from the combination of multiple datasets, which are then used to create new statistics. `gamut` relies heavily on the use of the `st_intersection` function from the [sf](https://cran.r-project.org/web/packages/sf/index.html) package to intersect features and watersheds, which then joins the rest of the information from the geospatial layers. This enables the package to link information such as land use percentages, wastewater discharge, facilities, etc. to a specific city through their drinking water resources. Non-geospatial layers in the form of data tables are joined through city names and municipal IDs. The input layers used in this package have been combined into an open-source dataset and can accessed [here](https://zenodo.org/record/5554939#.YV9dnNrMJPY) [@Nelson2:2021].

By creating the links between cities and watershed characteristics, the `gamut` package calculates numerous metrics that may be used for multiple types of city level multisector dynamics research. Metrics reported by `gamut` fall into four main categories: geographical characteristics of watersheds (e.g., climate zones, land area, distance from city, hydrology), potential water contamination concentrations (nonpoint and point), withdrawal/consumption of water from other sectors, and presence/intensity of multisectoral land uses. Table 1 shows all of the metrics that are created by this package, descriptions, and units. An R vignette is provided to help users to get started with `gamut` and may be accessed [here](https://github.com/IMMM-SFA/gamut#readme).

Table 1: Metrics reported in `gamut`

| Metric Name                            | Description                                                                             | Units                 |
| :------------------------------------ | :-------------------------------------------------------------------------------------- | :-------------------- |
| city\_population                      | The population of the city being analyzed                                               | people                |
| n\_watersheds                         | Number of watersheds that city uses to source drinking water                            | watersheds            |
| n\_other\_cities                      | Number of other cities pulling off the same watersheds                                  | cities                |
| dependent\_city\_pop                  | Total population of people dependent on that city’s watersheds                          | people                |
| watershed\_area\_sqkm                 | Combined area of all the source watersheds of a city                                    | square kilometers     |
| storage\_BCM                          | Combined storage capacity of all the city catchments                                    | billion cubic meters  |
| yield\_BCM                            | Combined yield capacity of all the city catchments                                      | billion cubic meters  |
| irr\_cons\_BCM                        | Combined water consumption that is used for irrigation with the watersheds              | billion cubic meters  |
| n\_climate\_zones                     | Number of climate zones that the source watersheds cover                                | zones                 |
| n\_hydro\_plants                      | Number of hydro electric power plants operating within the source watersheds            | plants                |
| n\_thermal\_plants                    | Number of thermal power plants operating within the source watersheds                   | plants                |
| n\_fac\_agcrop                        | Number of agricultural crop facilities within the source watersheds                     | facilities            |
| n\_fac\_aglivestock                   | Number of agicultural livestock facilities within the source watersheds                 | facilities            |
| n\_fac\_cnsmnf                        | Number of construction and manufacturing facilities within the source watersheds        | facilities            |
| n\_fac\_mining                        | Number of mining facilities within the source watersheds                                | facilities            |
| n\_fac\_oilgas                        | Number of oil and gas facilities within the source watersheds                           | facilities            |
| n\_fac\_total                         | Total number of facilities operating within the source watersheds                       | facilities            |
| hydro\_gen\_MWh                       | Combined hydro electric generation from all the facilities within the source watersheds | megawatt-hours         |
| thermal\_gen\_MWh                     | Combined thermal generation from all the facilities within the source watersheds        | megawatt-hours         |
| thermal\_cons\_BCM                    | Combined water consumption that is used for thermal generation                          | billion cubic meters  |
| thermal\_with\_BCM                    | Combined water withdrawal for thermal generation                                        | billion cubic meters  |
| n\_utilities                          | Number of electric utilities within the source watersheds                               | utilities             |
| n\_ba                                 | Number of balancing authorities within the source watersheds                            | balancing authorities |
| n\_crop\_classes                      | Total number of different types of crops within the source watersheds                   | crops                 |
| cropland\_fraction                      | Fraction of land that is used for crops                | fraction                     |
| developed\_fraction                       | Fraction of land that is developed                | fraction                     |
| ag\_runoff\_max                       | Agricultural runoff as proportion of total runoff (worst-case watershed)                | fraction                     |
| ag\_runoff\_av\_exgw                  | Agricultural runoff as proportion of total runoff in supply (exc. groundwater)          | fraction                     |                                
| ag\_runoff\_av                        | Agricultural runoff as proportion of total runoff in supply (inc. groundwater)          | fraction                     |
| dev\_runof\_max                       | Urban runoff as proportion of total runoff (worst-case watershed)                       | fraction                     |
| dev\_runof\_av\_exgw                  | Urban runoff as proportion of total runoff in supply (exc. groundwater)                 | fraction                     |   
| dev\_runof\_av                        | Urban runoff as proportion of total runoff in supply (inc. groundwater)                 | fraction                     |
| np\_runoff\_max                       | Max amount of non-point source runoff within the source watersheds                      | fraction                     |
| np\_runoff\_av\_exgw                  | Nonpoint Proportion of Potentially Contaminated Supply (PPCS) (exc. groundwater)        | fraction                     |
| np\_runoff\_av\_ exgw\_unweighted      | Nonpoint supply contamination averaged across watersheds                                | fraction                     |
| np\_runoff\_av                        | Nonpoint Proportion of Potentially Contaminated Supply (PPCS)                           | fraction                     |
| n\_economic\_sectors                  | Total number of different economic sectors within the source watersheds                 | sectors               |
| max\_withdr\_dis\_km                  | Maximum distance between a city’s intake points                                         | kilometers            |
| avg\_withdr\_dis\_km                  | Average distance between a city’s intake points                                         | kilometers            |
| n\_treatment\_plants                  | Total number of waste water treatment plants operating within the source watersheds     | plants                |
| watershed\_pop                        | Total number of people living within the source watershed boundaries                    | people                |
| pop\_cons\_m3sec                      | Combined water consumption from the source watersheds that is used for people           | m3/sec                |
| av\_fl\_sur\_conc\_pct                | Point PPCS (surface water only, based on flow)                                          | %                     |
| av\_fl\_sur\_ conc\_pct\_unweighted    | Point PPCS (surface water only, based on flow, not weighted by source importance)       | %                     |
| av\_ro\_sur\_conc\_pct                | Point PPCS (surface water only, based on runoff)                                        | %                     |
| av\_fl\_all\_conc\_pct                | Point PPCS (based on flow)                                                              | %                     |
| av\_ro\_all\_conc\_pct                | Point PPCS (based on runoff)                                                            | %                     |
| av\_fl\_max\_conc\_pct                | Point PPCS (based on flow, worst-case catchment only)                                   | %                     |
| av\_ro\_max\_conc\_pct                | Point PPCS (based on runoff, worst-case catchment only)                                 | %                     |
| surface\_contribution\_pct            | Proportion of total average supply made up from surface water                           | %                     |
| importance\_of\_worst\_ watershed\_pct | Proportion of total average supply made up from most heavily contamined watershed       | % | 
          |

### Statement of Need

MultiSector Dynamics (MSD) research  is the study of the co-evolution of human and natural systems. This research requires infrastructure expansion and land use scenarios, resource demand projections, and multisectoral modeling to capture the impacts of trends and shocks on human systems. The `gamut` package offers new data that meet a number of MSD needs. The package may be used to infer possible water resources expansion strategies for major cities in the United States. For example, cities found to be heavily exposed to potential contamination may be more likely to seek alternative means of supply (e.g., water transfers) or invest in water reuse facilities. In a study by Rice et. al which looked at de facto wastewater reuse across the US, it was found that there had been an increase in wastewater concentrations in drinking water treatment plants from a 1980 EPA report, especially at low flow conditions [@Rice:2013]. The `gamut` package has the ability to look at wastewater discharge and average flow to find these concentrations at a much larger scale, showing that this package could be useful in studies like this in the future. 

In addition to water contamination analysis, the `gamut` package has the ability to reveal which source watersheds are heavily protected by receiving cites. This information can inform land use and energy expansion scenarios applied in MSD research, for example by preventing significant expansion of human developments in protected source watersheds. `gamut` may also be used in large-scale hydrological modeling to correctly assign urban water demands to specific intakes. Whether research is being done on water scarcity, water pollution, or urbanization effects, the `gamut` package provides useful data that can brings greater understanding of anthropogenic impacts on city water resources. 

The `gamut` package is open source and may be downloaded using the [devtools](https://devtools.r-lib.org/) package with the code below [@Wickham:2020]. Further instructions on package download can be found in the [documentation](https://github.com/IMMM-SFA/gamut#readme).

```r
install.packages("devtools")
library(devtools)
devtools::install_github('IMMM-SFA/gamut')
library(gamut)
```

### Dependencies

`gamut` relies on functionality from the following R packages: 
    clisymbols [@Csardi:2017],
    crayon [@Csardi:2017],
    dplyr [@Henry:2020],
    dams [@Goteti:2020],
    exactextractr [@Baston:2020],
    foreign [@R-Core-Team:2020],
    geosphere [@Hijmans:2019],
    ggplot2 [@Wickham:2016],
    lwgeom [@Pebesma:2020],
    magrittr [@Bache:2014],
    purrr [@Henry:2020],
    raster [@Hijmans:2020],
    readxl [@Wickham:2019],
    reservoir [@Turner:2016],
    rgdal [@Bivand:2020],
    rgeos [@Bivand:2020],
    sf [@Pebesma:2018],
    sp [@Bivand:2013],
    spex [@Sumner:2020],
    stringr [@Wickham:2019],
    tibble [@Muller:2020],
    tidyr [@Wickham:2020],
    vroom [@Hester:2021],
    testthat [@Wickham:2011],
    knitr [@Xie:2014],
    rmarkdown [@Xie:2018],
    knitr [@Xie:2014].


### Acknowledgements

This research was supported by the U.S. Department of Energy, Office of Science, as part of research in [MultiSector Dynamics, Earth and Environmental System Modeling Program](https://climatemodeling.science.energy.gov/program/multisector-dynamics).

### References
