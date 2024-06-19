import 'package:flutter/material.dart';
import 'package:objective_otter/presentation/workstreams/models/workstreams_card_details.dart';

class WorkstreamsCardWidget extends StatefulWidget {
  final WorkstreamsCardDetails workstreamsCard;

  const WorkstreamsCardWidget({super.key, required this.workstreamsCard});

  @override
  WorkstreamsCardWidgetState createState() => WorkstreamsCardWidgetState();
}

class WorkstreamsCardWidgetState extends State<WorkstreamsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: widget.workstreamsCard.workstreamIcon,
            title: Text(widget.workstreamsCard.workstreamName),
            subtitle: Text(widget.workstreamsCard.workstreamDescription),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: widget.workstreamsCard.workstreamTags
                  .map((tag) => Chip(label: Text(tag)))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
