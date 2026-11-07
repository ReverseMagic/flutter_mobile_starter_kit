# Engineering Instructions

This repository is a reusable Flutter mobile starter kit for Android and iOS.

## Non-negotiable rules

- Treat this repository's documented decisions as the source of truth.
- Do not invent requirements, technologies, APIs, package versions, platform behavior, or implementation outcomes.
- When a decision is missing, ambiguous, or conflicting, record it in `docs/ISSUES.md` and research current official documentation before deciding.
- Prefer Flutter and Dart SDK capabilities before adding dependencies.
- Add a dependency only when a documented requirement justifies it; verify current compatibility and maintenance status first.
- Keep the architecture understandable, feature-oriented, and proportional to the actual requirements.
- Do not add speculative abstractions, microservices, generated-code frameworks, or product-specific features to a generic starter kit.
- Keep secrets out of source control. Backend credentials and privileged operations must never be embedded in a mobile client.
- Preserve Android and iOS platform conventions, accessibility, localization, RTL/LTR correctness, and responsive phone layouts.
- Never claim a command, test, build, device check, or audit passed unless it was actually run and its result was observed.
- Do not claim independent agents or reviews unless they were actually performed.

## Required change workflow

1. Read the relevant project requirements and decisions before changing code.
2. Identify the requirement or defect the change addresses.
3. Research current official documentation when behavior, APIs, versions, or compatibility may have changed.
4. Make the smallest complete change that satisfies the requirement.
5. Add or update regression tests where appropriate.
6. Run formatting, static analysis, tests, and platform builds when the required toolchain is available.
7. Report changed files, observed verification, unverified areas, blockers, and remaining decisions honestly.

## Project governance

- `docs/PROJECT.md` defines purpose and scope.
- `docs/REQUIREMENTS.md` defines traceable requirements and acceptance criteria.
- `docs/DECISIONS.md` records accepted technical and product decisions.
- `docs/ISSUES.md` records unresolved questions, conflicts, and blockers.

Do not silently override these documents. Update the relevant decision or issue record when a decision changes.
