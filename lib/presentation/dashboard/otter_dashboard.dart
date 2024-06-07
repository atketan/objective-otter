import 'package:flutter/material.dart';

class OtterDashboard extends StatefulWidget {
  const OtterDashboard({super.key});

  @override
  OtterDashboardState createState() => OtterDashboardState();
}

class OtterDashboardState extends State<OtterDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otter Dashboard'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Otter Dashboard',
        ),
      ),
    );
  }
}
