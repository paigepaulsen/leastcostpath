#### FETE testing ####

library(leastcostpath)
library(terra)
library(sf)

# my map, first try 3 written coordinates
# code starts direct from the example included in leastcostpath

b <- terra::rast("C:\\Users\\ppaulse2\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\ASTER_40N_int.tif")
plot(b, main='DEM check') # requires library(terra), I think, don't forget
 
slope_cs <- create_slope_cs(x = b, cost_function = "tobler", neighbours = 4) # this is the slow part so far

locs <- sf::st_sf(geometry = sf::st_sfc(
sf::st_point(c(457377, 2616555)),
sf::st_point(c(421219, 2751769)),
sf::st_point(c(459816, 2616211)),
crs = terra::crs(b)))
plot(locs, main='check points') # it's good

lcps <- create_FETE_lcps(x = slope_cs, locations = locs)
plot(lcps, main='testLCPs')
