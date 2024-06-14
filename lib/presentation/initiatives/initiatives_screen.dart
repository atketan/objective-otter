import 'package:flutter/material.dart';

class InitiativesScreen extends StatefulWidget {
  const InitiativesScreen({super.key});

  @override
  InitiativesScreenState createState() => InitiativesScreenState();
}

class InitiativesScreenState extends State<InitiativesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Initiatives'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Row(
              children: [
                Icon(Icons.add),
                Text("Add"),
              ],
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Initiatives Screen'),
      ),
    );
  }
}
