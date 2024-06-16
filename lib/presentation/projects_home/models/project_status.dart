import 'package:flutter/material.dart';

enum ProjectStatus {
  planned,
  review,
  approved,
  ongoing,
  paused,
  completed,
}

extension ProjectStatusExtension on ProjectStatus {
  String get stringValue {
    switch (this) {
      case ProjectStatus.planned:
        return 'Planned';
      case ProjectStatus.review:
        return 'Under Review';
      case ProjectStatus.approved:
        return 'Approved';
      case ProjectStatus.ongoing:
        return 'Ongoing';
      case ProjectStatus.paused:
        return 'Paused';
      case ProjectStatus.completed:
        return 'Completed';
      default:
        return 'Unknown';
    }
  }

  Color? get statusColor {
    switch (this) {
      case ProjectStatus.planned:
        return Colors.green[50];
      case ProjectStatus.review:
        return Colors.lightBlue[50];
      case ProjectStatus.approved:
        return Colors.green[100];
      case ProjectStatus.ongoing:
        return Colors.purple[50];
      case ProjectStatus.paused:
        return Colors.pink[50];
      case ProjectStatus.completed:
        return Colors.green[300];
      default:
        return Colors.grey[100];
    }
  }
}

extension ProjectStatusEnumExtension on String {
  ProjectStatus toProjectStatus() {
    switch (this) {
      case 'planned':
        return ProjectStatus.planned;
      case 'review':
        return ProjectStatus.review;
      case 'approved':
        return ProjectStatus.approved;
      case 'ongoing':
        return ProjectStatus.ongoing;
      case 'paused':
        return ProjectStatus.paused;
      case 'completed':
        return ProjectStatus.completed;
      default:
        return ProjectStatus.planned;
    }
  }
}

extension ProjectStatusIconExtension on ProjectStatus {
  Icon toProjectIcon() {
    switch (this) {
      case ProjectStatus.planned:
        return const Icon(
          Icons.schedule_sharp,
          size: 64,
        );
      case ProjectStatus.review:
        return const Icon(
          Icons.pending_actions_sharp,
          size: 64,
        );
      case ProjectStatus.approved:
        return const Icon(
          Icons.check_circle_sharp,
          size: 64,
        );
      case ProjectStatus.ongoing:
        return const Icon(
          Icons.play_circle_sharp,
          size: 64,
        );
      case ProjectStatus.paused:
        return const Icon(
          Icons.pause_circle_sharp,
          size: 64,
        );
      case ProjectStatus.completed:
        return const Icon(
          Icons.check_circle_sharp,
          size: 64,
        );
      default:
        return const Icon(
          Icons.help_sharp,
          size: 64,
        );
    }
  }
}
