import 'package:flutter/material.dart';

import 'workstream_status.dart';

class WorkstreamsCardDetails {
  String workstreamId; // Same as Firestore document ID
  String workstreamName;
  String workstreamDescription;
  Icon workstreamIcon;
  List<String> workstreamTags;
  WorkstreamStatus workstreamStatus;
  String primaryOwnerName;
  String? secondaryOwnerName;
  String fiscalYear;
  String type;

  WorkstreamsCardDetails({
    required this.workstreamId,
    required this.workstreamName,
    required this.workstreamDescription,
    required this.workstreamIcon,
    required this.workstreamTags,
    required this.workstreamStatus,
    required this.primaryOwnerName,
    this.secondaryOwnerName,
    required this.fiscalYear,
    required this.type,
  });

  static WorkstreamsCardDetails fromMap(
      Map<String, dynamic> data, String documentId) {
    return WorkstreamsCardDetails(
      workstreamId: documentId,
      workstreamName: data['name'],
      workstreamDescription: data['description'],
      workstreamIcon:
          data['status'].toString().toWorkstreamStatus().toWorkstreamIcon(),
      workstreamTags:
          (data['tags'] != null) ? List<String>.from(data['tags']) : [],
      workstreamStatus: data['status'].toString().toWorkstreamStatus(),
      primaryOwnerName: data['primaryOwner'],
      secondaryOwnerName: data['secondaryOwner'] ?? '',
      fiscalYear: data['fiscalYear'],
      type: data['type'],
    );
  }
}
