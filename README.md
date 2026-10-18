# CMEECoursework - My coursework repository

This is the repository for all my practice and assessed coursework from the ICL postgraduate CMEE computational bootcamp module.

## Project structure

```plaintext
.
├── Feedback
├── OnlyClassExercises
│   ├── code
│   ├── data
├── code
├── data
└── README.md
```

## Requirements

All code in this repository was written in and tested with Python 3.11.5, R 4.6.0, and GNU bash 3.2.57.

## Usage 

### clean_silwood_trees.py

#### Input and output files

| File | Path | Purpose|
| --- | --- | --- |
| Input | ~/code/silwood_trees_raw.csv | Raw tree survey data to be cleaned |
| Output | ~/results/silwood_trees_clean.csv | Records that passed validation |
| Output | ~/results/silwood_trees_issues.csv | Records that failed validation and why |
| Output | ~/results/oak_species_counts.csv | Counts of accepted oak records by species |

#### Pseudocode summary

```text
INPUT: observations with record_id, location, genus, species, distance_m, and angle_degrees
Load in data; check input fields; stop and report an error for invalid input
For each record: 
    if:
        ID already accepted
        location, genus, or species not present
        distance cannot be converted to number
        angle_degrees cannot be converted to number or outside permitted range 0-360
    then: 
        return list of invalid records with reason for error
    else:
        return list of valid records
Summarise counts for oak species for list of valid records
OUTPUT: CSV file with each valid record of oak summarised by species; CSV file with all valid records; CSV file with all invalid records with reason for error
```

## Data

All data including examples cloned in root/data can be found at the [MulQuaBio Project](https://github.com/MulQuaBio/MQB/tree/main/content/data)

## Credits

* All worked exercises, example scripts, and data are sourced from the [MulQuaBio Project](https://github.com/MulQuaBio/MQB/tree/main).
* Feedback on coursework is provided by course director mhasoba. 
* Personal implementations to the worked exercises are by the host Doduohe.
