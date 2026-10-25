# Assignment 2 formative feedback

This feedback is organised by the relevant computing bootcamp criteria. Use it to decide what is already working, what you need to investigate, and what to revise before the cumulative submission.

The full criteria are in the [Computing Bootcamp assessment rubric](https://github.com/MulQuaBio/MQB/blob/main/content/rubrics/Computing_Bootcamp_Rubric.md).

## 1. Repository organisation and workflow discipline

- Your root README, `.gitignore`, cleaning script and supplied data files are in the expected locations, and the supplied inputs are unchanged. Add `code/test_silwood_trees.py` under `code/`, as described under Criterion 8.

## 2. Code completeness and functional correctness

- The script ran and created all three output files. Now inspect their contents, because successful execution alone does not make the results correct.
- **Trace validation through to the summary.** Output checks found differences in all three tables: your run produced 29 clean rows, 7 issue rows and 3 oak-summary rows. These are output issues to investigate, not runtime failures; the exact cause is not yet clear. Start with one borderline input row: compare its treatment with the metadata, follow the decision in `validate_record()`, and check which collection receives it. Then follow accepted oak records into `summarise_oaks()` to check that only eligible records contribute and species are grouped as intended. These checks target the connected workflow rather than treating each table as a separate defect.

## 3. Code quality and style

- Your `main()` function gives the program a clear overall structure by connecting loading, processing, summarising and writing. Keep these stages distinct as you revise; use descriptive names and add short comments where the reason for a validation check or data-cleaning step is not obvious.

## 4. Documentation

- Your root README is in place. Make it useful to someone opening the repository for the first time: explain what the cleaner does, how to run the script and tests from the repository root, and which three files it creates. Test the instructions in a newly cloned copy of your repository (a separate folder created with `git clone`): enter that folder and run each README command exactly as written. If something fails, correct the command or add the missing step.

## 5. Version-control practice

- Since the previous formative feedback was added, the saved history contains 8 non-merge commits. Messages such as `Add project validate tree-survey records`, `Complete missing functions for project validate tree-survey records`, and `Add README` separate implementation and documentation into understandable checkpoints.
- Keep this pattern for the final revisions. Before each commit, use `git diff --staged` to check that it contains one coherent, working change, then write a concise message that names that change and, where it is not obvious, why it was needed.

## 8. Basic error handling and input validation

- **Add the separate test file.** `code/test_silwood_trees.py` is absent. This requirement was added retrospectively, so its absence is not being treated as disregard of the original instructions; it is still required for the final cumulative submission. Small, repeatable tests will help distinguish validation errors from partitioning or summary errors without relying on a full-data run.
- Add and run meaningful tests in `code/test_silwood_trees.py`: include a valid record, an invalid or boundary case from the released rules, checks of accepted/rejected placement, and a small oak-summary example whose result you can explain by hand. Rerun the full workflow after any corrections.

## 9. Problem-solving approach and method implementation

- Your code shows a clear workflow: `main()` loads rows through `load_records()`, passes them to `process_records()` and `validate_record()`, receives `(clean_records, issues)`, summarises the cleaned records with `summarise_oaks()`, then writes all three outputs. This makes the main steps visible.
- Trace one borderline record and a small set of accepted oak records through the relevant helpers. Compare each decision with the supplied metadata, leaving the raw input unchanged.
- After correcting the logic, keep the smallest example that exposed each problem as an assertion-based regression test in `code/test_silwood_trees.py`. Check the relevant function return value and the affected output table, then briefly explain the corrected data flow in your root README.
