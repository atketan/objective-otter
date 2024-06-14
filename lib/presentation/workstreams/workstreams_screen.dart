import 'package:flutter/material.dart';

class WorkstreamsScreen extends StatefulWidget {
  const WorkstreamsScreen({super.key});

  @override
  WorkstreamsScreenState createState() => WorkstreamsScreenState();
}

class WorkstreamsScreenState extends State<WorkstreamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Workstreams'),
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
        child: Text('Workstreams Screen'),
      ),
    );
  }
}
