import 'package:dio/dio.dart';

class StartWorkOrderRequest {
  final String gpsCoordinates;
  final List<MultipartFile>? files;

  StartWorkOrderRequest({
    required this.gpsCoordinates,
    this.files,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['gps_coordinates'] = gpsCoordinates;
    return data;
  }

  FormData toFormData() {
    final formData = FormData();
    formData.fields.add(MapEntry('gps_coordinates', gpsCoordinates));

    if (files != null && files!.isNotEmpty) {
      for (var file in files!) {
        formData.files.add(MapEntry('files', file));
      }
    }

    return formData;
  }
}
