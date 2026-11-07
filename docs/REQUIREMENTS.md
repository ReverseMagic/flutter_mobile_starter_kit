# Requirements

Status values: `PROPOSED`, `ACCEPTED`, `IMPLEMENTED`, `VERIFIED`, `BLOCKED`.

Requirements remain proposed until the relevant technical decisions are accepted. A requirement is not verified merely because files were committed.

| ID | Requirement | Acceptance criteria | Status |
|---|---|---|---|
| SK-001 | Android and iOS mobile foundation | Flutter project targets Android and iOS phones; no web/desktop targets are introduced as product scope. Native folders are present; Android build is verified; iOS build remains to be checked on macOS. | IMPLEMENTED |
| SK-002 | Governed technology stack | Every direct dependency and important architecture choice is documented with compatibility evidence. | IMPLEMENTED |
| SK-003 | Maintainable app structure | App, core infrastructure, and feature code have clear responsibilities and acyclic dependencies. Initial app/core/features structure exists; broader dependency-boundary audit remains. | IMPLEMENTED |
| SK-004 | Navigation | Navigation supports ordinary app routes and an optional shell/navigation example without forcing every app to use bottom navigation. | PROPOSED |
| SK-005 | State management | State management follows the accepted manual-provider policy; no unapproved code generation. | VERIFIED |
| SK-006 | Theme foundation | Light and dark themes are centrally defined and can be extended without screen-level duplication. | IMPLEMENTED |
| SK-007 | Localization and directionality | English and Arabic examples demonstrate generated localization resources and correct LTR/RTL directionality. | VERIFIED |
| SK-008 | Error and loading behavior | Shared examples demonstrate explicit loading, empty, and recoverable error states without swallowing failures. | PROPOSED |
| SK-009 | Testability | Core configuration and representative UI/state behavior have automated tests. | VERIFIED |
| SK-010 | Platform hygiene | Android and iOS configuration, permissions, identifiers, and signing-sensitive settings are documented and reviewed. Native scaffolding exists; a complete platform review remains. | IMPLEMENTED |
| SK-011 | Quality checks | Formatting, static analysis, tests, and available platform builds have recorded results. Linux CI passed formatting, analysis, tests, and Android debug build; iOS CI has been added but not yet observed. | IMPLEMENTED |
| SK-012 | Reusable example | At least one small example feature demonstrates the approved architecture end to end and can be removed without breaking core infrastructure. | IMPLEMENTED |
| SK-013 | Secure defaults | No secrets are committed; optional backend integrations document client/server trust boundaries and authorization requirements. | PROPOSED |
| SK-014 | Product discovery and scope control | The starter kit has explicit scope, out-of-scope items, traceable acceptance criteria, and unresolved assumptions recorded before implementation. | IMPLEMENTED |
| SK-015 | First-party design foundation | Shared UI is built from Flutter SDK primitives integrated with centralized tokens, states, and motion rules; no external UI framework is adopted as the foundation by default. | IMPLEMENTED |
| SK-016 | Accessibility | Interactive controls have accessible names/roles/states, adequate touch targets, text scaling support, contrast, focus behavior, and reduced-motion support. | PROPOSED |
| SK-017 | Localization quality | English and Arabic resources have matching keys/placeholders; locale selection, formatting, mixed-direction text, and RTL layout are tested. | IMPLEMENTED |
| SK-018 | Security review | Trust boundaries, secrets, permissions, data handling, and any future backend authorization are reviewed before release. | PROPOSED |
| SK-019 | Performance and reliability | Performance budgets and representative scenarios are defined before performance claims; startup, frame timing, memory, and network behavior are measured where applicable. | PROPOSED |
| SK-020 | Release and operations readiness | Build/release configuration, signing boundaries, CI checks, diagnostics, and recovery expectations are documented; publishing requires explicit authorization. | IMPLEMENTED |

## Engineering skills mapping

The following public skill repository is the engineering reference: [flutter-engineering-skills](https://github.com/ParkersYourDad/flutter-engineering-skills). Its root `SKILL.md` and shared references were inspected on 2026-11-07. These skills are guidance and review criteria, not permission to add every technology or optional subsystem.

| Skill area | Application to this starter kit |
|---|---|
| Company orchestration / workflow | Plan dependencies, maintain requirement traceability, record decisions, and report evidence. |
| Product discovery | Define reusable-starter scope and acceptance criteria; avoid product-specific assumptions. |
| Mobile design research / Apple product craft | Apply native-feeling Android/iOS interaction and a coherent first-party design system when UI is implemented. |
| Flutter architecture | Govern folder boundaries, state ownership, navigation, configuration, and dependency direction. |
| Supabase backend engineering | Conditional only; no Supabase/backend is added without a real starter-kit requirement. |
| Native platform integration | Conditional; use native Swift/Kotlin integration only when Flutter SDK/plugin capabilities do not satisfy a documented need. |
| AI product engineering | Out of scope by default; load only for a concrete AI-enabled example or integration. |
| Accessibility and localization | Apply English/Arabic, RTL/LTR, semantics, scaling, contrast, and screen-reader criteria to shared UI. |
| Mobile QA engineering | Add regression tests and independent verification passes; do not claim independent agents if not available. |
| Mobile security engineering | Review mobile trust boundaries, secrets, storage, permissions, and optional backend controls. |
| Performance and reliability | Define measurable budgets and profile real scenarios; do not optimize speculatively. |
| Release and operations | Establish build/CI/release hygiene; do not publish or touch signing secrets without authorization. |

## Verification policy

For each requirement, record the exact evidence and command/tool result. Mark a requirement `VERIFIED` only after its acceptance criteria have been checked. If the necessary Flutter SDK, Android toolchain, Xcode, simulator, or physical device is unavailable, mark that verification as blocked or not run; do not infer success.

## Current observed verification

- Flutter 3.47.9 / Dart 3.13.7 reported by GitHub Actions.
- Dependency resolution completed on the pinned Flutter SDK.
- Flutter localization generation completed.
- `flutter analyze` completed with no issues in the successful initial CI run.
- Four Flutter tests passed in the successful initial CI run.
- `flutter build apk --debug` completed successfully in the native-generation workflow.
- iOS native project files were generated and committed. An iOS build has not yet been observed; a macOS CI job is now configured to run `flutter build ios --no-codesign`.
- No physical-device, simulator-interaction, release-signing, or store-submission verification is claimed.
