#analysis of canopy data
library(ggplot2)

source("code/functions.R")

#import data 
  canopy <- read.csv("data/canopy_humidity.csv")
  head(canopy)
  
#convert units
  canopy$canopy_perc_fixed <- correct_canopy(canopy$canopy_perc)
  canopy$soil_hum_prop <- convert_humidity(canopy$soil_hum_perc)

  head(canopy)

#visualize data
  by_forest <- ggplot(aes(x=soil_hum_prop, y=canopy_perc_fixed), data=canopy)+
    geom_point(aes(colour=as.factor(site_id)))+
    facet_wrap(~forest_type)
  by_forest

#basic analysis
  lm_simple <- lm(canopy_perc_fixed~soil_hum_prop, data=canopy)
  lm_simple
  
  lm_hum_forest <- lm(canopy_perc_fixed~soil_hum_prop+forest_type, data=canopy)
  lm_hum_forest
  anova(lm_hum_forest)

  #To be continued...
