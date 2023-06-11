import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
            children: [const Icon(Icons.edit_location,color: Colors.blue,),
              TextButton(onPressed: (){Navigator.pushNamed(context, '/location');},
                child: const Text('Edit Location'),
              ),
            ],
          )),
    );
  }
}