# Flutter Mobile Starter Kit

A reusable Flutter foundation for Android and iOS phone applications.

## Stack

- Flutter 3.47.9 (pinned in `.fvmrc`)
- Dart bundled with the pinned Flutter SDK
- Riverpod 3 with manual providers
- GoRouter with manual route configuration
- Flutter ARB localization generation
- Flutter SDK Material/Cupertino primitives and centralized theme tokens

No backend, database, AI provider, analytics service, or native plugin is provisioned by default.

## Requirements

- Git
- Flutter Version Management (FVM)
- Flutter 3.47.9 through FVM
- Android Studio / Android SDK for Android builds
- macOS with Xcode for iOS builds

## First-time setup

1. Clone this repository.
2. Install FVM using its official installation instructions.
3. From the repository root, run:

   ```powershell
   fvm install
   .\tool\bootstrap_platforms.ps1
   fvm flutter pub get
   fvm flutter gen-l10n
   ```

The bootstrap script generates the Android and iOS native project folders using the pinned Flutter SDK. It refuses to overwrite existing native folders and preserves the repository's Dart source, tests, and project documentation.

## Development commands

```powershell
fvm flutter pub get
fvm flutter gen-l10n
fvm dart format .
fvm flutter analyze
fvm flutter test
fvm flutter run
```

## Project structure

```text
lib/
  app/                 # Application composition, routing, app settings
  core/                # App-agnostic technical foundations
  features/            # Feature-owned UI and behavior
  l10n/arb/             # English and Arabic source translations
  l10n/generated/       # Flutter-generated localization output (ignored)
test/                  # Automated tests
docs/                  # Scope, requirements, decisions, and issues
tool/                  # Repository maintenance scripts
```

## Current example

The example home screen demonstrates:
- Centralized light and dark themes.
- System, English, and Arabic locale selection.
- Automatic LTR/RTL directionality through Flutter localization.
- Manual Riverpod providers and centralized GoRouter configuration.

The example's theme and locale selections are currently in-memory only. Persistent preference storage is intentionally not included until its dependency and storage policy are approved.

## Platform verification

Android and iOS native folders are generated locally by the bootstrap script. Android builds require an installed Android SDK. iOS builds and simulator checks require macOS and Xcode. A passing Dart test suite alone does not prove platform builds or device behavior.

## Engineering governance

Read [AGENTS.md](AGENTS.md) before making changes. Project scope, requirements, decisions, and known issues live in [docs/](docs/).
