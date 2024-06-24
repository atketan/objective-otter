import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:objective_otter/presentation/workstreams/models/workstream_status.dart';
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
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .go('/workstreams/${widget.workstreamsCard.workstreamName}');
      },
      child: Card(
        elevation: 2,
        color: widget.workstreamsCard.workstreamStatus.statusColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: widget.workstreamsCard.workstreamIcon,
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
                      widget.workstreamsCard.workstreamName,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      widget.workstreamsCard.workstreamDescription,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 4.0, // Horizontal space between chips
                      runSpacing: 4.0, // Vertical space between lines
                      children: widget.workstreamsCard.workstreamTags
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
                      "Status: ${widget.workstreamsCard.workstreamStatus.toShortString()}",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    Text(
                      "Primary Owner: ${widget.workstreamsCard.primaryOwnerName}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    if (widget.workstreamsCard.secondaryOwnerName != null)
                      Text(
                        "Secondary Owner: ${widget.workstreamsCard.secondaryOwnerName!}",
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
