# This is the script used for Meteorites Weekend Homework - PDA

library(tidyverse)
library(janitor)

meteorite_data <- read_csv("meteorite_data/meteorite_landings.csv")

#Investigation file / tibble

 names(meteorite_data)
 
 dim(meteorite_data)
 
 meteorite_data
 
clean_janitor_meteorite_data <- meteorite_data %>% 
 clean_names()

clean_janitor_meteorite_data %>% 
    names()
 
#Start problems

clean_janitor_meteorite_data

## change for numeric, No work

#clean_janitor_meteorite_data %>% 
 #mutate(geo_location = as.numeric(geo_location))



# NA to 0 , didnt work

  # clean_janitor_meteorite_data %>% 
  #   mutate(geo_location = coalesce(geo_location,na.rm = 0))  No work
  
  
  

#Split geo_location, the only way I managed to do it and keep the columns


clean_janitor_meteorite_data_separate <-clean_janitor_meteorite_data %>%
        separate(geo_location, c("latitude", "longitude"), ", ")


clean_janitor_meteorite_data_separate



#transform NA to 0

clean_janitor_meteorite_data_separate %>% 
  coalesce(across(latitude,longitude), 0)

#change to numeric

clean_janitor_meteorite_data_separate %>% 
  mutate(across(latitude,longitude) = as.numeric)



#Remove meteorites less than 1000g in weight from the data.


clean_janitor_meteorite_data_separate_filter <- clean_janitor_meteorite_data_separate %>% 
  filter(mass_g >=1000)





