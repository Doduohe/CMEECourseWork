# CMEECoursework

This is a personal repository for all my practice and assessed coursework from the Living Planet MRes EEC Computational Bootcamp module.

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

All code in this repository was written in and tested with Python 3.11, R 4.6, and GNU bash 3.2.

## Week 2 assignment

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

## Week 3 assignment

### TreeHeight.R

#### Usage

* Execute from root with `Rscript code/TreeHeight.R`
* Input path: `data/trees.csv`
* Output path: `results/TreeHts.csv`

#### Test run

```
bash-3.2$ Rscript code/TreeHeight.R
bash-3.2$ head results/TreeHts.csv
"","Species","Distance.m","Angle.degrees","Height_m"
"1","Populus tremula",31.6658337740228,41.2826361937914,27.8021161438536
"2","Quercus robur",45.984992608428,44.5359166583512,45.2460250644405
"3","Ginkgo biloba",31.2417666241527,25.1462585572153,14.6654828109493
"4","Fraxinus excelsior",34.6166691975668,23.336126555223,14.9341751666304
"5","Betula pendula",45.4661654261872,38.3491299510933,35.9703591412599
"6","Betula pendula",48.7955017434433,33.5923089866992,32.4102133664874
"7","Populus tremula",30.6472346419469,29.6680675458629,17.4582436344144
"8","Fagus sylvatica",35.0619523832574,40.6805929599795,30.1373803987097
"9","Quercus robur",39.9362466670573,26.95891767391,20.3124778877177
bash-3.2$ wc -l results/TreeHts.csv
     121 results/TreeHts.csv
bash-3.2$ Rscript -e 'paste0("Populus tremula check height = ", 31.6658337740228 * tan(41.2826361937914 * pi / 180))'
[1] "Populus tremula check height = 27.8021161438536"
```

## Data

All data including examples cloned in root/data can be found at the [MulQuaBio Project](https://github.com/MulQuaBio/MQB/tree/main/content/data)

## Credits

* All worked exercises, example scripts, and data are sourced from the [MulQuaBio Project](https://github.com/MulQuaBio/MQB/tree/main).
* Feedback on coursework is provided by course director mhasoba. 
* Personal implementations to the worked exercises are by the host Doduohe.
