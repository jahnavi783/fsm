import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/parts/data/api/parts_api_client.dart';
import 'package:fsm/features/parts/data/models/part_dto.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'parts_api_client_test.mocks.dart';

@GenerateMocks([HttpClientAdapter])
void main() {
  late PartsApiClient apiClient;
  late MockHttpClientAdapter mockHttpClientAdapter;
  late Dio dio;

  setUp(() {
    mockHttpClientAdapter = MockHttpClientAdapter();
    dio = Dio();
    dio.httpClientAdapter = mockHttpClientAdapter;
    apiClient = PartsApiClient(dio, baseUrl: 'https://example.com/api');
  });

  const tPartDto = PartDto(
    partNumber: '123',
    partName: 'Test Part',
    category: 'Test',
    quantityAvailable: 10,
    unitPrice: 100.0,
    status: 'active',
  );

  final tPartsResponse = PartsResponse(parts: [tPartDto]);

  void setUpMockResponse(dynamic payload, {int statusCode = 200}) {
    final responseBody = ResponseBody.fromString(
      jsonEncode(payload),
      statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    when(mockHttpClientAdapter.fetch(any, any, any))
        .thenAnswer((_) async => responseBody);
  }

  group('getParts', () {
    test('should return PartsResponse when status is 200', () async {
      // Arrange
      final payload = tPartsResponse.toJson();
      setUpMockResponse(payload);

      // Act
      final result = await apiClient.getParts();

      // Assert
      expect(result, isA<PartsResponse>());
      expect(result.parts.length, 1);
      verify(mockHttpClientAdapter.fetch(any, any, any)).called(1);
    });
  });

  group('checkPartAvailability', () {
    test('should return PartDto when status is 200', () async {
      // Arrange
      final payload = tPartDto.toJson();
      setUpMockResponse(payload);

      // Act
      final result = await apiClient.checkPartAvailability(query: '123');

      // Assert
      expect(result, isA<PartDto>());
      expect(result.partNumber, '123');
      verify(mockHttpClientAdapter.fetch(
        argThat(predicate((RequestOptions options) {
          return options.method == 'GET' &&
              options.path.contains('/inventory/check') &&
              options.queryParameters['query'] == '123';
        })),
        any,
        any,
      ));
    });
  });
}
