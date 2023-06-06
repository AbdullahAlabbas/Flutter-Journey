import 'package:flutter/material.dart';

// flutter create dummy
void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App!'), centerTitle: true,
        ),
        body: Center(
          child : Text("Hello!")
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child : Text('+')
        ),
      ),
    ));
