# If statements
a <- TRUE
if (a) {
  print("a is TRUE")
} else {
  print("a is FALSE")
}

z <- runif(1)
if (z <= 0.5) {
  print("Less than a half")
}

# For loops
for (i in 1:10) {
  j <- i * i
  print(paste(i, " squared is", j))
}

1:10
seq(10)

# Loop over strings
for (species in c("Heliodoxa rubinoides",
                  "Boissonneaua jardini",
                  "Sula nebouxii")) {
  print(paste("The species is", species))
}

# Loop using pre-existing vector
v1 <- c("a", "bc", "def")
for (i in v1) {
  print(i)
}