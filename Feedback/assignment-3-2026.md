# Assignment 3 formative feedback

This feedback is organised using the [Computing Bootcamp rubric](https://mulquabio.github.io/MQB/rubrics/Computing_Bootcamp_Rubric.html). It does not award a mark; use it to decide what to revise and check before final submission.

## Criterion 1: Repository organisation & workflow discipline

- Your root README, `code/` and `data/` provide a clear starting structure. The supplied input files are unchanged, `results` is ignored, and no generated results are tracked. Commits describe specific script and documentation additions.

## Criterion 2: Code completeness & functional correctness

- Before final submission, **Stop the fixed route when inputs are invalid.** Its checks print messages but continue to calculation and writing, explaining the invalid-input concern. Both tree scripts also accept zero despite their messages specifying positive distances and angles. Align the conditions with the required ranges and ensure invalid input stops before producing a result. The generalised invalid-distance run did stop with a useful message, so test its normal route separately.
- Before final submission, **Complete and test the generalised route separately.** The required `code/run_get_TreeHeight.sh` is missing. In `get_TreeHeight.R`, output naming refers to `test_path`, which is not defined in the supplied source, rather than the supplied input-path variable. Address these together, then test the R script and required shell route on an ordinary input. The generalised output was not collected, so its contents have not been assessed.

## Criterion 3: Code quality & style

As you revise, keep names descriptive, use comments to explain decisions rather than restating code, and avoid repeating the same calculation in several places.

## Criterion 4: Documentation

- The fixed tree-height script ran and created `results/TreeHts.csv`. Your code shows the degrees-to-radians conversion and angle-first, distance-second function interface. Your README also records an independent direct calculation for one tree: useful checking evidence, although that documented calculation was not independently rerun here.
- The generalised R script includes argument, file-existence and column checks. Your Pound Hill source documents its reshaping steps and explicitly converts counts to integers.
- Before final submission, **Make the tree CSV meet the required output format and values.** Successful execution did not establish a correct output: both comparison with the expected outputs found an invalid header. Your code and README example show an extra row-index column and `Height_m` rather than `height_m`. Check the CSV-writing options and column naming, then reopen the generated file and verify exactly these columns: `Species,Distance.m,Angle.degrees,height_m`. Header correction alone will not validate the height values.

## Criterion 5: Version-control practice

Commit each functional revision with a short message that says what changed; this makes your development easier to follow than one large final commit.

## Criterion 8: Basic error-handling & input validation

Test an ordinary case and an invalid case for each tree-height route, and confirm both the message shown and whether an output file was created or changed.

## Criterion 9: Problem-solving approach & method implementation

- Before final submission, **Finish the Pound Hill analysis beyond reshaping.** The supplied script ends after writing a long-format table; it does not yet calculate plot richness or create the required figure. Neither `results/pound_hill_plot_richness.csv` nor `results/pound_hill_plot_richness.pdf` was generated. Complete the route from species observations to plot-level richness, checking that richness counts species present rather than abundance. Compare those exact required paths with the filenames your script creates: spelling differences also matter. The captured tidyverse startup messages do not themselves identify an error.

## Criterion 10: Learning progression demonstration

Use this feedback as a revision checklist. Make the changes in small, descriptive commits, then add a short README note explaining what you changed and how you checked it. This will make your development from this formative checkpoint visible in the final portfolio.

## Priorities before final submission

- Run each route from the directory containing `code/`, `data/` and the root `README.md`. Before final submission, rerun one ordinary and one invalid tree case, checking the message, exit behaviour and whether a new result was written. Retain a direct height calculation as a numerical cross-check.
- For Pound Hill, manually check one plot against its underlying observations, then visually inspect the generated PDF’s labels, values and biological meaning. No PDF was available for review here.
- Extend the README with generalised and Pound Hill commands, dependencies, output paths and test examples; refresh the fixed-route example after correcting its CSV. Commit these revisions descriptively.
