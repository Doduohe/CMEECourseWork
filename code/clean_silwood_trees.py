#!/usr/bin/env python3
"""Validate and clean the synthetic Silwood tree survey."""

from __future__ import annotations

import csv
from pathlib import Path
from typing import Iterable


PROJECT_ROOT = Path(__file__).resolve().parents[1]
INPUT_PATH = PROJECT_ROOT / "data" / "silwood_trees_raw.csv"
RESULTS_DIR = PROJECT_ROOT / "results"

INPUT_FIELDS = [
    "record_id",
    "location",
    "genus",
    "species",
    "distance_m",
    "angle_degrees",
]
ISSUE_FIELDS = ["source_row", "record_id", "reasons"]
OAK_COUNT_FIELDS = ["species", "count"]


def load_records(path: Path = INPUT_PATH) -> list[dict[str, str]]:
    """Read the survey and check its column names."""
    with path.open(newline="", encoding="utf-8") as source:
        reader = csv.DictReader(source)
        if reader.fieldnames != INPUT_FIELDS:
            raise ValueError(
                f"Expected columns {INPUT_FIELDS}, found {reader.fieldnames}"
            )
        return list(reader)


def validate_record(
    row: dict[str, str],
    source_row: int,
    accepted_ids: set[str],
) -> tuple[dict[str, str] | None, list[str]]:
    """Clean one record, or return the reasons it cannot be used."""
    cleaned = {
        field: (row.get(field) or "").strip()
        for field in INPUT_FIELDS
    }
    reasons: list[str] = []

    # Missing text fields
    for field in ("record_id", "location", "genus", "species"):
        if not cleaned[field]:
            reasons.append(f"Missing {field}")

    # Record IDs must be unique
    record_id = cleaned["record_id"]
    if record_id and record_id in accepted_ids:
        reasons.append("Duplicate record_id")

    # Distance must be finite, non-negative number
    try:
        distance = float(cleaned["distance_m"])
        if not distance >= 0 or distance == float("inf"):
            reasons.append("distance_m must be finite and non-negative")
        elif distance != distance:  # NaN is not equal self
            reasons.append("distance_m must be finite and non-negative")
    except ValueError:
        reasons.append("distance_m must be numeric")

    # Angle must be numeric and between 0 to 360 degrees
    try:
        angle = float(cleaned["angle_degrees"])
        if not 0 <= angle <= 360:
            reasons.append("angle_degrees must be between 0 and 360")
    except ValueError:
        reasons.append("angle_degrees must be numeric")

    if reasons:
        return None, reasons

    # Store numeric values in consistent string format
    cleaned["distance_m"] = str(distance)
    cleaned["angle_degrees"] = str(angle)

    return cleaned, []


def process_records(
    rows: Iterable[dict[str, str]],
) -> tuple[list[dict[str, str]], list[dict[str, str]]]:
    """Sort records into accepted rows and issue reports."""
    clean_records: list[dict[str, str]] = []
    issues: list[dict[str, str]] = []
    accepted_ids: set[str] = set()

    # CSV line 1 for header
    for source_row, row in enumerate(rows, start=2):
        cleaned, reasons = validate_record(
            row, source_row, accepted_ids
        )

        if cleaned is not None:
            clean_records.append(cleaned)
            accepted_ids.add(cleaned["record_id"])
        else:
            issues.append(
                {
                    "source_row": str(source_row),
                    "record_id": (row.get("record_id") or "").strip(),
                    "reasons": "; ".join(reasons),
                }
            )

    return clean_records, issues


def summarise_oaks(clean_records: Iterable[dict[str, str]]) -> list[dict[str, str]]:
    """Count accepted oak records by species."""
    counts: dict[str, int] = {}

    for row in clean_records:
        if row["genus"].casefold() == "quercus":
            species = row["species"].casefold()
            counts[species] = counts.get(species, 0) + 1

    return [
        {"species": species, "count": str(count)}
        for species, count in sorted(counts.items())
    ]


def write_csv(
    path: Path,
    fieldnames: list[str],
    rows: Iterable[dict[str, str]],
) -> None:
    """Write rows to a CSV file, replacing an older copy."""
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as destination:
        writer = csv.DictWriter(destination, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    """Clean the survey and write the three result files."""
    clean_records, issues = process_records(load_records())
    oak_counts = summarise_oaks(clean_records)

    write_csv(
        RESULTS_DIR / "silwood_trees_clean.csv",
        INPUT_FIELDS,
        clean_records,
    )
    write_csv(
        RESULTS_DIR / "silwood_tree_issues.csv",
        ISSUE_FIELDS,
        issues,
    )
    write_csv(
        RESULTS_DIR / "oak_species_counts.csv",
        OAK_COUNT_FIELDS,
        oak_counts,
    )


if __name__ == "__main__":
    main()
