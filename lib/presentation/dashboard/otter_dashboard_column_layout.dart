import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:objective_otter/presentation/workstreams/models/workstream_status.dart';
import 'package:objective_otter/presentation/workstreams/models/workstreams_card_details.dart';

class OtterDashboard extends StatefulWidget {
  const OtterDashboard({super.key});

  @override
  OtterDashboardState createState() => OtterDashboardState();
}

class OtterDashboardState extends State<OtterDashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Teams / Workstreams",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('workstreams')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    final workstreamCards = snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return WorkstreamsCardDetails.fromMap(
                            data, document.id);
                      },
                    ).toList();

                    if (workstreamCards.isEmpty) {
                      return const Center(
                        child: Text(
                          'No workstreams found',
                          textAlign: TextAlign.left,
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 18,
                        columns: const [
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Fiscal Year')),
                          DataColumn(label: Text('Status')),
                          // Add more columns as needed
                        ],
                        rows: workstreamCards.map((workstream) {
                          return DataRow(cells: [
                            DataCell(
                              Icon(
                                workstream.workstreamIcon.icon,
                                size: 24.0,
                              ),
                            ),
                            DataCell(
                              Text(workstream.workstreamName),
                            ),
                            DataCell(
                              Text(
                                workstream.workstreamDescription,
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                            DataCell(
                              Text(workstream.fiscalYear),
                            ),
                            DataCell(
                              Text(workstream.workstreamStatus.toShortString()),
                            ),
                            // Add more cells as needed
                          ]);
                        }).toList(),
                      ),
                    );
                }
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Projects",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('projects')
                  .where('type', isEqualTo: 'project')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    final workstreamCards = snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return WorkstreamsCardDetails.fromMap(
                            data, document.id);
                      },
                    ).toList();

                    if (workstreamCards.isEmpty) {
                      return const Center(
                        child: Text(
                          'No workstreams found',
                          textAlign: TextAlign.left,
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 18,
                        columns: const [
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Fiscal Year')),
                          DataColumn(label: Text('Status')),
                          // Add more columns as needed
                        ],
                        rows: workstreamCards.map((workstream) {
                          return DataRow(cells: [
                            DataCell(
                              Icon(
                                workstream.workstreamIcon.icon,
                                size: 24.0,
                              ),
                            ),
                            DataCell(
                              Text(workstream.workstreamName),
                            ),
                            DataCell(
                              Text(
                                workstream.workstreamDescription,
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                            DataCell(
                              Text(workstream.fiscalYear),
                            ),
                            DataCell(
                              Text(workstream.workstreamStatus.toShortString()),
                            ),
                            // Add more cells as needed
                          ]);
                        }).toList(),
                      ),
                    );
                }
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Initiatives",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('projects')
                  .where('type', isEqualTo: 'initiative')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    final workstreamCards = snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return WorkstreamsCardDetails.fromMap(
                            data, document.id);
                      },
                    ).toList();

                    if (workstreamCards.isEmpty) {
                      return const Center(
                        child: Text(
                          'No initiatives found',
                          textAlign: TextAlign.left,
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 18,
                        columns: const [
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Fiscal Year')),
                          DataColumn(label: Text('Status')),
                          // Add more columns as needed
                        ],
                        rows: workstreamCards.map((workstream) {
                          return DataRow(cells: [
                            DataCell(
                              Icon(
                                workstream.workstreamIcon.icon,
                                size: 24.0,
                              ),
                            ),
                            DataCell(
                              Text(workstream.workstreamName),
                            ),
                            DataCell(
                              Text(
                                workstream.workstreamDescription,
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                            DataCell(
                              Text(workstream.fiscalYear),
                            ),
                            DataCell(
                              Text(workstream.workstreamStatus.toShortString()),
                            ),
                            // Add more cells as needed
                          ]);
                        }).toList(),
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
