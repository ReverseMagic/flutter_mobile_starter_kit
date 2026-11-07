import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_starter/app/router/app_router.dart';
import 'package:mobile_starter/app/router/shell_router_example.dart';
import 'package:mobile_starter/app/settings/app_settings_providers.dart';
import 'package:mobile_starter/app/starter_app.dart';

void main() {
  testWidgets('renders the English home screen by default', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: StarterApp()));
    await tester.pumpAndSettle();

    expect(find.text('A clean starting point'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.text('A clean starting point'))),
      TextDirection.ltr,
    );
  });

  testWidgets('renders Arabic and RTL when Arabic is selected', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeProvider.overrideWith(
            () => LocaleController(initialLocale: const Locale('ar')),
          ),
        ],
        child: const StarterApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('بداية بسيطة وواضحة'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.text('بداية بسيطة وواضحة'))),
      TextDirection.rtl,
    );
  });

  testWidgets('optional shell router switches between destinations', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appRouterProvider.overrideWith(
            (ref) => ref.watch(shellRouterExampleProvider),
          ),
        ],
        child: const StarterApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('A clean starting point'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);

    await tester.tap(find.text('Example'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'This is a second destination in the optional navigation-shell example.',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('A clean starting point'), findsOneWidget);
  });
}
