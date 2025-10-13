import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm_flutter/core/services/location_service.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_elevated_button.dart';
import 'package:fsm_flutter/presentation/pages/work_order/work_order_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

enum ActionType { start, pause, resume, reject, cancel }

class ActionBottomSheet extends StatefulWidget {
  final ActionType actionType;
  const ActionBottomSheet({super.key, required this.actionType});

  @override
  State<ActionBottomSheet> createState() => _ActionBottomSheetState();
}

class _ActionBottomSheetState extends State<ActionBottomSheet> {
  final _key = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  final List<XFile> _imageFiles = [];

  final LocationService _locationService = LocationService();

  final TextEditingController _controller = TextEditingController();

  String? _currentDateTime;
  LatLng? _currentLocation;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    if (widget.actionType == ActionType.reject) {
      return;
    }
    _updateDateTime();
    _getCurrentLocation();
  }

  void _updateDateTime() {
    setState(() {
      _currentDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      final locationData = await _locationService.getCurrentLocation();
      setState(() {
        _currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
      });
    } catch (e) {
      // Handle location errors
      print('Error getting location: $e');
    }
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFiles.add(pickedFile);
        });
      }
    } catch (e) {
      // Handle exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<WorkOrderBloc>();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocConsumer<WorkOrderBloc, WorkOrderState>(
        listener: (context, state) {
          if (state is WorkOrderInProgressState) {
            Navigator.pop(context, true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Work order started successfully!')),
            );
          }
          if (state is WorkOrderPausedState) {
            Navigator.pop(context, true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Work order paused successfully!')),
            );
          }
          if (state is WorkOrderRejectedState) {
            Navigator.pop(context, true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Work order rejected successfully!')),
            );
          }
          if (state is WorkOrderCancelledState) {
            Navigator.pop(context, true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Work order cancelled successfully!')),
            );
          }
        },
        builder: (context, state) {
          if (state is WorkOrderLoadingState) {
            return SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Column(
                children: [
                  Spacer(),
                  const CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Text(
                    state.message ?? "Loading...",
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Spacer(),
                ],
              ),
            );
          }
          return SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.only(top: 10).r,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Job ID header with cross button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Job ID: ${state.workOrder.woNumber}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                  Divider(),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Are you sure you want to $action this job?",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          12.verticalSpace,
                          Form(
                            key: _key,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Visibility(
                                  visible: widget.actionType !=
                                          ActionType.reject &&
                                      widget.actionType != ActionType.cancel,
                                  child: TextFormField(
                                    enabled: false,
                                    initialValue: _currentDateTime,
                                    decoration: const InputDecoration(
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Current Time and Date"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (widget.actionType != ActionType.reject &&
                                    widget.actionType != ActionType.cancel)
                                  18.verticalSpace,
                                if (widget.actionType != ActionType.reject &&
                                    widget.actionType != ActionType.cancel)
                                  Container(
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: _currentLocation == null
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : FlutterMap(
                                              mapController: _mapController,
                                              options: MapOptions(
                                                initialCenter:
                                                    _currentLocation!,
                                                initialZoom: 15.0,
                                              ),
                                              children: [
                                                TileLayer(
                                                  urlTemplate:
                                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                  userAgentPackageName:
                                                      'com.fsm_flutter.app',
                                                ),
                                                MarkerLayer(
                                                  markers: [
                                                    Marker(
                                                      width: 80.0.w,
                                                      height: 80.0.h,
                                                      point: _currentLocation!,
                                                      child: Icon(
                                                        Icons.location_on,
                                                        color: Colors.red,
                                                        size: 40.0.r,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                if (widget.actionType != ActionType.reject &&
                                    widget.actionType != ActionType.cancel)
                                  18.verticalSpace,
                                // Location status indicator
                                if (widget.actionType != ActionType.reject &&
                                    widget.actionType != ActionType.cancel)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: _currentLocation != null
                                          ? Colors.green.shade100
                                          : Colors.amber.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          _currentLocation != null
                                              ? Icons.location_on
                                              : Icons.location_searching,
                                          color: _currentLocation != null
                                              ? Colors.green
                                              : Colors.amber,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          _currentLocation != null
                                              ? "Location successfully captured"
                                              : "Waiting for location...",
                                          style: TextStyle(
                                            color: _currentLocation != null
                                                ? Colors.green.shade800
                                                : Colors.amber.shade800,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.actionType != ActionType.reject &&
                                    widget.actionType != ActionType.cancel)
                                  18.verticalSpace,
                                if (widget.actionType == ActionType.pause ||
                                    widget.actionType == ActionType.reject ||
                                    widget.actionType == ActionType.cancel)
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter reason to $action the workOrder";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      label: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Comment"),
                                          const Text(
                                            " *",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                      hintText: "Please enter a comment",
                                    ),
                                  ),
                                if (widget.actionType == ActionType.pause ||
                                    widget.actionType == ActionType.reject ||
                                    widget.actionType == ActionType.cancel)
                                  18.verticalSpace,
                                if (widget.actionType != ActionType.reject &&
                                    widget.actionType != ActionType.cancel)
                                  Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: [
                                      ..._imageFiles.map((image) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Image.file(
                                              File(image.path),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      }),
                                      GestureDetector(
                                        onTap: () =>
                                            _getImage(ImageSource.camera),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.grey.shade600,
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  GradientElevatedButton(
                      width: double.infinity,
                      backgroundColor: ActionType.reject == widget.actionType ||
                              ActionType.cancel == widget.actionType
                          ? Colors.red
                          : null,
                      onPressed: () {
                        if (state is WorkOrderLoadingState) {
                          return;
                        }

                        if (_currentLocation == null &&
                            widget.actionType != ActionType.reject &&
                            widget.actionType != ActionType.cancel) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Please wait for location to load before taking action")),
                          );
                          return;
                        }

                        switch (widget.actionType) {
                          case ActionType.start:
                            bloc.add(StartWorkOrderEvent(
                              workOrderId: state.workOrder.id,
                              files:
                                  _imageFiles.map((e) => File(e.path)).toList(),
                              gpsCoordinates: jsonEncode([
                                _currentLocation!.latitude,
                                _currentLocation!.longitude,
                              ]),
                            ));
                          case ActionType.pause:
                            if (_key.currentState!.validate()) {
                              bloc.add(PauseWorkOrderEvent(
                                workOrderId: state.workOrder.id,
                                reason: _controller.text,
                                files: _imageFiles
                                    .map((e) => File(e.path))
                                    .toList(),
                                gpsCoordinates: jsonEncode([
                                  _currentLocation!.latitude,
                                  _currentLocation!.longitude
                                ]),
                              ));
                            }
                            break;
                          case ActionType.resume:
                            bloc.add(ResumeWorkOrderEvent(
                              workOrderId: state.workOrder.id,
                              files:
                                  _imageFiles.map((e) => File(e.path)).toList(),
                              gpsCoordinates: jsonEncode([
                                _currentLocation!.latitude,
                                _currentLocation!.longitude,
                              ]),
                            ));
                            break;
                          case ActionType.cancel:
                            bloc.add(RejectWorkOrderEvent(
                              workOrderId: state.workOrder.id,
                              reason: _controller.text,
                            ));
                          case ActionType.reject:
                            bloc.add(RejectWorkOrderEvent(
                              workOrderId: state.workOrder.id,
                              reason: _controller.text,
                            ));
                        }
                        // Pass coordinates as a JSON string: "[longitude, latitude]" — including the double quotes.
                      },
                      child: Text(
                        "$action Job",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String get action {
    switch (widget.actionType) {
      case ActionType.start:
        return "Start";
      case ActionType.pause:
        return "Pause";
      case ActionType.resume:
        return "Resume";
      case ActionType.reject:
        return "Reject";
      case ActionType.cancel:
        return "Reject";
      default:
        return "Complete";
    }
  }

  String get subTitle {
    switch (widget.actionType) {
      case ActionType.start:
        return "Starting";
      case ActionType.pause:
        return "Pausing";
      case ActionType.resume:
        return "Resuming";
      default:
        return "Completing";
    }
  }
}
