## Function to calculate height of trees from distance and angle
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
# Rscript code/TreeHeight.R

# Load in trees data
df <- read.csv("data/trees.csv")

# Inspect
 head(df)
 str(df)

# Check required columns are present
expected_cols <- c("Species", "Distance.m", "Angle.degrees")

if (!all(expected_cols %in% colnames(df))) {
  print("Missing one or more required columns. Expected: Species, Distance.m, Angle.degrees")
}

# Check distances are between 0 and 100
if (any(df$Distance.m < 0 | df$Distance.m > 100)) {
  print("Distance outside valid range. Expected: 0 < Distance ≤ 100")
}

# Check angles are between 0 and 90
if (any(df$Angle.degrees < 0 | df$Angle.degrees >= 90)) {
  print("Angle outside valid range. Expected 0 < Angle < 90")
}

# Calculate height in metres
TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    return(height)
}

df$Height_m <- TreeHeight(df$Angle.degrees, df$Distance.m)

# Output tree heights
dir.create("results")
write.csv(df, "results/TreeHts.csv")
