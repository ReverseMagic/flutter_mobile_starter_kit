import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_page.dart';
import '../../l10n/generated/app_localizations.dart';

abstract final class ShellExampleRoutes {
  static const home = '/shell/home';
  static const example = '/shell/example';
}

/// Optional navigation-shell example.
///
/// Keep [appRouterProvider] as the default for apps that do not need
/// persistent tab navigation. Override it with this provider only when an
/// application intentionally adopts a stateful bottom-navigation shell.
final shellRouterExampleProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: ShellExampleRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return _ShellExampleScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ShellExampleRoutes.home,
                name: 'shell-example-home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ShellExampleRoutes.example,
                name: 'shell-example-destination',
                builder: (context, state) => const _ExampleDestinationPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
});

class _ShellExampleScaffold extends StatelessWidget {
  const _ShellExampleScaffold({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.homeTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.widgets_outlined),
            selectedIcon: const Icon(Icons.widgets),
            label: l10n.exampleTab,
          ),
        ],
      ),
    );
  }
}

class _ExampleDestinationPage extends StatelessWidget {
  const _ExampleDestinationPage();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.exampleTab)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(l10n.exampleDestinationBody, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
