import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:objective_otter/presentation/projects_home/widgets/projects_card_widget.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final String projectId;

  const ProjectDetailsScreen({super.key, required this.projectId});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  ProjectsCardDetails projectDetails = ProjectsCardDetails(
    projectName: "Project Bumblebee",
    projectDescription: "NAF Website Modernisation",
    projectIcon: const Icon(
      Icons.rocket_launch_sharp,
      color: Colors.green,
      size: 64,
    ),
    projectTags: [
      "NAF",
      "Accelerate",
      "Website",
      "PPT Strategy",
    ],
    projectStatus: ProjectStatus.review,
    primaryOwnerName: "TBD",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final List<String> pathSegments = GoRouter.of(context)
                .routeInformationProvider
                .value
                .uri
                .pathSegments;

            String breadcrumb =
                pathSegments.where((segment) => segment.isNotEmpty).join(' / ');

            return Text(
              breadcrumb.toLowerCase(),
              style: Theme.of(context).textTheme.labelSmall,
            );
          },
        ),
      ),
      body: Center(
          child: Text(
        "Project Details: ${widget.projectId}",
        // style: Theme.of(context).textTheme.displayLarge,
      )),
    );
  }
}
