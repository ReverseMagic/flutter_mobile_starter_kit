# Issues and Open Questions

Open items must be resolved with evidence or an explicit owner decision. Do not silently convert assumptions into requirements.

| ID | Issue | Why it matters | Next action | Status |
|---|---|---|---|---|
| I-001 | Repository visibility is currently public. | Anyone can view committed source and documentation. | Owner to confirm whether public visibility is intentional or change repository visibility to private in GitHub settings. | OPEN |
| I-002 | Existing technology-governance file is not present in this repository. | Exact package versions and typed-routing decisions must not be guessed. | Locate and review the user's current `FullStack.txt` / technology-stack definition before locking the dependency manifest. | OPEN |
| I-003 | Exact Flutter/Dart SDK baseline is not pinned. | Package compatibility and generated localization behavior depend on the SDK. | Verify current stable SDK and tooling, then pin the selected version. | OPEN |
| I-004 | GoRouter typed-route policy is unresolved. | The engineering skills recommend a different code-generation policy from the user's previous boilerplate. | Compare existing stack policy with current official GoRouter and go_router_builder documentation; record an explicit decision. | OPEN |
| I-005 | Local build environment has not been inspected. | Flutter analyze, tests, Android builds, and iOS builds cannot be claimed without running them. | Inspect available toolchain before assigning verification status. | OPEN |

## Evidence log

No Flutter project generation, dependency resolution, static analysis, automated tests, Android build, iOS build, simulator test, or device test has been run as part of the initial repository audit.
