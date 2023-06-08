import 'package:flutter/material.dart';

// flutter create dummy
void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SaudiVolleyball'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body:  Center(
          child: Image.asset('assets/vb.jpg') ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey[500],
        child: const Text('+'),
      ),
    );
  }
}
