// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/presentation/pages/work_order/action_bottom_sheet.dart';
import 'package:fsm_flutter/presentation/pages/work_order/work_order_bloc.dart';
import 'package:location/location.dart';

import '../../core/themes/app_theme.dart';
import '../../pages/job_details/cubit/work_order_job_cubit.dart';
import '../../pages/technical_assitace/ai/ai_assistance.dart';
import '../../pages/technical_assitace/chat/chat_screen.dart';
import '../../pages/technical_assitace/video/video_calling_page.dart';
import '../components/gradient_elevated_button.dart';

const List<String> needHelpString = [
  "Video Tutorial",
  "User Manual",
];

enum WorkOrderHelp { technicalAssistance, pauseWorkOrder }

class PauseWorkOrderProvider extends StatelessWidget {
  final int requestId;

  const PauseWorkOrderProvider({
    super.key,
    required this.requestId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkOrderJobCubit>(
      create: (context) => WorkOrderJobCubit(),
      child: PauseWorkOrderWidget(
        requestId: requestId,
      ),
    );
  }
}

class PauseWorkOrderWidget extends StatelessWidget {
  final int requestId;

  const PauseWorkOrderWidget({
    super.key,
    required this.requestId,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkOrderBloc>();
    return ElevatedButton(
      onPressed: () async {
        // String? dropdownValue;
        // showPauseWorkOrderDialog(
        //     context: context,
        //     requestId: requestId,
        //     dropdownValue: dropdownValue);
        /**
         * Pause Work Order State
         */
        await showModalBottomSheet<bool>(
          isScrollControlled: true,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          context: context,
          builder: (context) => BlocProvider.value(
            value: bloc,
            child: ActionBottomSheet(
              actionType: ActionType.pause,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        "Pause Job",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

showPauseWorkOrderDialog({
  required BuildContext context,
  required int requestId,
  String? dropdownValue,
}) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  WorkOrderHelp? character = WorkOrderHelp.technicalAssistance;
  Location location = Location();

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, state) => AlertDialog(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning_amber, color: Colors.orange),
              SizedBox(width: (10)),
              Text("Pause WorkOrder?",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want pause workOrder WO-$requestId ?',
                      style: TextStyle(
                          fontSize: (16), fontWeight: FontWeight.w500)),
                  SizedBox(height: (10)),
                  const Text("Need Help?"),
                  SizedBox(height: (10)),
                  Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          state(() {
                            character = WorkOrderHelp.technicalAssistance;
                          });
                        },
                        minTileHeight: (25),
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        title: const Text('Technical Assistance'),
                        leading: Radio<WorkOrderHelp>(
                          value: WorkOrderHelp.technicalAssistance,
                          groupValue: character,
                          onChanged: (WorkOrderHelp? value) {
                            state(() {
                              character = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: (10)),
                      ListTile(
                        onTap: () {
                          state(() {
                            character = WorkOrderHelp.pauseWorkOrder;
                          });
                        },
                        minTileHeight: (25),
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        title: const Text('Pause WorkOrder'),
                        leading: Radio<WorkOrderHelp>(
                          value: WorkOrderHelp.pauseWorkOrder,
                          groupValue: character,
                          onChanged: (WorkOrderHelp? value) {
                            state(() {
                              character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (10)),
                  character == WorkOrderHelp.technicalAssistance
                      ? DropdownButtonFormField(
                          value: dropdownValue,
                          onChanged: (String? value) {
                            state(() {
                              dropdownValue = value!;
                            });
                            if (dropdownValue == "Video Tutorial") {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoCallingPage(
                                            extraInfo: {
                                              "requestId": requestId,
                                            },
                                          )));
                            } else if (dropdownValue == "Live Chat") {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LiveChatScreen()));
                            } else if (dropdownValue == "AI Assistant") {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AiAssistanceProvider()));
                            }
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a need help option';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            dropdownValue = value!;
                          },
                          items: needHelpString
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Technical Assistance"),
                                const Text(
                                  " *",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            hintText: "Select Technical Assistance",
                          ),
                        )
                      : TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter reason to pause the workOrder";
                            } else {
                              return null;
                            }
                          },
                          controller: controller,
                          decoration: InputDecoration(
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Reason"),
                                const Text(
                                  " *",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            hintText: "Please enter a reason",
                          ),
                        ),
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            GradientElevatedButton(
              backgroundColor: Colors.red,
              // style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5)),
              //     backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  Text("Cancel", style: TextStyle(color: AppColors.whiteColor)),
            ),
            GradientElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  PermissionStatus permissionGranted;
                  LocationData locationData;
                  bool serviceEnabled;

                  serviceEnabled = await location.serviceEnabled();
                  if (!serviceEnabled) {
                    serviceEnabled = await location.requestService();
                    if (!serviceEnabled) {
                      return;
                    }
                  }

                  permissionGranted = await location.hasPermission();
                  if (permissionGranted == PermissionStatus.denied) {
                    permissionGranted = await location.requestPermission();
                    if (permissionGranted != PermissionStatus.granted) {
                      return;
                    }
                  }

                  locationData = await location.getLocation();
                  double? latitude = locationData.latitude;
                  double? longitude = locationData.longitude;

                  context
                      .read<WorkOrderJobCubit>()
                      .pauseWorkOrder(requestId, controller.text);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(true);
                }
              },
              child: Text(
                "Pause",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}
