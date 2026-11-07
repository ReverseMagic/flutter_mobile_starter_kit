import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_starter/app/settings/app_settings_providers.dart';

void main() {
  group('App settings providers', () {
    test('use system defaults', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(themeModeProvider), ThemeMode.system);
      expect(container.read(localeProvider), isNull);
    });

    test('update theme mode and locale', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark);
      container.read(localeProvider.notifier).setLocale(const Locale('ar'));

      expect(container.read(themeModeProvider), ThemeMode.dark);
      expect(container.read(localeProvider), const Locale('ar'));
    });
  });
}
