import 'package:flutter/material.dart';

class ProjectsCardWidget extends StatelessWidget {
  const ProjectsCardWidget({super.key, required this.projectCard});

  final ProjectsCardDetails projectCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: projectCard.projectStatus.statusColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: projectCard.projectIcon,
            ),
            const SizedBox(
              height: 100,
              child: VerticalDivider(),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectCard.projectName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    projectCard.projectDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16.0),
                  Wrap(
                    spacing: 4.0, // Horizontal space between chips
                    runSpacing: 4.0, // Vertical space between lines
                    children: projectCard.projectTags
                        .map(
                          (tag) => Chip(
                            padding: const EdgeInsets.all(4.0),
                            visualDensity: VisualDensity.comfortable,
                            label: Text(tag),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Status: ${projectCard.projectStatus.stringValue}",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsCardDetails {
  String projectName;
  String projectDescription;
  Icon projectIcon;
  List<String> projectTags;
  ProjectStatus projectStatus;

  ProjectsCardDetails({
    required this.projectName,
    required this.projectDescription,
    required this.projectIcon,
    required this.projectTags,
    required this.projectStatus,
  });
}

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
