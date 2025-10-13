import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm_flutter/data/client.dart';
import 'package:fsm_flutter/data/entity/document_entity.dart';
import 'package:fsm_flutter/data/entity/spare_part.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:fsm_flutter/data/response/wo_complete_request.dart';
import 'package:fsm_flutter/injection.dart';
import 'package:fsm_flutter/presentation/core/components/bottom_sheet_with_search_for_materials.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_appbar_widget.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_elevated_button.dart';
import 'package:fsm_flutter/presentation/core/resources/pause_work_order_widget.dart';
import 'package:fsm_flutter/presentation/pages/documents/document_action_sheet.dart';
import 'package:fsm_flutter/presentation/pages/work_order/work_order_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/services/location_service.dart' show LocationService;
import '../../core/resources/custom_dropdown_form_widget.dart';
import '../fsm_dashboard/fsm_dashboard.dart';

class StartJobScreen extends StatefulWidget {
  final int workOrderId;

  const StartJobScreen({super.key, required this.workOrderId});

  @override
  State<StartJobScreen> createState() => _StartJobScreenState();
}

class _StartJobScreenState extends State<StartJobScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _additionalRepairsSuggestedController =
      TextEditingController();
  final TextEditingController _engineerRemarksController =
      TextEditingController();
  List<SparePartEntity> materialUsedList = [];

  final _client = serviceLocator<RestClient>();
  List<SparePartEntity> selectedMaterials = [];
  String? materialUsedDropdown;

  final List<XFile> _imageFiles = [];

  final LocationService _locationService = LocationService();
  final ImagePicker _picker = ImagePicker();

  String? _currentDateTime;
  LatLng? _currentLocation;
  final MapController _mapController = MapController();

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
  void initState() {
    _getCurrentLocation();
    _client.getInventory().then((response) {
      setState(() {
        materialUsedList = response.parts;
      });
    }).catchError((error) {
      // Handle error if needed
      print("Error fetching inventory: $error");
    });

    super.initState();
  }

  void _openSelectionBottomSheetForMaterials() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SelectionBottomSheetForMaterials(
          items: materialUsedList,
          selectedItems: selectedMaterials,
          onItemSelected: (newSelectedItems) {
            setState(() {
              selectedMaterials = newSelectedItems;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showDocumentActionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DocumentActionSheet(
        onDocumentSelected: (DocumentEntity document) {
          // Handle document selection - you can implement download or view functionality here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected document: ${document.title}'),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<WorkOrderBloc>();
    return BlocConsumer<WorkOrderBloc, WorkOrderState>(
        listener: (context, state) {
      if (state is WorkOrderCompletedState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Work Order Completed Successfully!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FSMDashboardPage(
              initialStatus: WorkOrderStatus.completed,
            ),
          ),
        );
      }
      if (state is WorkOrderPausedState) {
        print("Work Order Paused");
        Future.delayed(Duration.zero, () {
          Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(
              builder: (context) => FSMDashboardPage(
                initialStatus: WorkOrderStatus.paused,
              ),
            ),
            (route) => false,
          );
        });
      }
    }, builder: (context, asyncSnapshot) {
      return PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (didPop) {
            return;
          }
          if (_currentLocation == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      "Please wait for location to load before pausing the job")),
            );
            return;
          }
          final bool shouldPop = showPauseWorkOrderDialog(
                context: context,
                requestId: widget.workOrderId,
              ) ??
              false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: GradientAppBar(title: Text("Job ID - ${widget.workOrderId}")),
          body: BlocBuilder<WorkOrderBloc, WorkOrderState>(
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
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Spacer(),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Location status indicator
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                        SizedBox(height: 5),
                        InkWell(
                          onTap: _openSelectionBottomSheetForMaterials,
                          child: AbsorbPointer(
                            child: CustomDropDownFormField(
                              value: materialUsedDropdown,
                              onTap: _openSelectionBottomSheetForMaterials,
                              onChanged: (String? value) {
                                setState(() {
                                  materialUsedDropdown = value!;
                                });
                              },
                              // validator: (value) {
                              //   if (selectedMaterials.isEmpty) {
                              //     return "Please select at least one material";
                              //   } else {
                              //     return null;
                              //   }
                              // },
                              items: [],
                              label: "Materials(Parts) Used",
                            ),
                          ),
                        ),
                        SizedBox(height: (5)),
                        Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: selectedMaterials.map((item) {
                            TextPainter textPainter = TextPainter(
                              text: TextSpan(
                                text: "${item.partName}\n(${item.partNumber})",
                              ),
                              textDirection: TextDirection.ltr,
                            );
                            textPainter.layout();

                            double itemWidth = textPainter.width + 24;
                            double itemHeight = textPainter.height + (10);

                            return Container(
                              // padding: EdgeInsets.symmetric(
                              //   horizontal: (5),
                              //   vertical: (4),
                              // ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular((5)),
                              ),
                              width: itemWidth,
                              height: itemHeight,
                              child: Center(
                                child: Text(
                                  "${item.partName}\n(${item.partNumber})",
                                  style: TextStyle(
                                    fontSize: (12),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 10),
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
                                    child: CircularProgressIndicator())
                                : FlutterMap(
                                    mapController: _mapController,
                                    options: MapOptions(
                                      initialCenter: _currentLocation!,
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
                        18.verticalSpace,
                        TextFormField(
                          maxLines: 3,
                          controller: _commentsController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "General comments cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("General Comments"),
                                const Text(
                                  " *",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            hintText: 'Enter General Comments',
                          ),
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            ..._imageFiles.map((image) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
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
                              onTap: () => _getImage(ImageSource.camera),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.0),
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
                        20.verticalSpace,
                        //Need Help

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: PauseWorkOrderProvider(
                                requestId: widget.workOrderId,
                              ),
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: GradientElevatedButton(
                                  onPressed: _currentLocation == null
                                      ? () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Please wait for location to load before completing the job")),
                                          );
                                        }
                                      : () async {
                                          FocusScope.of(context).unfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Are you sure you want to mark this job completed?"),
                                                  actions: [
                                                    GradientElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      backgroundColor:
                                                          Colors.red,
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    GradientElevatedButton(
                                                      onPressed: () async {
                                                        final event =
                                                            CompleteWorkOrderEvent(
                                                          workOrderId: widget
                                                              .workOrderId,
                                                          gpsCoordinates:
                                                              jsonEncode([
                                                            _currentLocation
                                                                ?.latitude,
                                                            _currentLocation
                                                                ?.longitude
                                                          ]),
                                                          comment:
                                                              _commentsController
                                                                  .text,
                                                          files: _imageFiles
                                                              .map((e) =>
                                                                  File(e.path))
                                                              .toList(),
                                                          partsUsed: selectedMaterials
                                                              .map((e) =>
                                                                  WoCompletePartsUsedRequest(
                                                                      e.partNumber,
                                                                      1))
                                                              .toList(),
                                                        );
                                                        bloc.add(event);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Complete",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                  child: Text(
                                    "Complete",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: _showDocumentActionSheet,
                          child: Text(
                            "Need Help?",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
