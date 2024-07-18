import 'package:flutter/material.dart';
import 'package:objective_otter/presentation/workstreams/models/workstream_status.dart';
import 'package:objective_otter/presentation/workstreams/models/workstreams_card_details.dart';

class WorkstreamsWidget extends StatefulWidget {
  final WorkstreamsCardDetails workstreamsCardDetails;

  const WorkstreamsWidget({required this.workstreamsCardDetails, super.key});

  @override
  State<StatefulWidget> createState() {
    return WorkstreamsWidgetState();
  }
}

class WorkstreamsWidgetState extends State<WorkstreamsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        color: widget.workstreamsCardDetails.workstreamStatus.statusColor,
        child: ListTile(
          title: (widget.workstreamsCardDetails.type == "initiative")
              ? Text(
                  "${widget.workstreamsCardDetails.workstreamName} | ${widget.workstreamsCardDetails.fiscalYear}")
              : Text(widget.workstreamsCardDetails.workstreamName),
          subtitle: Text(widget.workstreamsCardDetails.workstreamDescription),
          leading: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.workstreamsCardDetails.workstreamIcon,
            ],
          ),
          trailing: SizedBox(
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                widget.workstreamsCardDetails.workstreamStatus.toShortString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
