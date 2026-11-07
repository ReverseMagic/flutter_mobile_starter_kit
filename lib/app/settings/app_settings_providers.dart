import 'dart:ui' show Locale;

import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

final localeProvider = NotifierProvider<LocaleController, Locale?>(
  LocaleController.new,
);

class ThemeModeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void setThemeMode(ThemeMode value) {
    state = value;
  }
}

class LocaleController extends Notifier<Locale?> {
  LocaleController({this.initialLocale});

  final Locale? initialLocale;

  @override
  Locale? build() => initialLocale;

  void setLocale(Locale? value) {
    state = value;
  }
}
