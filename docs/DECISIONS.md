# Decisions

This file is the decision log. Only decisions explicitly marked `ACCEPTED` are binding implementation choices.

## D-001 — Mobile-only scope

- Status: ACCEPTED
- Decision: The starter kit targets Android and iOS phone applications. Web and desktop are not project targets.
- Rationale: Keep the reusable foundation focused on the requested mobile use case.

## D-002 — Flutter and Dart

- Status: ACCEPTED
- Decision: Use Flutter stable with the matching Dart SDK.
- Constraint: Pin the exact Flutter SDK using the repository's selected version-management mechanism only after the current stable release and required tooling are verified. Do not guess version numbers.

## D-003 — Architecture style

- Status: ACCEPTED
- Decision: Prefer a pragmatic feature-first structure with clear app/core/feature boundaries. Use Flutter's recommended layering where it clarifies responsibilities; do not add domain/use-case/repository layers mechanically.
- Constraint: Add abstractions only when a concrete requirement or testability boundary justifies them.

## D-004 — Manual state management

- Status: ACCEPTED
- Decision: Use Riverpod manual providers; code generation for Riverpod is not approved.
- Constraint: Select and pin the exact compatible Riverpod version after checking current official documentation and the repository's SDK baseline.

## D-005 — Navigation package and typed routes

- Status: OPEN
- Context: The engineering skills repository's greenfield guidance and the user's prior boilerplate decisions differ on route code generation and typed routing.
- Constraint: Do not add or remove `go_router_builder` or choose a replacement until the existing technology-governance source is checked and current GoRouter documentation is reviewed.

## D-006 — Backend integrations

- Status: ACCEPTED
- Decision: Backend, authentication, database, AI, analytics, and vendor integrations are optional and must not be forced into the generic starter kit.
- Security constraint: Any future privileged API or AI-provider key must remain server-side, never in the mobile application.

## D-007 — Localization resources

- Status: ACCEPTED
- Decision: Use Flutter's supported ARB-based `gen-l10n` workflow for localization when implementation begins.
- Constraint: Verify generated output configuration against the pinned Flutter SDK. Do not introduce an additional localization code-generation package without an accepted requirement.

## D-008 — Design foundation

- Status: ACCEPTED
- Decision: Build on Flutter SDK Material and Cupertino primitives with a centralized token/theme layer. Do not adopt an external UI framework as the design-system foundation by default.

## D-009 — Dependency policy

- Status: ACCEPTED
- Decision: Prefer SDK capabilities and the smallest justified dependency set. Verify compatibility, maintenance, and current official API guidance before adding or upgrading packages.

## D-010 — Documentation governance

- Status: ACCEPTED
- Decision: Keep project governance concise and centralized in `AGENTS.md` and the four files under `docs/`: PROJECT, REQUIREMENTS, DECISIONS, and ISSUES.
