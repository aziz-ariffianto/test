// Flutter framework imports for widgets and testing
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import the main application file to test the MyApp widget
import 'package:test2/main.dart';

/// Main test suite entry point
/// This function groups all widget tests for the application
/// and defines the test execution order and structure
void main() {
  /// Widget test for counter increment functionality
  /// This is a smoke test that verifies the basic counter behavior
  /// when the floating action button is pressed
  /// 
  /// [tester] - Widget testing framework that provides methods
  /// to interact with widgets and verify their behavior
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app widget tree and trigger the first frame
    // This initializes the MyApp widget and all its children
    await tester.pumpWidget(const MyApp());

    // Verify initial state - counter should start at 0
    // expect() function checks if the condition is true
    // find.text('0') searches for a Text widget containing '0'
    // findsOneWidget confirms exactly one widget is found
    expect(find.text('0'), findsOneWidget);
    
    // Verify that counter value 1 is not present initially
    // findsNothing confirms no widgets contain the text '1'
    expect(find.text('1'), findsNothing);

    // Simulate user interaction - tap the floating action button
    // find.byIcon(Icons.add) locates the FAB with the add icon
    // tester.tap() simulates a user tap gesture on the button
    await tester.tap(find.byIcon(Icons.add));
    
    // Trigger a frame to process the state change
    // This allows setState() to rebuild the widget tree
    // and update the displayed counter value
    await tester.pump();

    // Verify the counter has incremented
    // After tapping, the old value '0' should no longer be visible
    expect(find.text('0'), findsNothing);
    
    // The new value '1' should now be displayed
    // This confirms the increment functionality works correctly
    expect(find.text('1'), findsOneWidget);
  });
}
