###This version of the accumulated cost corridors is intended for testing and modification###

library(leastcostpath)
library(terra)

# seed so you get the same results each time. Takes into account that you generate random points.
set.seed(NULL)
set.seed(1)

c <- terra::rast("./inst/extdata/ASTER_40N_int.tif")
r <- aggregate(c, fact=10, fun=mean)

# this is done so i can create a polygon for the island of sicily. This polygon will be used to generate the points that I want to connect
r2 <- r
r2[!is.na(r2)] <- 0

slope_cs <- create_slope_cs(x = r, cost_function = "tobler", neighbours = 4)

# using r2 I create a polygon.
r_extent <- terra::as.polygons(r2)
r_extent <- sf::st_as_sf(r_extent)
r_extent <- sf::st_cast(r_extent, "POLYGON")
r_extent <- r_extent[which.max(sf::st_area(r_extent)),]

# generate 50 regularly spaced points within the island of sicily.
# can also do type = 'random' which will randomise location of points. Perhaps more suitable and might eliminate potential 'horizontal/vertical' lines as a result of the 'regular' pts.
r_pts <- sf::st_sample(r_extent, size = 50, type = "random")
r_pts <- sf::st_sf(r_pts)

plot(r_pts)
plot(r_extent, add = T)
plot(r_pts, add = T, pch = 16)

# this is the base where I'll add the cost corridors to.
r3 <- r
r3[!is.na(r3)] <- 0

plot(r3)

for(i in 1:nrow(r_pts)) { 
  
  # for each of the 50 generated points calculate cost corridors to the other 49 points.
  
  print(i)
  
  origin <- r_pts[i,]
  destination <- r_pts[-i,]
  
  nrow(destination)
  
  for(j in 1:nrow(destination)) { 
    
    print(j)
    
    cc <- create_cost_corridor(x = slope_cs, origin = origin, destination = destination[j,], rescale = TRUE)
    
    # filter to the lowest 1% of accumulated costs from origin to destination
    cc[cc > 0.01] <- NA
    # make this 1% accumulated cost have a value of 1, and all other areas zero
    cc[!is.na(cc)] <- 1
    cc[is.na(cc)] <- 0
    # add to original r3
    r3 <- r3 + cc
    
  }
}

plot(r3)

r4 <- r3

# normalised r3 to be between 0 and 1
nx <- minmax(r4)    
rn <- (r4 - nx[1,]) / (nx[2,] - nx[1,])

plot(rn)
plot(r_pts, add = T, pch = 16)
plot(rn)

writeRaster(rn, "./Paige_Attempt/output/Acc_cc_n50_ran_agg10_tobl_neighb4.tif")
