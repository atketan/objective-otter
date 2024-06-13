import 'package:flutter/material.dart';

class TasksHomeScreen extends StatefulWidget {
  const TasksHomeScreen({super.key});

  @override
  State<TasksHomeScreen> createState() => TasksHomeScreenState();
}

class TasksHomeScreenState extends State<TasksHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text("Tasks Planner"),
          ),
      body: const Center(
        child: Text(
          "Tasks Planner",
        ),
      ),
    );
  }
}
