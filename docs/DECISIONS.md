# Decisions

This file is the decision log. Only decisions explicitly marked `ACCEPTED` are binding implementation choices.

## D-001 — Mobile-only scope

- Status: ACCEPTED
- Decision: The starter kit targets Android and iOS phone applications. Web and desktop are not project targets.
- Rationale: Keep the reusable foundation focused on the requested mobile use case.

## D-002 — Flutter and Dart baseline

- Status: ACCEPTED
- Decision: Use Flutter stable 3.47.9 with its bundled Dart 3.13 release line for the initial project foundation.
- Evidence: Flutter's official SDK changelog lists the 3.47.9 stable hotfix; Dart's official changelog confirms the 3.13 release line. The exact bundled Dart patch version must be confirmed by the pinned SDK itself before package resolution and runtime verification.
- Constraint: Do not install a separate Dart SDK; Flutter ships the Dart SDK used by the project. Re-evaluate only when an approved upgrade is planned.

## D-003 — Architecture style

- Status: ACCEPTED
- Decision: Use a pragmatic feature-first structure with clear app/core/feature boundaries. Use Flutter's recommended layering where it clarifies responsibilities; do not add domain/use-case/repository layers mechanically.
- Constraint: Add abstractions only when a concrete requirement or testability boundary justifies them.

## D-004 — Manual Riverpod

- Status: ACCEPTED
- Decision: Use Riverpod 3 with manual providers (Notifier/AsyncNotifier where stateful provider logic is needed). No Riverpod code generation, generator, or second state manager.
- Evidence: The current stable `flutter_riverpod` package is 3.5.0 and its published minimum Dart SDK is 3.12, compatible with the selected Dart 3.13 baseline.
- Constraint: Pin the exact dependency in `pubspec.yaml` and verify resolution against the selected Flutter SDK before treating compatibility as verified.

## D-005 — GoRouter manual routing

- Status: ACCEPTED
- Context: The engineering skills greenfield baseline explicitly excludes `go_router_builder`; the user's governing technology definition requires centralized route constants and manual route configuration.
- Decision: Use GoRouter with manual route configuration and centralized route constants. Do not add `go_router_builder`, build_runner, typed-route code generation, or a second router.
- Evidence: Current stable `go_router` is 18.1.3; its published minimum Dart SDK is 3.12, compatible with the selected Dart 3.13 baseline.
- Consequence: Route paths and parameters must be represented with explicit constants/builders and tested without generated route files.

## D-006 — Supabase and backend integrations

- Status: ACCEPTED
- Decision: Supabase is the approved/default backend platform for future applications created from this starter kit, but the generic starter repository will not provision a Supabase project, database, authentication, storage, realtime, or Edge Functions by default.
- Rationale: The governing stack definition approves Supabase as the standard backend while requiring only capabilities needed by the current project. A reusable starter should not contain vendor setup or backend code that every consuming app may not need.
- Constraint: When a concrete app requires a backend, use only the necessary Supabase capabilities and enforce authorization server-side with RLS where applicable. Gemini or other privileged provider secrets remain server-side.

## D-007 — Localization resources

- Status: ACCEPTED
- Decision: Use Flutter's supported ARB-based `gen-l10n` workflow for English and Arabic localization.
- Constraint: Verify generated output configuration against the pinned Flutter SDK. Do not introduce an additional localization code-generation package.

## D-008 — Design foundation

- Status: ACCEPTED
- Decision: Build on Flutter SDK Material and Cupertino primitives with a centralized token/theme layer. Do not adopt an external UI framework as the design-system foundation by default.

## D-009 — Dependency policy

- Status: ACCEPTED
- Decision: Prefer SDK capabilities and the smallest justified dependency set. Verify compatibility, maintenance, and current official API guidance before adding or upgrading packages. Record each direct dependency and its purpose.

## D-010 — Documentation governance

- Status: ACCEPTED
- Decision: Keep project governance concise and centralized in `AGENTS.md` and the four files under `docs/`: PROJECT, REQUIREMENTS, DECISIONS, and ISSUES.
