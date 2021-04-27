---
title: 'GAMUT: A Geospatial Analysis of Multisector Urban Teleconnections'
tags:
  - R
  - Multisector Dynamics
  - Water
  - Energy
  - Land
  - Urban
  - Geospatial
authors:
  - name: Kristian D. Nelson
    orcid: 0000-0002-6745-167X
    affiliation: 1
  - name: Sean W. Turner
    orcid: 0000-0003-4400-9800
    affiliation: 1
  - name: Chris Vernon
    orcid: 0000-0002-3406-6214
    affiliation: 1
  - name: Jennie Rice
    orcid: 0000-0002-7833-9456
    affiliation: 1
affiliations:
 - name: Pacific Northwest National Laboratory
   index: 1
date: 26 April 2020
bibliography: paper.bib
---

### Summary

Most cities in the United States withdraw surface water to meet public water supply needs. The lands on which this water is generated are often developed for human activities&mdash;such as agriculture, mining, and industry&mdash;that may compete for water resources or contaminate water supplies. Cities are thereby connected to other sectors through their water supply catchments. This connection is an example of an multisectoral urban teleconnection. The Geospatial Analytics for Multisectoral Urban Teleconnections (``gamut``) package provides national-scale information on these teleconnections by combining land use data with hydrological analysis to characterize urban source watershed human interactions across the conterminous United States (Figure 1).

<p align="center">
  <img width="900" height="500" src="gamut_figure.png">
</p>
<div align="center">
  Figure 1: The `gamut` package analyzes urban cities and their watersheds all across the conterminous US. As shown in the figure, it can look at characteristics like land use and facilities operations inside watershed boundaries. 
</div>  
<p>&nbsp;</p>                                        
  The ``gamut`` package computes dozens of city-level metrics that inform on the geographical nature of surface water supply catchments and the presence, intensity, and impact of human activities in those catchments. Each city’s watersheds are based on the Urban Water Blueprint [@McDonald:2014], which is enhanced with source contribution estimates as well as river flow and high-resolution runoff [@Nelson:2021]. Watershed delineations are used to mask several geospatial land use layers relating to electricity generation, agriculture, industry and other economic developments, and water infrastructure (dams, reservoirs, aqueducts). 

