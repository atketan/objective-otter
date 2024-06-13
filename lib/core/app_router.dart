import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:objective_otter/presentation/about/about_screen.dart';
import 'package:objective_otter/presentation/projects_home/projects_home_screen.dart';
import 'package:objective_otter/presentation/projects_home/main_layout.dart';
import 'package:objective_otter/presentation/project_details/project_details_screen.dart';
import 'package:objective_otter/presentation/settings/settings_screen.dart';
import 'package:objective_otter/presentation/tasks_planner/tasks_home_screen.dart';

/// The route configuration.
GoRouter getRoutes() {
  return GoRouter(
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            redirect: (context, state) => '/projects',
          ),
          GoRoute(
            path: '/projects',
            builder: (context, state) => const ProjectsScreen(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProjectsScreen(),
            ),
          ),
          GoRoute(
            path: '/projects/:id',
            builder: (BuildContext context, GoRouterState state) {
              return ProjectDetailsScreen(
                  projectId: state.pathParameters['id']!);
            },
            pageBuilder: (context, state) => NoTransitionPage(
              child:
                  ProjectDetailsScreen(projectId: state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: '/tasks',
            builder: (context, state) => const TasksHomeScreen(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TasksHomeScreen(),
            ),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsScreen(),
            ),
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) => const AboutScreen(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AboutScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
