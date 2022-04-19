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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: Typography()
            .black
            .apply(
              displayColor: Colors.greenAccent,
              bodyColor: Colors.green,
            )
            .copyWith(
              displayLarge: const TextStyle(
                color: Colors.lightGreen,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'displayLarge',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'explicit bodyMedium',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Text('implicit bodyMedium'),
        Text(
          'labelSmall',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
