import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:objective_otter/presentation/projects_home/models/projects_card_details.dart';
import 'package:objective_otter/presentation/projects_home/widgets/projects_card_widget.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => ProjectsScreenState();
}

class ProjectsScreenState extends State<ProjectsScreen> {
  // List<ProjectsCardDetails> projectCards = [
  //   ProjectsCardDetails(
  //     projectId: "Oqifpvaah0Q2MKMC6jKI",
  //     projectName: "Project Bumblebee",
  //     projectDescription:
  //         "NAF Website Modernisation through People, Process & Technology Transformation Strategy",
  //     projectIcon: Icon(
  //       Icons.rocket_launch_sharp,
  //       color: Colors.yellow[700],
  //       size: 64,
  //     ),
  //     projectTags: [
  //       "NAF",
  //       "Accelerate",
  //       "Website",
  //       "PPT Strategy",
  //     ],
  //     projectStatus: ProjectStatus.review,
  //     primaryOwnerName: "TBD",
  //   ),
  //   ProjectsCardDetails(
  //     projectId: "Oqifpvaah0Q2MKMC6jKI",
  //     projectName: "NAF Concierge",
  //     projectDescription: "LLM-powered Support ChatBots Project",
  //     projectIcon: const Icon(
  //       Icons.android_sharp,
  //       color: Colors.blue,
  //       size: 64,
  //     ),
  //     projectTags: [
  //       "NAF",
  //       "LLM",
  //       "Dial-a-Doughminator",
  //       "Concierge",
  //       "Support",
  //     ],
  //     projectStatus: ProjectStatus.review,
  //     primaryOwnerName: "TBD",
  //   ),
  //   ProjectsCardDetails(
  //     projectId: "Oqifpvaah0Q2MKMC6jKI",
  //     projectName: "Project X",
  //     projectDescription:
  //         "Headless CMS Test Suite - to support Bumblebee testing and sign-off",
  //     projectIcon: const Icon(
  //       Icons.factory_sharp,
  //       color: Colors.black,
  //       size: 64,
  //     ),
  //     projectTags: [
  //       "CMS",
  //       "Test Suite",
  //       "Headless",
  //       "API-driven",
  //       "Bumblebee",
  //     ],
  //     projectStatus: ProjectStatus.planned,
  //     primaryOwnerName: "TBD",
  //   ),
  //   ProjectsCardDetails(
  //     projectId: "Oqifpvaah0Q2MKMC6jKI",
  //     projectName: "Short Circuit",
  //     projectDescription:
  //         "Simplify PIM consumption architecture; explore direct integration and PoC alongside Bumblebee",
  //     projectIcon: const Icon(
  //       Icons.shortcut_sharp,
  //       color: Colors.deepOrange,
  //       size: 64,
  //     ),
  //     projectTags: [
  //       "PIM",
  //       "EA&S",
  //       "No Code",
  //       "Low Code",
  //       "Bumblebee",
  //     ],
  //     projectStatus: ProjectStatus.ongoing,
  //     primaryOwnerName: "TBD",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Home"),
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
          stream: FirebaseFirestore.instance.collection('projects').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final projectCards = snapshot.data!.docs.map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    // Assuming 'data' contains all the necessary fields for your ProjectsCardWidget
                    return SizedBox(
                      width: 500,
                      child: ProjectsCardWidget(
                        projectCard: ProjectsCardDetails.fromMap(
                          data,
                          document.id,
                        ), // Assuming you have a method to convert Firestore doc to your ProjectCard model
                      ),
                    );
                  },
                ).toList();

                return Wrap(
                  spacing: 8.0, // horizontal space between cards
                  runSpacing: 8.0, // vertical space between lines
                  children: projectCards,
                );
            }
          },
        ),
      ),
    );
  }
}
