import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:objective_otter/presentation/dashboard/otter_dashboard.dart';

/// The route configuration.
GoRouter getRoutes() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OtterDashboard();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'dashboard',
            builder: (BuildContext context, GoRouterState state) {
              return const OtterDashboard();
            },
          ),
        ],
      ),
    ],
  );
}
