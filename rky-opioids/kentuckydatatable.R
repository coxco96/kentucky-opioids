library(dplyr)
library(tidyr)

ky_combined_buyer_annual <- combined_buyer_annual(state = "KY", key = "WaPo")
how_many <- unique(ky_combined_buyer_annual$BUYER_COUNTY)
how_many
length(how_many)
glimpse(ky_combined_buyer_annual)
jessamineco <- filter(ky_combined_buyer_annual, BUYER_COUNTY == "JESSAMINE")

jessamineco

jessaminefayette <-filter(ky_combined_buyer_annual, BUYER_COUNTY %in% c("FAYETTE", "JESSAMINE"))
jessaminefayette
jessaminefayettenarrow <- select("BUYER_COUNTY", "DOSAGE_UNIT")
jesssummary <- filter(jessaminefayettenarrow, BUYER_COUNTY == "JESSAMINE")
jesssummary <- summarize(jesssummary, avg_dosage_unit = mean(DOSAGE_UNIT)
grouped <- group_by(jessaminefayettenarrow, BUYER_COUNTY)                    
dosage_mean <- summarize(grouped, DOSAGE_UNIT=mean(DOSAGE_UNIT))
