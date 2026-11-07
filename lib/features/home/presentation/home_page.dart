import 'dart:ui' show Locale;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/settings/app_settings_providers.dart';
import '../../../l10n/generated/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 32),
          children: [
            Text(
              l10n.welcomeTitle,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.welcomeBody,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 28),
            _SectionHeading(
              title: l10n.appearance,
              description: l10n.appearanceDescription,
            ),
            const SizedBox(height: 12),
            SegmentedButton<ThemeMode>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text(l10n.system),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text(l10n.light),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text(l10n.dark),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (selection) {
                ref
                    .read(themeModeProvider.notifier)
                    .setThemeMode(selection.first);
              },
            ),
            const SizedBox(height: 28),
            _SectionHeading(
              title: l10n.language,
              description: l10n.languageDescription,
            ),
            const SizedBox(height: 12),
            SegmentedButton<Locale?>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: null,
                  label: Text(l10n.system),
                ),
                ButtonSegment(
                  value: const Locale('en'),
                  label: Text(l10n.english),
                ),
                ButtonSegment(
                  value: const Locale('ar'),
                  label: Text(l10n.arabic),
                ),
              ],
              selected: {locale},
              onSelectionChanged: (selection) {
                ref.read(localeProvider.notifier).setLocale(selection.first);
              },
            ),
            const SizedBox(height: 28),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.foundationTitle,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(l10n.foundationBody),
                    const SizedBox(height: 12),
                    Text(
                      l10n.temporarySettingsNotice,
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(description, style: textTheme.bodyMedium),
      ],
    );
  }
}
