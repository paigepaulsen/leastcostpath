library(leastcostpath)
library(terra)
library(sf)

d_orig <- rast("C:\\Users\\ppaulse2\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\ASTER_40N_int.tif")
d_orig
#dem_mean_agg10 <- aggregate(d_orig,fact=10, fun=mean)
#dem_mean_agg05 <- aggregate(d_orig, fact=5, fun=mean)

slope_cs <- create_slope_cs(x = d_orig, cost_function = "tobler", neighbours = 4)
cs_rast <- rasterise(slope_cs)

writeRaster(cs_rast, "./Paige_Attempt/output/CS_DEMagg01_tobl_neighb4.tif")
