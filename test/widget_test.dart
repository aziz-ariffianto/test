// Import Flutter material design library for UI components
import 'package:flutter/material.dart';
// Import Flutter testing framework for widget testing
import 'package:flutter_test/flutter_test.dart';

// Import the main application file to test its widgets
import 'package:test2/main.dart';

/// Main test function that groups all widget tests for the application
/// This function serves as the entry point for running widget tests
void main() {
  /// Test case to verify the counter increment functionality
  /// This test ensures that tapping the increment button properly updates the counter display
  /// 
  /// Parameters:
  /// - [tester]: WidgetTester instance used to interact with widgets during testing
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the MyApp widget and trigger a frame to render it
    await tester.pumpWidget(const MyApp());

    // Verify that the counter starts at 0
    // Should find exactly one widget displaying '0'
    expect(find.text('0'), findsOneWidget);
    // Verify that '1' is not displayed initially
    expect(find.text('1'), findsNothing);

    // Simulate tapping the floating action button (add icon)
    await tester.tap(find.byIcon(Icons.add));
    // Trigger a frame to update the UI after the tap
    await tester.pump();

    // Verify that '0' is no longer displayed after incrementing
    expect(find.text('0'), findsNothing);
    // Verify that the counter now shows '1'
    expect(find.text('1'), findsOneWidget);
  });
}
