import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Widget:
// Very similar to a "composable"
// building block for UI on Flutter
// Widgets can aggregate - build new widgets with smaller widgets
// a widget class MUST extend another widget

// each widget is defined by its own class
// very important - they must have a build method somewhere

// 2 types of widgets

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // constant constructors
  // preferred for performance reasons
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First Flutter App!",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const StatelessExample(),
    );
  }
}

// 2 main types of widgets
// 1. stateful
// 2. stateless

// stateless - interface will not change, doesn't matter
// What happens with data
class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    // we're using a scaffold

    // important to keep in mind for column -
    // column is static in content
    // if we need dynamic behavior we use a list!
    return Scaffold(
      appBar: AppBar(
        title: const Text("HEY GUYS"),
      ),
      body: Column(
        children: [
          const Text("HEY GUYS"),
          const Text("WE ARE USING A COLUMN"),
          const Text("IT'S SO COOL!"),
          Image.network(
              "https://www.isabeleats.com/wp-content/uploads/2020/11/chilaquiles-verdes-small-8-127x191.jpg")
        ],
      ),
    );
  }
}

// stateful - widget that can swap interfaces
// each interface is represented through a state
class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

// within the states we have the build method
class _StatefulExampleState extends State<StatefulExample> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
