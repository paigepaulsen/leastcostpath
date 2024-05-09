library(leastcostpath)
library(terra)

#### Steps to produce the DEM used in further analysis. ####

# Not shown, download from earthdata with script (download file 4437984963 should allow to download same scenes)
# moved dem files into subfolder DEMs
# results in saved .tif in extdata folder 

### ASSIGN EACH ASTER TILE A VARIABLE NAME ###

# I did this in excel, using find replace to alter the slashes, quotes and rast( ) bit 

D01 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N26E056_dem.tif")
D02 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N26E055_dem.tif")
D03 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N25E056_dem.tif")
D04 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N25E055_dem.tif")
D05 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N25E054_dem.tif")
D06 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N24E057_dem.tif")
D07 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N24E056_dem.tif")
D08 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N24E055_dem.tif")
D09 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N24E054_dem.tif")
D10 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N24E053_dem.tif")
D11 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N23E059_dem.tif")
D12 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N23E058_dem.tif")
D13 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N23E057_dem.tif")
D14 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N23E056_dem.tif")
D15 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N23E055_dem.tif")
D16 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N23E054_dem.tif")
D17 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N23E053_dem.tif")
D18 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N22E059_dem.tif")
D19 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N22E058_dem.tif")
D20 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N22E057_dem.tif")
D21 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N22E056_dem.tif")
D22 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N22E055_dem.tif")
D23 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N22E054_dem.tif")
D24 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N22E053_dem.tif")
D25<- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N21E059_dem.tif")
D26 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N21E058_dem.tif")
D27 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N21E057_dem.tif")
D28 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N21E056_dem.tif")
D29 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N21E055_dem.tif")
D30 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N21E054_dem.tif")
D31 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N21E053_dem.tif")
D32 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N20E058_dem.tif")
D33 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N20E057_dem.tif")
D34 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N20E056_dem.tif")
D35 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N20E055_dem.tif")
D36 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N20E054_dem.tif")
D37 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N20E053_dem.tif")
D38 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N19E057_dem.tif")
D39 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N19E056_dem.tif")
D40 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N19E055_dem.tif")
D41 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N19E054_dem.tif")
D42 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N19E053_dem.tif")
D43 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N18E057_dem.tif")
D44 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N18E056_dem.tif")
D45 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N18E055_dem.tif")
D46 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N18E054_dem.tif")
D47 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N18E053_dem.tif")
D48 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N17E056_dem.tif")
D49 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N17E055_dem.tif")
D50 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N17E054_dem.tif")
D51 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N17E053_dem.tif")
D52 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N16E054_dem.tif")
D53 <- rast("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\MayASTER\\DEMs\\ASTGTMV003_N16E053_dem.tif")

## PUT TILES IN A LIST ##

rlist <- list(D01,
              D02,
              D03,
              D04,
              D05,
              D06,
              D07,
              D08,
              D09,
              D10,
              D11,
              D12,
              D13,
              D14,
              D15,
              D16,
              D17,
              D18,
              D19,
              D20,
              D21,
              D22,
              D23,
              D24,
              D25,
              D26,
              D27,
              D28,
              D29,
              D30,
              D31,
              D32,
              D33,
              D34,
              D35,
              D36,
              D37,
              D38,
              D39,
              D40,
              D41,
              D42,
              D43,
              D44,
              D45,
              D46,
              D47,
              D48,
              D49,
              D50,
              D51,
              D52,
              D53
)

### LIST INTO SPATIAL RASTER COLLECTION ###

# turn the list into a spatial raster collection with the terra function sprc() https://rdrr.io/cran/terra/man/src.html ##

rsrc <- sprc(rlist)

## mosaic the spatial raster collection into a single raster ##

m <- mosaic(rsrc)
plot(m, main='SpatRaster mosaic of MayASTER tiles') # double check whole thing looks good

## project the raster ##
mp <- project(m, "epsg:32640")
mp
plot(mp, main='mosaic ASTER tiles, projected utm 40n')

## limit the raster by the UTM 40N boundary ## 

LandArea <- vect("C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\LandOutlineSHP\\LandOnly_40N_Arabia.shp")
LandArea_p <- project(LandArea, "epsg:32640") # was in a slightly different projection before 
crs(LandArea_p)
plot(LandArea_p, main='checking polygon boundary') # check polygon loaded well

mp_crop <- crop(mp, LandArea_p) # cropped to rectangular bounding extent
plot(mp_crop, main='cropped not masked projected mosaic aster')

MASKED <- mask(mp_crop, LandArea_p) # mask out water, based on a shapefile originally based on the ASTER water vs land rasters
plot(MASKED, main='cropped and masked projected mosaic ASTER')

## save raster to .tif ##

writeRaster(MASKED, 'C:\\Users\\Paige\\Documents\\GitHub\\leastcostpath\\inst\\extdata\\ASTER_40N.tif', overwrite=TRUE, datatype="FLT4S")
