library(tidyverse)

# Load in data
data <- as.matrix(read.csv("data/pound_hill_data.csv", header = FALSE))
metadata <- read.csv("data/pound_hill_meta_data.csv", sep = ";")

# Inspect data
head(data)
dim(data)
head(metadata)
str(metadata)

# Transpose species to columns and quadrat to rows
data <- t(data)
head(data)
dim(data)

# Convert blank species counts to 0 as observed absence
data[data == ""] <- 0

# Convert raw matrix to dataframe
temp_data <- as.data.frame(data[-1, ])
colnames(temp_data) <- data[1, ]
rownames(temp_data) <- NULL

# Convert data from wide to long format
wrangled_data <- temp_data |>
  pivot_longer(
    cols = -c(Cultivation, Block, Plot, Quadrat),
    names_to = "Species",
    values_to = "Count"
  )

# Assign class
wrangled_data <- wrangled_data |>
  mutate(
    across(c(Cultivation, Block, Plot, Quadrat), as.factor),
    Count = as.integer(Count)
  )

str(wrangled_data)
head(wrangled_data)
dim(wrangled_data)

# Save derived table as new file
dir.create("results", showWarnings = FALSE)
write.csv(wrangled_data, "results/pound_hill_long.csv", row.names = FALSE)
