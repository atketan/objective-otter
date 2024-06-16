import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:objective_otter/presentation/projects_home/models/project_status.dart';
import 'package:objective_otter/presentation/projects_home/models/projects_card_details.dart';

class ProjectsCardWidget extends StatelessWidget {
  const ProjectsCardWidget({super.key, required this.projectCard});

  final ProjectsCardDetails projectCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go('/projects/${projectCard.projectName}');
      },
      child: Card(
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
                    ),
                    const Divider(),
                    Text(
                      "Primary Owner: ${projectCard.primaryOwnerName}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    if (projectCard.secondaryOwnerName != null)
                      Text(
                        "Secondary Owner: ${projectCard.secondaryOwnerName!}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
