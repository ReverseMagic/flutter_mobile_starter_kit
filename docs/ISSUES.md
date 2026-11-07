# Issues and Open Questions

Open items must be resolved with evidence or an explicit owner decision. Do not silently convert assumptions into requirements.

| ID | Issue | Why it matters | Next action | Status |
|---|---|---|---|---|
| I-001 | Repository visibility is currently public. | Anyone can view committed source and documentation. | Owner to confirm whether public visibility is intentional or change repository visibility to private in GitHub settings. | OPEN |
| I-002 | Existing technology-governance file was initially missing from this repository. | Exact package versions and routing decisions must not be guessed. | Recovered and reviewed the user's governing technology definition from Library; reconciled the initial decisions in `DECISIONS.md`. | RESOLVED |
| I-003 | Exact Flutter SDK baseline must be pinned and verified in CI. | Package compatibility and generated localization behavior depend on the SDK. | Initial baseline selected as Flutter 3.47.9; confirm the bundled Dart version from the actual SDK during CI bootstrap. | IN PROGRESS |
| I-004 | GoRouter typed-route policy was unresolved. | The skills repository and prior boilerplate decisions differ on route code generation. | Resolved: use manual GoRouter configuration and centralized route constants; do not add `go_router_builder` or build_runner. | RESOLVED |
| I-005 | No local Flutter/Android/iOS toolchain is connected to this GitHub-only workflow. | Local format/analyze/test/device checks cannot be claimed from repository inspection alone. | Use a pinned GitHub Actions Flutter environment for executable checks; iOS simulator/device verification still requires macOS/Xcode/device access. | OPEN |
| I-006 | Repository visibility is public although private visibility was recommended. | The starter kit's source and documentation are publicly readable. | Owner must explicitly confirm public visibility or change it to private in GitHub repository settings. | OPEN |

## Evidence log

- Repository metadata and default branch inspected through GitHub API.
- Initial repository tree contained only `README.md`.
- No Flutter project generation, dependency resolution, static analysis, automated tests, Android build, iOS build, simulator test, or device test has been run yet.
- Current stable package metadata was checked for Riverpod, GoRouter, and intl; exact resolution must be confirmed by `flutter pub get` in the pinned Flutter SDK.
