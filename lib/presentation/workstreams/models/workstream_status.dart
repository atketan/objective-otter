import 'package:flutter/material.dart';

enum WorkstreamStatus {
  planned,
  ongoing,
  paused,
  completed,
}

extension WorkstreamStatusExtension on WorkstreamStatus {
  String toShortString() {
    switch (this) {
      case WorkstreamStatus.planned:
        return 'Planned';
      case WorkstreamStatus.ongoing:
        return 'Ongoing';
      case WorkstreamStatus.paused:
        return 'Paused';
      case WorkstreamStatus.completed:
        return 'Completed';
      default:
        return 'Planned';
    }
  }

  Color get statusColor {
    switch (this) {
      case WorkstreamStatus.planned:
        return Colors.green[50]!;
      case WorkstreamStatus.ongoing:
        return Colors.purple[50]!;
      case WorkstreamStatus.paused:
        return Colors.pink[50]!;
      case WorkstreamStatus.completed:
        return Colors.green[300]!;
      default:
        return Colors.grey[100]!;
    }
  }
}

extension WorkstreamStatusEnumExtension on String {
  WorkstreamStatus toWorkstreamStatus() {
    switch (this) {
      case 'planned':
        return WorkstreamStatus.planned;
      case 'ongoing':
        return WorkstreamStatus.ongoing;
      case 'paused':
        return WorkstreamStatus.paused;
      case 'completed':
        return WorkstreamStatus.completed;
      default:
        return WorkstreamStatus.planned;
    }
  }
}

extension WorkstreamStatusIconExtension on WorkstreamStatus {
  Icon toWorkstreamIcon() {
    switch (this) {
      case WorkstreamStatus.planned:
        return Icon(
          Icons.schedule,
          color: Colors.green[700],
          size: 64,
        );
      case WorkstreamStatus.ongoing:
        return Icon(
          Icons.play_arrow,
          color: Colors.purple[700],
          size: 64,
        );
      case WorkstreamStatus.paused:
        return Icon(
          Icons.pause,
          color: Colors.pink[700],
          size: 64,
        );
      case WorkstreamStatus.completed:
        return Icon(
          Icons.check_circle,
          color: Colors.green[700],
          size: 64,
        );
      default:
        return Icon(
          Icons.schedule,
          color: Colors.green[700],
          size: 64,
        );
    }
  }
}
