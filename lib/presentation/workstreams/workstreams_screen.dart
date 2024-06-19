import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:objective_otter/presentation/workstreams/models/workstreams_card_details.dart';
import 'package:objective_otter/presentation/workstreams/widgets/workstreams_card_widget.dart';

class WorkstreamsScreen extends StatefulWidget {
  const WorkstreamsScreen({super.key});

  @override
  WorkstreamsScreenState createState() => WorkstreamsScreenState();
}

class WorkstreamsScreenState extends State<WorkstreamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Workstreams'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Row(
              children: [
                Icon(Icons.add),
                Text("Add"),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('workstreams').snapshots(),
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
                    return SizedBox(
                      width: 500,
                      child: WorkstreamsCardWidget(
                        workstreamsCard: WorkstreamsCardDetails.fromMap(
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
    );
  }
}
