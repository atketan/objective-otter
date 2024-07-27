import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:objective_otter/presentation/workstreams/models/workstreams_card_details.dart';

import 'widgets/workstreams_widget.dart';

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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const Flexible(
                  // flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Workstreams / Teams'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            return const Center(
                                child: CircularProgressIndicator());
                          default:
                            final workstreamCards = snapshot.data!.docs.map(
                              (DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return SizedBox(
                                  width: 350,
                                  child: WorkstreamsWidget(
                                    workstreamsCardDetails:
                                        WorkstreamsCardDetails.fromMap(
                                      data,
                                      document.id,
                                    ),
                                  ),
                                );
                              },
                            ).toList();

                            if (workstreamCards.isEmpty) {
                              return const Center(
                                child: Text('No workstreams found'),
                              );
                            }

                            return Wrap(
                              spacing: 8.0, // horizontal space between cards
                              runSpacing: 8.0, // vertical space between lines
                              children: workstreamCards,
                            );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const Flexible(
                  // flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Projects'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            return const Center(
                                child: CircularProgressIndicator());
                          default:
                            final workstreamCards = snapshot.data!.docs.map(
                              (DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return SizedBox(
                                  width: 350,
                                  child: WorkstreamsWidget(
                                    workstreamsCardDetails:
                                        WorkstreamsCardDetails.fromMap(
                                      data,
                                      document.id,
                                    ),
                                  ),
                                );
                              },
                            ).toList();

                            if (workstreamCards.isEmpty) {
                              return const Center(
                                child: Text('No projects found'),
                              );
                            }

                            return Wrap(
                              spacing: 8.0, // horizontal space between cards
                              runSpacing: 8.0, // vertical space between lines
                              children: workstreamCards,
                            );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const Flexible(
                  // flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Initiatives'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            return const Center(
                                child: CircularProgressIndicator());
                          default:
                            final workstreamCards = snapshot.data!.docs.map(
                              (DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return SizedBox(
                                  width: 350,
                                  child: WorkstreamsWidget(
                                    workstreamsCardDetails:
                                        WorkstreamsCardDetails.fromMap(
                                      data,
                                      document.id,
                                    ),
                                  ),
                                );
                              },
                            ).toList();

                            if (workstreamCards.isEmpty) {
                              return const Center(
                                child: Text('No initiatives found'),
                              );
                            }

                            return Wrap(
                              spacing: 8.0, // horizontal space between cards
                              runSpacing: 8.0, // vertical space between lines
                              children: workstreamCards,
                            );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
