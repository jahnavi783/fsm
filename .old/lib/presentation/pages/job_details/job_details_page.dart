import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm_flutter/core/utils.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_appbar_widget.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_elevated_button.dart';
import 'package:fsm_flutter/presentation/core/themes/app_theme.dart';
import 'package:fsm_flutter/presentation/pages/job_details/start_job_screen.dart';
import 'package:fsm_flutter/presentation/pages/work_order/action_bottom_sheet.dart';
import 'package:fsm_flutter/presentation/pages/work_order/work_order_bloc.dart';

import '../../core/components/custom_expansion_tile.dart';

class JobDetailsPage extends StatelessWidget {
  JobDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: Text("Job Details")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<WorkOrderBloc, WorkOrderState>(
          listener: (ctx, state) {
            if (state is WorkOrderInProgressState) {
              print("Work Order is in progress");
            }
          },
          builder: (context, state) {
            final workDetails = state.workOrder;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        "Job Details",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: interFontFamily),
                      ),
                      subTitle: Column(
                        children: [
                          JobTitleAndDescriptionWidget(
                            title: "Job ID",
                            titleFontWeight: FontWeight.w500,
                            description: workDetails.woNumber,
                            descriptionFontWeight: FontWeight.bold,
                          ),
                          if (workDetails.serviceRequest?.srNumber != null)
                            JobTitleAndDescriptionWidget(
                              title: "Ticket ID",
                              description: workDetails.serviceRequest!.srNumber,
                            ),
                          JobTitleAndDescriptionWidget(
                            title: "Priority",
                            description: workDetails.priority.toString(),
                          ),
                          if (workDetails.serviceRequest?.srType != null)
                            JobTitleAndDescriptionWidget(
                              title: "Service Type",
                              description: workDetails.serviceRequest!.srType
                                  .toTitleCase(),
                            ),
                          JobTitleAndDescriptionWidget(
                            title: "Status",
                            description: workDetails.status.toString(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomExpansionTile(
                      title: Text(
                        "Job Description",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: interFontFamily),
                      ),
                      subTitle: Column(
                        children: [
                          JobTitleAndDescriptionWidget(
                            title: "Summary",
                            description: workDetails.summary,
                          ),
                          JobTitleAndDescriptionWidget(
                            title: "Problem",
                            description: workDetails.problemDescription,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomExpansionTile(
                      title: Text(
                        "Customer Contact Details",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: interFontFamily),
                      ),
                      subTitle: Column(
                        children: [
                          if (workDetails.serviceRequest?.customerName != null)
                            JobTitleAndDescriptionWidget(
                                title: "Customer Name",
                                description:
                                    workDetails.serviceRequest!.customerName),
                          if (workDetails.serviceRequest?.location != null)
                            JobTitleAndDescriptionWidget(
                              title: "Location",
                              description: workDetails.serviceRequest!.location,
                              titleFontWeight: FontWeight.w500,
                              descriptionFontWeight: FontWeight.bold,
                            ),
                          if (workDetails.serviceRequest?.postalCode != null)
                            JobTitleAndDescriptionWidget(
                                title: "Postal Code",
                                description:
                                    workDetails.serviceRequest!.postalCode),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomExpansionTile(
                      title: Text(
                        "Machine Details",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: interFontFamily),
                      ),
                      subTitle: Column(
                        children: [
                          if (workDetails.serviceRequest?.machineSerial != null)
                            JobTitleAndDescriptionWidget(
                              title: "Machine Serial",
                              description: workDetails
                                  .serviceRequest!.machineSerial
                                  ?.toTitleCase(),
                              titleFontWeight: FontWeight.w500,
                              descriptionFontWeight: FontWeight.bold,
                            ),
                          if (workDetails.serviceRequest?.model != null)
                            JobTitleAndDescriptionWidget(
                              title: "Model",
                              description: workDetails.serviceRequest!.model
                                  ?.toTitleCase(),
                            ),
                          if (workDetails.serviceRequest?.underWarranty != null)
                            JobTitleAndDescriptionWidget(
                              title: "Machine on Warranty",
                              description: workDetails
                                  .serviceRequest!.underWarranty
                                  ?.toTitleCase(),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<WorkOrderBloc, WorkOrderState>(
        builder: (context, state) {
          final bloc = context.read<WorkOrderBloc>();
          return Visibility(
            visible: state.workOrder.status != WorkOrderStatus.completed,
            child: Container(
              padding: const EdgeInsets.all(8.0).r,
              width: 0.8.sw,
              child: Row(
                children: [
                  if (state.workOrder.status == WorkOrderStatus.assigned ||
                      state.workOrder.status == WorkOrderStatus.reAssigned ||
                      state.workOrder.status == WorkOrderStatus.paused)
                    Expanded(
                        child: GradientElevatedButton(
                      onPressed: () async {
                        /**
                             * Reject Work Order State
                             */
                        final res = await showModalBottomSheet<bool>(
                          isScrollControlled: true,
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.85,
                          ),
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: bloc,
                            child: ActionBottomSheet(
                              actionType: state.workOrder.status ==
                                          WorkOrderStatus.assigned ||
                                      state.workOrder.status ==
                                          WorkOrderStatus.reAssigned
                                  ? ActionType.reject
                                  : ActionType.cancel,
                            ),
                          ),
                        );
                        if (res != null && res == true) {
                          Navigator.of(context).pop();
                        }
                      },
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        getBtnLabel2(state.workOrder.status),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    )),
                  if (state.workOrder.status == WorkOrderStatus.assigned ||
                      state.workOrder.status == WorkOrderStatus.reAssigned ||
                      state.workOrder.status == WorkOrderStatus.paused)
                    10.horizontalSpace,
                  Expanded(
                    child: _buildActionButton(state, context, bloc),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  GradientElevatedButton _buildActionButton(
      WorkOrderState state, BuildContext context, WorkOrderBloc bloc) {
    return GradientElevatedButton(
      // width: double.infinity,
      child: Text(
        getBtnLabel(state.workOrder.status),
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
        ),
      ),
      // controller: _btnController,
      onPressed: () async {
        if (state.workOrder.status == WorkOrderStatus.completed) {
          return;
        }
        if (state.workOrder.status == WorkOrderStatus.inProgress) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: bloc,
                child: StartJobScreen(
                  workOrderId: state.workOrder.id,
                ),
              ),
            ),
          );
          return;
        }
        final res = await showModalBottomSheet<bool>(
          isScrollControlled: true,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          context: context,
          builder: (context) => BlocProvider.value(
            value: bloc,
            child: ActionBottomSheet(
              actionType: state.workOrder.status == WorkOrderStatus.assigned ||
                      state.workOrder.status == WorkOrderStatus.reAssigned
                  ? ActionType.start
                  : ActionType.resume,
            ),
          ),
        );
        if (res != null && res == true) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: bloc,
                child: StartJobScreen(
                  workOrderId: state.workOrder.id,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  String getBtnLabel2(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.assigned:
      case WorkOrderStatus.reAssigned:
        return 'Reject';
      case WorkOrderStatus.paused:
        return 'Reject';
      default:
        return 'Unknown';
    }
    return '';
  }

  String getBtnLabel(WorkOrderStatus status) {
    switch (status) {
      case WorkOrderStatus.assigned:
      case WorkOrderStatus.reAssigned:
        return 'Start';
      case WorkOrderStatus.inProgress:
        return 'Open';
      case WorkOrderStatus.paused:
        return 'Resume';
      case WorkOrderStatus.completed:
        return 'Completed';
      default:
        return 'Unknown';
    }
    return '';
  }
}

class JobTitleAndDescriptionWidget extends StatelessWidget {
  final String title;
  final String? description;
  final Color defaultColor;
  final FontWeight titleFontWeight;
  final FontWeight descriptionFontWeight;

  const JobTitleAndDescriptionWidget({
    super.key,
    required this.title,
    required this.description,
    this.defaultColor = Colors.black,
    this.titleFontWeight = FontWeight.w300,
    this.descriptionFontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: titleFontWeight,
              fontFamily: interFontFamily,
            ),
          ),
        ),
        Expanded(
          child: Text(
            description ?? "N/A",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 14,
              // color: getPriorityColor(description),
              fontWeight: descriptionFontWeight,
              fontFamily: interFontFamily,
            ),
          ),
        )
      ],
    );
  }
}
