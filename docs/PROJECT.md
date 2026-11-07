# Project

## Purpose

Build a reusable, maintainable Flutter foundation that reduces repeated setup work when starting new Android and iOS phone applications.

The starter kit is an engineering foundation, not a finished consumer product. It should demonstrate a small number of real, reusable patterns without forcing every future app into unnecessary infrastructure.

## Target platforms

- Android phones
- iOS phones

Phone-first layouts and native platform conventions are in scope. Web, desktop, and tablet-first product experiences are out of scope unless explicitly approved later.

## Product principles

- Secure by default.
- Native-feeling interaction and platform behavior.
- Accessible and localization-ready, including correct LTR and RTL behavior.
- Minimal dependencies and low architectural ceremony.
- Clear boundaries and one source of truth.
- Testable behavior and honest verification.
- Reusable foundations with examples that can be removed or replaced cleanly.

## Scope

The initial foundation will cover app structure, configuration, navigation, state management, theming, localization, error handling, testing conventions, and Android/iOS project hygiene. The exact package choices and implementation details must be recorded in `docs/DECISIONS.md` after compatibility research.

Backend, authentication, database, analytics, subscriptions, AI providers, and product-specific business features are optional integrations. They are not included by default without a concrete reusable requirement.

## Out of scope

- Flutter Web and desktop applications.
- A prebuilt business/product domain.
- Mandatory backend or vendor lock-in.
- Premature microservices or speculative scalability infrastructure.
- Unverified claims of production readiness.
