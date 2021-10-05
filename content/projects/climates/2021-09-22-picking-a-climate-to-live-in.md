---
title:	"Picking a climate to live in"
date: 2021-09-22
---

I’ve always lived in California with the exception of two brief years in London. There’s too much to say about living somewhere else; how it broadens your experiences and changed your views, but one aspect I find interesting is that it truly takes being somewhere for a few years to learn what a different climate is like.

California is frequently credited, probably mostly by Californians, for having amazing weather. “It’s the Mediterranean climate,” my mom says. As always, she’s right, but my experience in the UK left me with some nagging thoughts around California’s unbeatable climate: If the climate here is so wonderful, why are the hills only green for 2 months out of the year before returning to kindling? This is especially bothersome in contrast to the UK where the greenery and water seems to be a constant year round.

So how is that possible? Well the immediate answer via Google is my mom’s of course. California has a Med. climate one of many differences are hotter, drier summers in comparison to the climate of the UK. This difference lends itself to year round growing conditions that are more suitable to green grass than wine grapes, which explains the major differences in the countryside flora between CA and UK.

I’m satisfied with this explanation, but I want a deeper understanding of how these differing climates breakdown worldwide without the previously mentioned requirement of having to live in each place for a number of years. So I’ve set out to create some sort of map to visualize this.

## Map + Data = GIS

My very first guess at how to do this was to get averages of weather data tied to geographic areas and just plop that on a map to browse. I started by browsing what weather.com or Accuweather provide, but it was mostly forecast data and typically very expensive. 

Fortunately, I know that governments provide weather data for free, though I wasn’t sure if they provided the averages that I wanted. **Un**fortunately, this is when I realized just how fractured climate data / research is, which at this point you would think would be very uniform and standardized given it’s popularity in research.

There is no one or two or even three centralized government agencies with climate / weather data. The most prevalent provider seems to be the [various sub-agencies of NOAA](https://www.noaa.gov/about/organization), but there are many others from USGS to NASA to NSF. At least I learned through the browsing step that there is both ample amounts of data to do what I want to do and that what I’m looking for is not necessarily called “averages,” but what are known as Climate Normals.

Climate Normals are defined as means of climate features (temperature, precipitation, etc) over a 30 year period. The US publishes many versions from it’s many agencies. The easiest to find is [NCEI’s normals](https://www.ncei.noaa.gov/products/land-based-station/us-climate-normals), which seems to only give you data from individual stations in the US. After a bit more browsing I see [a mention](https://www.ncei.noaa.gov/access/metadata/landing-page/bin/iso?id=gov.noaa.ncdc:C00005) of a “gridded” [dataset called nClimGrid](https://www.drought.gov/data-maps-tools/gridded-climate-datasets-noaas-nclimgrid-monthly) that is created interpolating station readings across the US using a topographic and climatological to 5km. Gridded data over the US is a great start, but I want to do this world wide. I’ve at least learned what I’m searching for: “gridded climate normals.”

## Prior Art

The search lands you infinitely better resources right off the bat: [ClimateEU](https://sites.ualberta.ca/~ahamann/data/climateeu.html) and [PRISM](https://prism.oregonstate.edu/normals/), both of which are essentially “PRISM” under the hood. What all these gridded datasets turn out to be is interpolated observations to a grid using a custom interpolation method. ClimateWNA, ClimateNA, ClimateEU, PRISM — these all use the same PRISM interpolation method which is an intelligent agent using what is called an “expert system” in AI made in Oregon. This interpolation method seems to be a significant improvement on the nClimGrid, which has its own multivariate interpolation. The PRISM interpolation seems superior to the nClimGrid just based on the resolution of the output. 

I spend some time reading through the research papers connected with Climate*. I’m a bit disappointed to be honest. Though the papers go into detail on the methods, the source of the application used to upscale climate data is only provided as closed source. PRISM seems to charge money for significantly upscaled versions of the US data, providing the lower resolution versions on it’s website for free.

Though the higher resolution (<1km grid) is an improvement, I feel like the piecemeal datasets of different continents using different file formats and sometimes requiring the PRISM program to be run, aren’t what I’m looking for. Searching through the papers that cite the PRISM work, I finally land on [WorldClim](https://www.worldclim.org/data/worldclim21.html) (on the way I spotted [other](https://psl.noaa.gov/data/gridded/data.UDel_AirT_Precip.html) [promising](https://data.giss.nasa.gov/gistemp/index_v3.html) [suspects](https://cds.climate.copernicus.eu/cdsapp#!/dataset/reanalysis-era5-land-monthly-means)).

## Searching for the Goal

For some reason, it wasn’t until this point, after reading several papers that I had the thought: “O, maybe somebody already mapped out climate regions.” And surely, the did, many many times. 

I learned about the [Köppen](https://en.wikipedia.org/wiki/K%C3%B6ppen_climate_classification) climates and then immediately [read the paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6207062/) that is referenced for the image on Wikipedia. The group responsible has a [wonderful website](http://www.gloh2o.org/koppen/) with very high quality climate data and research. Additionally, ArcGIS also has done [similar work](https://storymaps.arcgis.com/stories/61a5d4e9494f46c2b520a984b2398f3b) even more recently in 2020 with their [own published paper](https://www.sciencedirect.com/science/article/pii/S2351989419307231?via%3Dihub) that contains their methods.

Both groups used WorldClim! The Köppen work used three other sources for climate data, but still WorldClim seems to be the major contributor here. Both groups used a similar process of stratifying temperature and precipitation to land on climates, though different sources for the precipitation. They vary a bit in their methodologies. 

While the Köppen group was obviously using the Köppen definitions of climate groups, the ArcGIS group was going for more than just climate groups. They were really going for specific biomes so land cover type is included, but along the way the used a different definition of climate regions called [IPCC guidelines](https://library.wur.nl/WebQuery/hydrotheek/1885455), not the Köppen.

## Summary

This more or less gives me everything I need: possible methods of analysis and good sources of data. 

*Other data sources:*

Modis’ [Land Cover](https://modis.gsfc.nasa.gov/data/dataprod/mod12.php) and [NDVI/EVI](https://modis.gsfc.nasa.gov/data/dataprod/mod13.php)

The [Global Aridity and PET dataset](https://cgiarcsi.community/data/global-aridity-and-pet-database/)

  