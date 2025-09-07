import 'package:flutter/material.dart';

/// Entry point of the Flutter application.
/// This function initializes and starts the app by calling runApp with MyApp widget.
void main() {
  runApp(const MyApp());
}

/// The root widget of the Flutter application.
/// This stateless widget configures the MaterialApp with theme settings
/// and defines the home page of the application.
class MyApp extends StatelessWidget {
  /// Creates a MyApp widget.
  /// 
  /// The [key] parameter is used to control how one widget replaces another
  /// widget in the tree.
  const MyApp({super.key});

  /// Builds the widget tree for the application.
  /// 
  /// This method configures the MaterialApp with:
  /// - Application title
  /// - Theme using Material 3 design with deep purple color scheme
  /// - Home page set to MyHomePage
  /// 
  /// [context] The build context containing information about the location
  /// of this widget in the widget tree.
  /// 
  /// Returns a MaterialApp widget that serves as the root of the app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// The home page widget that displays a counter interface.
/// This stateful widget maintains a counter state and provides
/// functionality to increment the counter value.
class MyHomePage extends StatefulWidget {
  /// Creates a MyHomePage widget.
  /// 
  /// The [title] parameter is required and will be displayed in the app bar.
  /// The [key] parameter is used for widget identification in the widget tree.
  const MyHomePage({super.key, required this.title});

  /// The title text displayed in the app bar.
  /// This string is shown at the top of the home page.
  final String title;

  /// Creates the mutable state for this widget.
  /// 
  /// Returns a new instance of MyHomePageState that will manage
  /// the state for this MyHomePage widget.
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

/// The state class for MyHomePage that manages the counter functionality.
/// This class handles the mutable state of the counter and provides
/// methods to update the UI when the counter value changes.
class MyHomePageState extends State<MyHomePage> {
  /// The current value of the counter.
  /// This integer starts at 0 and can be incremented by user interaction.
  /// Each time this value changes, the UI will be rebuilt to reflect the new value.
  int _counter = 0;

  /// Increments the counter value by 1 and triggers a UI rebuild.
  /// 
  /// This method is called when the user taps the floating action button.
  /// It uses setState() to notify the framework that the internal state
  /// has changed, causing the widget to be rebuilt with the new counter value.
  void _incrementCounter() {
    setState(() {
      // Increment the counter by 1
      _counter++;
    });
  }

  /// Builds the widget tree for the home page UI.
  /// 
  /// This method creates the visual structure of the home page including:
  /// - App bar with the page title
  /// - Centered column layout with descriptive text and counter display
  /// - Floating action button for incrementing the counter
  /// 
  /// [context] The build context containing information about the location
  /// of this widget in the widget tree.
  /// 
  /// Returns a Scaffold widget containing the complete home page layout.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with dynamic background color and title
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Main content area with centered layout
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Instructional text explaining the counter functionality
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
      // Floating action button that increments the counter when pressed
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
