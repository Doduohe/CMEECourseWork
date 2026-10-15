# Assignment 1 feedback - Leo He

**Formative feedback | Rubric 2026.2**

Q1-Q4 matched the independent checks, and your explanation of the missing final newlines is useful. Your own TSV is a small, readable test input, and the tab converter already checks that it receives one argument. The descriptive coursework commits also make the available work easier to follow.

The priority now is to complete csvtospace.sh and include all four temperature files. They are absent from the required locations, so their conversion could not be tested. This is missing work/input, not evidence that an unseen converter algorithm failed.

In tabtocsv.sh, reconsider the use of tr -s. Squeezing adjacent tabs can erase empty fields: two neighbouring separators may represent a missing value that needs to survive the conversion. Add such a row to your small test table and predict its output before running the script. Also check that the input is a readable regular file, create the repository's results directory and return an error if conversion fails.

Q5's output needs review rather than a claim of numerical correctness: it prints a label as well as the requested number, and the expression is unnecessarily difficult to follow. Make the output one ratio and explain the calculation simply. In Q2, +2 means start at line 2, not a general n+1 rule. Put the usage, tests, bc requirement and any help record in the missing root README.md, and ignore generated results. A README inside code/ does not replace that entry point.

---

## Project structure

Relevant tracked layout (simplified; missing required paths are marked):

```text
README.md  [missing]
.gitignore
code/  unixPrac1.txt, tabtocsv.sh; missing: csvtospace.sh
data/fasta/  3 required files present
data/temperatures/  missing here: 1800.csv, 1801.csv, 1802.csv, 1803.csv
data/tab-example.tsv
results/  no files tracked; generated on run
sandbox/  no files tracked; optional
Also: code/README.md
Also: OnlyClassExercises/
```

The Unix answers, tab converter, FASTA files and own TSV are in the root layout. csvtospace.sh and the four temperature files are missing. The README is inside code/ rather than at the root. OnlyClassExercises is a separate, clearly named classwork directory.

Add the missing assessed script and inputs, and provide a root README that explains the whole project; a directory-level README can remain as additional documentation. Keep classwork rather than deleting it, but make the assessed entry points obvious. Add a results ignore rule and let the converters create the output directory.

**Assessed snapshot:** `196205cb9656bd8cbfe48c1d1902bb937a0ea57a`
