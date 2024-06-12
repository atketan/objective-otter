import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isExpanded ? 250 : 80,
          color: Colors.blueGrey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: const EdgeInsets.only(left: 16),
                icon: Icon(isExpanded ? Icons.menu_open : Icons.menu),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
              Expanded(
                child: ListView(
                  children: [
                    const Divider(),
                    _buildMenuItem(Icons.home, "Projects", '/'),
                    _buildMenuItem(Icons.task, "Tasks", '/tasks'),
                    const Divider(),
                    _buildMenuItem(Icons.settings, "Settings", '/settings'),
                    _buildMenuItem(Icons.info, "About", '/about'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: isExpanded ? Text(title) : null,
      onTap: () {
        GoRouter.of(context).go(route);
      },
    );
  }
}
