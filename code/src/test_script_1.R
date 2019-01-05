
# Step 1. Forecast know locations ---------------------------------------------------------------------------------

library(tidyverse)
library(forecast)
library(readxl)
library(sf)
library(sp)
library(data.table)

# load data
train_dat <- read_csv("data/src/training.csv")
coords <- read_excel("data/src/locations.xlsx")
coords_blnd <- read_excel("data/src/blindLoc.xlsx")

# check data structure
glimpse(train_dat)

time_line = train_dat %>%
     summarise(time_start = min(dates), time_end = max(dates))

# Join train data with coordinates

## transpose function
transpose_df <- function(df) {
     t_df <- transpose(df[-1]) %>%
          mutate(location = names(df[-1])) %>%
          as_data_frame()
     return(t_df)
}

# using the function

train_main <- train_dat %>%
     select(-dates) %>%
     transpose() %>%
     mutate(location = names(train_dat[-1])) %>%
     as_data_frame() %>%
     left_join(coords)
     
# Add coordinate system to data

coordinates(train_main) <- ~ lat + long
coordinates(coords_blnd) <- ~ lat + long
