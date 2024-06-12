import 'package:flutter/material.dart';
import 'package:objective_otter/widgets/side_menu/side_menu.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideMenu(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