Metrics reported by ``gamut`` fall into four main categories: geographical characteristics of watersheds (e.g., climate zones, land area, distance from city, hydrology), potential water contamination concentrations (nonpoint and point), withdrawal/consumption of water from other sectors, and presence/intensity of multisectoral land uses. Table 1 shows all of the metrics that are created by this package, descriptions, and units. An R vignette is provided to help users to get started with ``gamut`` and may be accessed [here](https://github.com/IMMM-SFA/gamut#readme). 

Table 1: Metrics reported in gamut

| Metic Name                            | Description                                                                             | Units                 |
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
| n\_transfers\_in                      | Number of interbasin transfers that flow into the source watersheds                     | transfers             |
| n\_transfers\_out                     | Number of interbasin transfers that flow out of the source watersheds                   | transfers             |
| n\_transfers\_within                  | Number of water transfers that occur within the source watersheds                       | transfers             |
| n\_hydro\_plants                      | Number of hydro electric power plants operating within the source watersheds            | plants                |
| n\_thermal\_plants                    | Number of thermal power plants operating within the source watersheds                   | plants                |
| n\_fac\_agcrop                        | Number of agricultural crop facilities within the source watersheds                     | facilities            |
| n\_fac\_aglivestock                   | Number of agicultural livestock facilities within the source watersheds                 | facilities            |
| n\_fac\_cnsmnf                        | Number of construction and manufacturing facilities within the source watersheds        | facilities            |
| n\_fac\_mining                        | Number of mining facilities within the source watersheds                                | facilities            |
| n\_fac\_oilgas                        | Number of oil and gas facilities within the source watersheds                           | facilities            |
| n\_fac\_total                         | Total number of facilities operating within the source watersheds                       | facilities            |
| hydro\_gen\_MWh                       | Combined hydro electric generation from all the facilities within the source watersheds | Megawatthours         |
| thermal\_gen\_MWh                     | Combined thermal generation from all the facilities within the source watersheds        | Megawatthours         |
| thermal\_cons\_BCM                    | Combined water consumption that is used for thermal generation                          | billion cubic meters  |
| thermal\_with\_BCM                    | Combined water withdrawal for thermal generation                                        | billion cubic meters  |
| n\_utilities                          | Number of electric utilities within the source watersheds                               | utilities             |
| n\_ba                                 | Number of balancing authorities within the source watersheds                            | balancing authorities |
| n\_crop\_classes                      | Total number of different types of crops within the source watersheds                   | crops                 |
| cropland\_fraction                    | Fraction of land that is used for crops within the source watersheds                    | NA                    |
| developed\_fraction                   | Fraction of land that is developed within the source watersheds                         | NA                    |
| ag\_runoff\_max                       | Agricultural runoff as proportion of total runoff (worst-case watershed)                | %                     |
| ag\_runoff\_av\_exgw                  | Agricultural runoff as proportion of total runoff in supply (exc. groundwater)          | %                     |                                
| ag\_runoff\_av                        | Agricultural runoff as proportion of total runoff in supply (inc. groundwater)          | %                     |
| dev\_runof\_max                       | Urban runoff as proportion of total runoff (worst-case watershed)                       | %                     |
| dev\_runof\_av\_exgw                  | Urban runoff as proportion of total runoff in supply (exc. groundwater)                 | %                     |   
| dev\_runof\_av                        | Urban runoff as proportion of total runoff in supply (inc. groundwater)                 | %                     |
| np\_runoff\_max                       | Max amount of non-point source runoff within the source watersheds                      | %                     |
| np\_runoff\_av\_exgw                  | Nonpoint Proportion of Potentially Contaminated Supply (PPCS) (exc. groundwater)        | %                     |
| np\_runoff\_av\_exgw\_unweighted      | Nonpoint supply contamination averaged across watersheds                                | %                     |
| np\_runoff\_av                        | Nonpoint Proportion of Potentially Contaminated Supply (PPCS)                           | %                     |
| n\_economic\_sectors                  | Total number of different economic sectors within the source watersheds                 | sectors               |
| max\_withdr\_dis\_km                  | Maximum distance between a city’s intake points                                         | kilometers            |
| avg\_withdr\_dis\_km                  | Average distance between a city’s intake points                                         | kilometers            |
| n\_treatment\_plants                  | Total number of waste water treatment plants operating within the source watersheds     | plants                |
| watershed\_pop                        | Total number of people living within the source watershed boundaries                    | people                |
| pop\_cons\_m3sec                      | Combined water consumption from the source watersheds that is used for people           | m3/sec                |
| av\_fl\_sur\_conc\_pct                | Point PPCS (surface water only, based on flow)                                          | %                     |
| av\_fl\_sur\_conc\_pct\_unweighted    | Point PPCS (surface water only, based on flow, not weighted by source importance)       | %                     |
| av\_ro\_sur\_conc\_pct                | Point PPCS (surface water only, based on runoff)                                        | %                     |
| av\_fl\_all\_conc\_pct                | Point PPCS (based on flow)                                                              | %                     |
| av\_ro\_all\_conc\_pct                | Point PPCS (based on runoff)                                                            | %                     |
| av\_fl\_max\_conc\_pct                | Point PPCS (based on flow, worst-case catchment only)                                   | %                     |
| av\_ro\_max\_conc\_pct                | Point PPCS (based on runoff, worst-case catchment only)                                 | %                     |
| surface\_contribution\_pct            | Proportion of total average supply made up from surface water                           | %                     |
| importance\_of\_worst\_watershed\_pct | Proportion of total average supply made up from most heavily contamined watershed       | %                  \| |

### Statement of Need

MultiSector Dynamics (MSD) research  is the study of the co-evolution of human and natural systems. This research requires infrastructure expansion and land use scenarios, resource demand projections, and multisectoral modeling to capture the impacts of trends and shocks on human systems. The ``gamut`` package offers new data that meet a number of MSD needs. The package may be used to infer possible water resources expansion strategies for major cities in the United States. For example, cities found to be heavily exposed to potential contamination may be more likely to seek alternative means of supply (e.g., water transfers) or invest in water reuse facilities. ``gamut`` also reveals which source watersheds are heavily protected by receiving cites. This information can inform land use and energy expansion scenarios applied in MSD research, for example by preventing significant expansion of human developments in protected source watersheds. ``gamut`` may also be used in large-scale hydrological modeling to correctly assign urban water demands to specific intakes. ``gamut`` also provides a range of new data that can inform urban residents on the origins of their water supply.

The ``gamut`` package is open source and may be downloaded using the [devtools](https://devtools.r-lib.org/) package.

`devtools::install_github("https://github.com/IMMM-SFA/gamut.git")`

### Dependencies 

Imports: 
    clisymbols,
    crayon,
    dams,
    dataRetrieval,
    dplyr,
    exactextractr,
    foreign,
    geosphere,
    ggplot2,
    lwgeom,
    magrittr,
    purrr,
    raster,
    readxl,
    reservoir,
    rgdal,
    rgeos,
    sf,
    sp,
    stringr,
    tibble,
    tidyr,
    units,
    vroom

Suggests: 
    testthat (>= 2.1.0),
    knitr,
    rmarkdown

VignetteBuilder: knitr


### Acknowledgements

This research was supported by the U.S. Department of Energy, Office of Science, as part of research in MultiSector Dynamics, Earth and Environmental System Modeling Program.

### References 
