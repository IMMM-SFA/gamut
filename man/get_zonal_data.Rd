% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/io.R
\name{get_zonal_data}
\alias{get_zonal_data}
\title{Get raster frequency per class from polygon input areas}
\usage{
get_zonal_data(raster_object, polygon)
}
\arguments{
\item{raster_object}{character. An object of class RasterLayer.}

\item{polygon}{character. A polygon to define spatial boundary of raster value counts (e.g. a given city's watersheds)}
}
\value{
table of crop types present and their coverage within the polygon area
}
\description{
Get raster frequency per class from polygon input areas
}
\details{
Get the coverage per class of raster values represented in the input raster dataset when restricted to the input watershed polygons for a target city.
}
\author{
Kristian Nelson (kristian.nelson@pnnl.gov)
}
