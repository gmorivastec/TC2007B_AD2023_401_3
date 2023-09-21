import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

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
      body: const EjemploLista(),
      /* Column(
        children: [
          const Text("HEY GUYS"),
          const Text("WE ARE USING A COLUMN"),
          const Text("IT'S SO COOL!"),
          Image.network(
              "https://www.isabeleats.com/wp-content/uploads/2020/11/chilaquiles-verdes-small-8-127x191.jpg")
        ],
        */
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

class EjemploLista extends StatefulWidget {
  const EjemploLista({super.key});

  @override
  State<EjemploLista> createState() => _EjemploListaState();
}

// basic version with predefined data
class _EjemploListaState extends State<EjemploLista> {
  final List<String> _content = ["a", "b", "c", "d", "e"];
  final TextStyle _style = const TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  // we can have several methods that return a widget
  // BUT the most important one is the build method (the one that is
  // called from the outside)
  Widget _buildList() {
    // design pattern
    // - factory
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _content.length,
      itemBuilder: (context, i) {
        return _buildRow(_content[i]);
      },
    );
  }

  Widget _buildRow(String value) {
    return ListTile(
      title: Text(
        value,
        style: _style,
      ),
      onTap: () {
        Fluttertoast.showToast(
            msg: "YOU TOUCHED A TILE! $value",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailView(
                      externalArg: value,
                    )));
      },
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.externalArg});

  final String externalArg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DETAIL VIEW")),
      body: Center(child: Text("THE INFO ON THE DETAIL VIEW FOR $externalArg")),
    );
  }
}

// let's do a request!
// to do so we need to do 2 things -
// 1. Define a class that will be used to parse a JSON
// 2. do an HTTP request

// url - https://bitbucket.org/itesmguillermorivas/partial2/raw/45f22905941b70964102fce8caf882b51e988d23/carros.json

class Car {
  // constructor to initialize values
  Car({required this.brand, required this.model, required this.year});
  final String brand;
  final String model;
  final int year;

  // we will define a factory method
  // https://en.wikipedia.org/wiki/Factory_method_pattern
  factory Car.fromJSON(Map<String, dynamic> json) {
    return Car(brand: json['marca'], model: json['modelo'], year: json['anio']);
  }
}

// We can declar a method with no class
// there is no restriction whatsoever on dart!

// Future<List<Car>> getCars() async {}
