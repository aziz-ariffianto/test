import 'package:flutter/material.dart';

/// Entry point of the Flutter application
/// Initializes and runs the main app widget
void main() {
  runApp(const MyApp());
}

/// Root widget of the application
/// This is a stateless widget that configures the MaterialApp
/// and sets up the overall theme and navigation structure
class MyApp extends StatelessWidget {
  /// Constructor for MyApp widget
  /// [key] is used for widget identification in the widget tree
  const MyApp({super.key});

  /// Builds the widget tree for the application
  /// Configures MaterialApp with theme, title, and home page
  /// [context] provides access to theme data and other inherited widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application title shown in task switcher
      title: 'Flutter Demo',
      // App theme configuration with Material 3 design
      theme: ThemeData(
        // Color scheme based on deep purple seed color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Enable Material 3 design system
        useMaterial3: true,
      ),
      // Set the home page of the application
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// Home page widget that demonstrates a simple counter functionality
/// This is a stateful widget that maintains a counter state
/// and provides increment functionality through a floating action button
class MyHomePage extends StatefulWidget {
  /// Constructor for MyHomePage widget
  /// [key] is used for widget identification in the widget tree
  /// [title] is required and displays the page title in the app bar
  const MyHomePage({super.key, required this.title});

  /// The title text displayed in the app bar
  /// This is a final property that cannot be changed after initialization
  final String title;

  /// Creates the state object for MyHomePage
  /// This method is called by the Flutter framework when the widget is inserted into the widget tree
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

/// State class for MyHomePage that manages the counter functionality
/// This class handles the mutable state and user interactions for the home page
class MyHomePageState extends State<MyHomePage> {
  /// Counter variable that tracks the number of button presses
  /// Initialized to 0 and incremented each time the floating action button is pressed
  int _counter = 0;

  /// Increments the counter by 1 and triggers a UI rebuild
  /// This method is called when the floating action button is pressed
  /// Uses setState() to notify the framework that the internal state has changed
  void _incrementCounter() {
    setState(() {
      // Increment the counter value
      _counter++;
    });
  }

  /// Builds the widget tree for the home page
  /// Creates a scaffold with app bar, body content, and floating action button
  /// [context] provides access to theme data and other inherited widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title and themed background color
      appBar: AppBar(
        // Use inverse primary color from the current theme
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Display the title passed from the parent widget
        title: Text(widget.title),
      ),
      // Main content area with centered column layout
      body: Center(
        child: Column(
          // Center the column content vertically
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Instruction text for the user
            const Text(
              'You have pushed the button this many times:',
            ),
            // Display the current counter value with large text style
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // Floating action button to increment the counter
      floatingActionButton: FloatingActionButton(
        // Set the callback function for button press
        onPressed: _incrementCounter,
        // Tooltip text shown on long press
        tooltip: 'Increment',
        // Add icon to the button
        child: const Icon(Icons.add),
      ),
    );
  }
}
