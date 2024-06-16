import 'package:flutter/material.dart';

import 'project_status.dart';

class ProjectsCardDetails {
  String projectId; // Same as Firestore document ID
  String projectName;
  String projectDescription;
  Icon projectIcon;
  List<String> projectTags;
  ProjectStatus projectStatus;
  String primaryOwnerName;
  String? secondaryOwnerName;

  ProjectsCardDetails({
    required this.projectId,
    required this.projectName,
    required this.projectDescription,
    required this.projectIcon,
    required this.projectTags,
    required this.projectStatus,
    required this.primaryOwnerName,
    this.secondaryOwnerName,
  });

  static ProjectsCardDetails fromMap(
      Map<String, dynamic> data, String documentId) {
    return ProjectsCardDetails(
      projectId: documentId,
      projectName: data['name'],
      projectDescription: data['description'],
      projectIcon: data['status'].toString().toProjectStatus().toProjectIcon(),
      projectTags:
          (data['tags'] != null) ? List<String>.from(data['tags']) : [],
      projectStatus: data['status'].toString().toProjectStatus(),
      primaryOwnerName: data['primaryOwner'],
      secondaryOwnerName: data['secondaryOwner'],
    );
  }
}
