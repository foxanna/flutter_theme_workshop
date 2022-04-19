import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          background: Colors.green[50],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.scrolledUnder)
                    ? Colors.limeAccent
                    : Colors.lime,
          ),
          foregroundColor: Colors.blue,
          elevation: 8.0,
          actionsIconTheme: const IconThemeData(color: Colors.blue),
          centerTitle: false,
        ),
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consistent design with Flutter Theme'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: ExampleWidget(),
        ),
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(20.0).add(
          EdgeInsets.only(
            left: index.isEven ? 0.0 : 40.0,
            right: !index.isEven ? 0.0 : 40.0,
          ),
        ),
        child: Container(height: screenHeight / 3, color: Colors.lime),
      ),
      itemCount: 4,
    );
  }
}
