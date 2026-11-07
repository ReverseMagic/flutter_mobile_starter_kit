# Issues and Open Questions

Open items must be resolved with evidence or an explicit owner decision. Do not silently convert assumptions into requirements.

| ID | Issue | Why it matters | Next action | Status |
|---|---|---|---|---|
| I-001 | Repository visibility is currently public. | Anyone can view committed source and documentation. | Owner to confirm whether public visibility is intentional or change repository visibility in GitHub settings. | OPEN |
| I-002 | Existing technology-governance file was initially missing from this repository. | Exact package versions and routing decisions must not be guessed. | Recovered and reviewed the user's governing technology definition; reconciled the decisions in `DECISIONS.md`. | RESOLVED |
| I-003 | Exact Flutter/Dart toolchain must be confirmed locally. | The pinned Flutter version determines the exact bundled Dart patch and runtime compatibility. | GitHub Actions reported Flutter 3.47.9 and Dart 3.13.7; dependency resolution, analysis, tests, and Android debug build passed. Local FVM setup is still user-side. | RESOLVED |
| I-004 | GoRouter typed-route policy was unresolved. | The skills repository and prior boilerplate decisions differ on route code generation. | Resolved: use manual GoRouter configuration and centralized route constants; do not add `go_router_builder` or build_runner. | RESOLVED |
| I-005 | iOS build verification is outstanding. | Generated iOS files do not prove the Xcode project compiles. | Added a macOS GitHub Actions job to run `flutter build ios --no-codesign`; inspect its first result. Simulator and device checks remain separate. | OPEN |
| I-006 | Persistent language and theme preference storage is not selected. | The example currently changes preferences only in memory; adding a persistence package would be a stack decision. | Keep the example explicitly temporary until the storage mechanism is approved. | OPEN |
| I-007 | Optional shell-navigation example is not implemented. | The starter should support apps with and without a persistent navigation shell. | Add and test a separate optional shell-router example without making it the default router. | OPEN |

## Evidence log

- Repository metadata and default branch inspected through GitHub API; repository is currently public.
- Public engineering skills repository and its root skill/shared references inspected on 2026-11-07.
- Flutter 3.47.9 and Dart 3.13.7 were reported by the successful GitHub Actions runner.
- Package resolution completed for the pinned Flutter SDK; `pubspec.lock` is committed.
- Flutter ARB localization generation completed.
- Successful GitHub Actions run: [native generation and Android debug build](https://github.com/ReverseMagic/flutter_mobile_starter_kit/actions/runs/42417921244).
- The successful native-generation run included dependency resolution, localization generation, formatting, analysis, four tests, and Android debug APK build.
- Android and iOS project folders are present in the main branch.
- The initial CI workflow formatted files by mutating the working tree. It has been replaced with a non-mutating format check and read-only repository permissions.
- No iOS build result, simulator test, physical-device test, release-signing test, or store-submission test is claimed yet.
