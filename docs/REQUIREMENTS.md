# Requirements

Status values: `PROPOSED`, `ACCEPTED`, `IMPLEMENTED`, `VERIFIED`, `BLOCKED`.

Requirements remain proposed until the relevant technical decisions are accepted. A requirement is not verified merely because files were committed.

| ID | Requirement | Acceptance criteria | Status |
|---|---|---|---|
| SK-001 | Android and iOS mobile foundation | Flutter project targets Android and iOS phones; no web/desktop targets are introduced as product scope. | PROPOSED |
| SK-002 | Governed technology stack | Every direct dependency and important architecture choice is documented with compatibility evidence. | PROPOSED |
| SK-003 | Maintainable app structure | App, core infrastructure, and feature code have clear responsibilities and acyclic dependencies. | PROPOSED |
| SK-004 | Navigation | Navigation supports ordinary app routes and an optional shell/navigation example without forcing every app to use bottom navigation. | PROPOSED |
| SK-005 | State management | State management follows the accepted manual-provider policy; no unapproved code generation. | PROPOSED |
| SK-006 | Theme foundation | Light and dark themes are centrally defined and can be extended without screen-level duplication. | PROPOSED |
| SK-007 | Localization and directionality | English and Arabic examples demonstrate generated localization resources and correct LTR/RTL directionality. | PROPOSED |
| SK-008 | Error and loading behavior | Shared examples demonstrate explicit loading, empty, and recoverable error states without swallowing failures. | PROPOSED |
| SK-009 | Testability | Core configuration and representative UI/state behavior have automated tests. | PROPOSED |
| SK-010 | Platform hygiene | Android and iOS configuration, permissions, identifiers, and signing-sensitive settings are documented and reviewed. | PROPOSED |
| SK-011 | Quality checks | Formatting, static analysis, tests, and available platform builds have recorded results. | PROPOSED |
| SK-012 | Reusable example | At least one small example feature demonstrates the approved architecture end to end and can be removed without breaking core infrastructure. | PROPOSED |
| SK-013 | Secure defaults | No secrets are committed; optional backend integrations document client/server trust boundaries and authorization requirements. | PROPOSED |

## Verification policy

For each requirement, record the exact evidence and command/tool result. Mark a requirement `VERIFIED` only after its acceptance criteria have been checked. If the necessary Flutter SDK, Android toolchain, Xcode, simulator, or physical device is unavailable, mark that verification as blocked or not run; do not infer success.
