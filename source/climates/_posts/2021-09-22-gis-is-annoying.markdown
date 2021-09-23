---
layout:	post
title:	"GIS is annoying"
date:	Sep 22, 2021
---

  I’m terrible at picking titles. The TLDR here is that GIS is an incredibly fractured space, which makes it difficult to get started doing data analysis on spatial data even if you’re bringing technical knowhow with you from other areas. Everything from data sources to data formats to tooling is not standardized and poorly documented.

#### Data Sources

I covered the sources a bit in my previous note. The related synopsis being that the government weather data sources is fractured, with an additional theme of endless Googling and following links til you stumble upon something useful, as opposed to a standard source where the experience would be centralized and easy to find. 

The next aspect is that the systems used to get this data are often piecemeal and of varying quality. Government systems provide a chaotic mix of [web driven wizards](https://www.ncei.noaa.gov/products/land-based-station/us-climate-normals), [interactive interfaces](https://coast.noaa.gov/dataviewer/#/imagery/search/), [applications](https://lpdaacsvc.cr.usgs.gov/appeears/), [pure-HTTP file hosting](https://lpdaac.usgs.gov/tools/data-pool/%27), [specific storage systems](https://lpdaac.usgs.gov/tools/opendap/) and more. The other dimension here is that this breakdown is different across all the agencies. The USGS has an entirely different account system from some of the NOAA data for example.

The same variance in data delivery methods exists in non-governmental sources as well, which is more understandable but it’s unfortunate that there isn’t some “Github” of data that is more common here. There seem to be some attempts. ArcGIS has it’s own data library for it’s software and Google Earth Engine does too, but these are really for specific software platforms and not for general analysis. 

#### Data Formats

Then there’s the data formats. The funniest format for me was “ascii,” which I thought would be something similar to CSV. Something human and machine readable. It turns out that ascii in the GIS community means a specific format that ArcGIS uses. It still is ascii encoded so I guess that counts as both human and machine, but reading the file in Python was non-trivial. 

Ascii is certainly one of the most ridiculous dataformats. While Shapefiles and GeoTIFFs seem to be the more common formats at least for climate data. The formats really vary all over the place. Government sources seem to favor extremely technical formats from XML to NetCDF, while academic sources provide whatever the author felt like. Even between ClimateEU and ClimateNA there isn’t a consistent dataformat.

If you need anymore evidence, just look at [all the formats](https://gdal.org/drivers/raster/index.html) the primary conversion tool uses, which brings me to tooling.

#### Data Tools

The big players here are Google Earth, ArcGis, and QGis. All of which are visual programs for doing analysis. With the exception of QGis, which I believe is part of the larger [OSGeo project](https://www.osgeo.org/) to open source GIS tools, these tools don’t play well with each other and constrain you to their environment. 

When it came to ingesting this data into coding environment (my choice for data analysis is Python) it was difficult to get started. The primary tool seems to be [GDAL](https://gdal.org/#) (also part of OSGeo). GDAL is written in C and the Python model under the same name simply binds to the C interfaces, which is rather difficult to work with. There ends up being a rag-tag collection of other modules. Based on what data format you’re working with (the headache discussed above) could require any number of python modules.

Finally mapping that data from that same environment is additionally cumbersome. If you would simply like an image, there are a number of tools that provide hooks to do so like the indispensable [matlibplot](https://www.earthdatascience.org/courses/scientists-guide-to-plotting-data-in-python/plot-spatial-data/customize-raster-plots/customize-matplotlib-raster-maps/). Something interactive however requires considerable familiarity with the tooling to not only generate a raster file of the data but then translate that raster file into a tiled image. Or, if the data is suitable to it, create a vectorized representation using a GeoJSON library.

#### Favorites

I like [rasterio](https://rasterio.readthedocs.io/en/latest/). I tried to use GDAL more directly in Python but rasterio is the one that’s worked so far with reasonably good documentation. I’m hoping to end up with tiled map layers for a [leaflet](https://leafletjs.com/) map. I had hoped to use [folium](http://python-visualization.github.io/folium/) directly from iPython to start messing around with it, but so far it’s been difficult to create a mappable layer. I’ve seen from leaflet that [maptiler](https://www.maptiler.com/engine/) is the preferred method of making tiled layers, but maptiler itself seems locked up in some pay to use service so I might have to cobble something together with GDAL if I can figure out how.

#### Summary

I realize that the amount of data in some cases here is very large. The potential for a large dataset that can represent literally anything in the world creates a situation that’s hard to generalize. I get that, but it’s unfortunate to see the powerful tooling to be locked up in paid applications and platforms. I guess it’s a comment on GIS’ ubiquity and importance though. You’ve got to have it and so you’ll pay for it.

Next up, actually creating something with all of this.

  