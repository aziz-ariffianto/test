// Import Flutter material design library for UI components
import 'package:flutter/material.dart';
// Import Flutter testing framework for widget testing capabilities
import 'package:flutter_test/flutter_test.dart';

// Import the main application file to test the MyApp widget
import 'package:test2/main.dart';

/// Main test suite for the Flutter application.
/// Contains widget tests to verify the functionality of the counter app.
void main() {
  /// Widget test that verifies the counter increment functionality.
  /// 
  /// This test performs the following verification steps:
  /// 1. Renders the MyApp widget in a test environment
  /// 2. Checks that the initial counter value is 0
  /// 3. Simulates a tap on the increment button (+ icon)
  /// 4. Verifies that the counter value updates to 1
  /// 
  /// This is a "smoke test" - a basic test that checks if the core
  /// functionality works without crashes or obvious errors.
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame to render the initial UI
    await tester.pumpWidget(const MyApp());

    // Verify that the counter starts at 0
    // This finds exactly one widget displaying '0' text
    expect(find.text('0'), findsOneWidget);
    // Verify that the counter is not already at 1
    // This ensures no widget is displaying '1' text initially
    expect(find.text('1'), findsNothing);

    // Simulate a user tap on the floating action button (+ icon)
    // This should trigger the _incrementCounter method
    await tester.tap(find.byIcon(Icons.add));
    // Trigger a frame to rebuild the UI with the updated state
    await tester.pump();

    // Verify that the counter is no longer showing 0
    // After incrementing, no widget should display '0' text
    expect(find.text('0'), findsNothing);
    // Verify that the counter now shows 1
    // This confirms the increment operation worked correctly
    expect(find.text('1'), findsOneWidget);
  });
}
