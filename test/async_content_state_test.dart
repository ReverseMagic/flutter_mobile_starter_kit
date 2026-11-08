import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_starter/core/widgets/async_content_state.dart';

void main() {
  testWidgets('loading state exposes progress and its label', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppLoadingView(label: 'Loading items')),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Loading items'), findsOneWidget);
  });

  testWidgets('empty state renders its message and optional action', (
    tester,
  ) async {
    var actionCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppEmptyStateView(
            title: 'Nothing here',
            message: 'Add an item to get started.',
            actionLabel: 'Add item',
            onAction: () => actionCalled = true,
          ),
        ),
      ),
    );

    expect(find.text('Nothing here'), findsOneWidget);
    expect(find.text('Add an item to get started.'), findsOneWidget);
    await tester.tap(find.text('Add item'));
    expect(actionCalled, isTrue);
  });

  testWidgets('error state retries only when the action is selected', (
    tester,
  ) async {
    var retryCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppErrorStateView(
            title: 'Could not load',
            message: 'Check your connection and try again.',
            retryLabel: 'Retry',
            onRetry: () => retryCalled = true,
          ),
        ),
      ),
    );

    expect(retryCalled, isFalse);
    expect(find.text('Could not load'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    expect(retryCalled, isTrue);
  });

  testWidgets('empty state can be rendered without an action', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppEmptyStateView(
            title: 'No results',
            message: 'Try another search.',
          ),
        ),
      ),
    );

    expect(find.text('No results'), findsOneWidget);
    expect(find.byType(FilledButton), findsNothing);
  });
}
