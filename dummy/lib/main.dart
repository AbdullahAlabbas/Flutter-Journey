import 'package:flutter/material.dart';

void main() {
  runApp(DummyApp());
}

class DummyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dummy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DummyHomePage(),
    );
  }
}

class DummyHomePage extends StatelessWidget {
  final List<String> dummyItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy App'),
      ),
      body: ListView.builder(
        itemCount: dummyItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(dummyItems[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DummyItemDetailsPage(item: dummyItems[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DummyItemDetailsPage extends StatelessWidget {
  final String item;

  DummyItemDetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Center(
        child: Text(item),
      ),
    );
  }
}
