# Issues and Open Questions

Open items must be resolved with evidence or an explicit owner decision. Do not silently convert assumptions into requirements.

| ID | Issue | Why it matters | Next action | Status |
|---|---|---|---|---|
| I-001 | Repository visibility is currently public. | Anyone can view committed source and documentation. | Owner to confirm whether public visibility is intentional or change repository visibility to private in GitHub settings. | OPEN |
| I-002 | Existing technology-governance file was initially missing from this repository. | Exact package versions and routing decisions must not be guessed. | Recovered and reviewed the user's governing technology definition from Library; reconciled the initial decisions in `DECISIONS.md`. | RESOLVED |
| I-003 | Exact Flutter/Dart toolchain must be confirmed locally. | The pinned Flutter version determines the exact bundled Dart patch and runtime compatibility. | Flutter 3.47.9 is pinned in `.fvmrc`; run `fvm flutter --version` and dependency resolution before claiming verification. | IN PROGRESS |
| I-004 | GoRouter typed-route policy was unresolved. | The skills repository and prior boilerplate decisions differ on route code generation. | Resolved: use manual GoRouter configuration and centralized route constants; do not add `go_router_builder` or build_runner. | RESOLVED |
| I-005 | No local Flutter/Android/iOS toolchain is connected to this GitHub-only workflow. | Local format/analyze/test/device checks cannot be claimed from repository inspection alone. | CI workflow is committed with a manual `workflow_dispatch` option. No workflow run has yet been observed from this connection. iOS simulator/device verification still requires macOS/Xcode/device access. | OPEN |
| I-006 | Repository visibility is public although private visibility was recommended. | The starter kit's source and documentation are publicly readable. | Owner must explicitly confirm public visibility or change it to private in GitHub repository settings. | OPEN |
| I-007 | Persistent language and theme preference storage is not selected. | The example currently changes preferences only in memory; the governing stack policy requires a concrete reason and approval before adding local persistence. | Keep the example explicitly temporary until the storage mechanism is approved. | OPEN |
| I-008 | Android and iOS native project folders are not yet generated. | The repository currently contains the Flutter Dart foundation but cannot yet be built as a complete mobile project. | Run the guarded PowerShell bootstrap script with FVM and then inspect generated platform files. | OPEN |

## Evidence log

- Repository metadata and default branch inspected through GitHub API.
- Initial repository tree contained only `README.md`.
- Flutter 3.47.9 is pinned in `.fvmrc`; exact bundled Dart patch remains to be read from that SDK.
- Package metadata was checked for Riverpod 3.5.0, GoRouter 18.1.3, and intl 0.20.3.
- Flutter ARB configuration was checked against the official internationalization documentation; generated output is configured as source under `lib/l10n/generated/` and is not committed.
- No Flutter dependency resolution, static analysis, automated tests, Android build, iOS build, simulator test, or device test has been run yet.
