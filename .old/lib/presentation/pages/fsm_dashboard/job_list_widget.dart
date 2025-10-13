import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/presentation/core/resources/priority_color.dart';
import 'package:fsm_flutter/presentation/pages/job_details/job_details_page.dart';
import 'package:fsm_flutter/presentation/pages/work_order/work_order_bloc.dart';

class JobListWidget extends StatelessWidget {
  final WorkOrderEntity workOrder;
  final WorkOrderStatus status;

  const JobListWidget({
    super.key,
    required this.workOrder,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => WorkOrderBloc(workOrder),
                child: JobDetailsPage(),
              ),
            ),
          );
        },
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Job ID",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  workOrder.woNumber,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal),
                )
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Priority",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  workOrder.priority.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: getPriorityColor(workOrder.priority)),
                )
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
