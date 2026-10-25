## General script to calculate height of trees from distance and angle
# using formula: height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"
#
# Run from the CMEECourseWork project root with:
# Rscript code/get_TreeHeight.R [input csv data file]

input_path <- commandArgs(trailingOnly = TRUE)
 
# Check that arguement was supplied
if (length(input_path) == 0) {
  stop("No input file supplied")
}

# Check that there is exactly one arguement
if (length(input_path) > 1){
  stop("Too many arguements supplied. Expected one input file")
}

# Check that the file exists
if(!file.exists(input_path)) {
  stop("Input file not found")
}

# Load in supplied trees data
df <- read.csv(input_path)

# Inspect
#head(df)
#str(df)

# Check required columns are present
expected_cols <- c("Species", "Distance.m", "Angle.degrees")

if (!all(expected_cols %in% colnames(df))) {
  stop("Missing one or more required columns. Expected Species, Distance.m, Angle.degrees")
}

# Check distances are between 0 and 100
if (any(df$Distance.m < 0 | df$Distance.m > 100)) {
  stop("Distance outside valid range. Expected: 0 < Distance ≤ 100")
}

# Check angles are between 0 and 90
if (any(df$Angle.degrees < 0 | df$Angle.degrees >= 90)) {
  stop("Angle outside valid range. Expected 0 < Angle < 90")
}

# Calculate height in metres
TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    return(height)
}

df$Height_m <- TreeHeight(df$Angle.degrees, df$Distance.m)

# Output tree heights as results/<input-basename-without-.csv>_treeheights.csv
dir.create("results")

input_basename <- sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(test_path))
output_path <- file.path("results", paste0(input_basename, "_treeheights.csv"))
write.csv(df, file = output_path)
