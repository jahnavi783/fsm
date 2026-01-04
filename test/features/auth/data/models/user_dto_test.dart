import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/core/services/enums.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';

void main() {
  const tUserDto = UserDto(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'test@example.com',
    phone: '+1234567890',
    gender: Gender.male,
    city: 'New York',
    roleId: UserRole.technician,
    role: 'Technician',
  );

  group('UserDto', () {
    test('fromJson should create UserDto from JSON', () {
      // Arrange
      final json = {
        'id': 1,
        'first_name': 'John',
        'last_name': 'Doe',
        'email': 'test@example.com',
        'phone': '+1234567890',
        'gender': 'male',
        'city': 'New York',
        'role_id': 1,
        'role': 'Technician',
      };

      // Act
      final result = UserDto.fromJson(json);

      // Assert
      expect(result.id, 1);
      expect(result.firstName, 'John');
      expect(result.lastName, 'Doe');
      expect(result.email, 'test@example.com');
    });

    test('toJson should convert UserDto to JSON', () {
      // Act
      final json = tUserDto.toJson();

      // Assert
      expect(json['id'], 1);
      expect(json['first_name'], 'John');
      expect(json['last_name'], 'Doe');
      expect(json['email'], 'test@example.com');
    });

    test('toEntity should convert UserDto to UserEntity', () {
      // Act
      final entity = tUserDto.toEntity(
        accessToken: 'access_token',
        refreshToken: 'refresh_token',
      );

      // Assert
      expect(entity.id, tUserDto.id);
      expect(entity.firstName, tUserDto.firstName);
      expect(entity.lastName, tUserDto.lastName);
      expect(entity.email, tUserDto.email);
      expect(entity.accessToken, 'access_token');
      expect(entity.refreshToken, 'refresh_token');
    });

    test('fromEntity should convert UserEntity to UserDto', () {
      // Arrange
      final entity = tUserDto.toEntity(
        accessToken: 'access_token',
        refreshToken: 'refresh_token',
      );

      // Act
      final dto = entity.toDto();

      // Assert
      expect(dto.id, entity.id);
      expect(dto.firstName, entity.firstName);
      expect(dto.lastName, entity.lastName);
      expect(dto.email, entity.email);
    });
  });
}
// import 'package:flutter_test/flutter_test.dart';
// import 'package:dio/dio.dart';
// import 'package:fsm/features/auth/data/api/auth_api_client.dart';
// import 'package:fsm/features/auth/data/models/login_request.dart';
//
// void main() {
//   late AuthApiClient authApiClient;
//
//   setUp(() {
//     // Create real Dio instance pointing to your backend
//     final dio = Dio(
//       BaseOptions(
//         baseUrl: 'http://your-api-url.com', // Change this to your API URL
//         connectTimeout: Duration(seconds: 30),
//         receiveTimeout: Duration(seconds: 30),
//       ),
//     );
//
//     authApiClient = AuthApiClient(dio);
//   });
//
//   group('Auth API Integration Tests', () {
//     test('login with real credentials should return tokens', () async {
//       // Arrange
//       final loginRequest = LoginRequest(
//         email: 'your-test-email@example.com', // Use real test account credentials
//         password: 'your-test-password',
//       );
//
//       // Act
//       final response = await authApiClient.login(loginRequest);
//
//       // Assert
//       expect(response.accessToken, isNotNull);
//       expect(response.refreshToken, isNotNull);
//       expect(response.user, isNotNull);
//       expect(response.user.email, loginRequest.email);
//     });
//
//     test('login with invalid credentials should throw error', () async {
//       // Arrange
//       final loginRequest = LoginRequest(
//         email: 'wrong@example.com',
//         password: 'wrongpassword',
//       );
//
//       // Act & Assert
//       expect(
//             () => authApiClient.login(loginRequest),
//         throwsA(isA<DioException>()),
//       );
//     });
//
//     test('getCurrentUser should return user data with valid token', () async {
//       // Arrange - First login to get valid token
//       final loginRequest = LoginRequest(
//         email: 'your-test-email@example.com',
//         password: 'your-test-password',
//       );
//
//       final loginResponse = await authApiClient.login(loginRequest);
//
//       // Update dio headers with token
//       authApiClient.dio.options.headers['Authorization'] =
//       'Bearer ${loginResponse.accessToken}';
//
//       // Act
//       final user = await authApiClient.getCurrentUser();
//
//       // Assert
//       expect(user.id, isNotNull);
//       expect(user.email, isNotNull);
//       expect(user.firstName, isNotNull);
//     });
//   });
// }
