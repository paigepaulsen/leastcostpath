library(leastcostpath)

#' copied from create_FETE_lcps example section, adding to do changes

#' TO DO exchange for DEM of SE Arabia in tif format
r <- terra::rast(system.file("extdata/SICILY_1000m.tif", package="leastcostpath"))

#' TO DO will want to compare with different cost functions and numbers of neighbors
slope_cs <- create_slope_cs(x = r, cost_function = "tobler", neighbours = 4)

#' TO DO will need to update with points inside my study area
locs <- sf::st_sf(geometry = sf::st_sfc(
sf::st_point(c(839769, 4199443)),
sf::st_point(c(1038608, 4100024)),
sf::st_point(c(907695, 4145478)),
crs = terra::crs(r)))

lcps <- create_FETE_lcps(x = slope_cs, locations = locs)

#' Now, how do I see the output? 
#' plot(lcps)
#' 
plot(lcps)

#need to learn to save it, too