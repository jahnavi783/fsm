import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fsm/core/constants/hive_boxes.dart';
import 'package:fsm/core/storage/hive_service.dart';
import 'package:fsm/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fsm/features/auth/data/models/user_dto.dart';

class MockHiveService extends Mock implements HiveService {}

class MockBox extends Mock implements Box {}

void main() {
  group('AuthLocalDataSourceImpl', () {
    late AuthLocalDataSourceImpl dataSource;
    late MockHiveService mockHiveService;
    late MockBox mockBox;

    const testAccessToken = 'access_token_123';
    const testRefreshToken = 'refresh_token_123';
    const testUserDto = UserDto(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: 'test@example.com',
    );

    setUp(() {
      mockHiveService = MockHiveService();
      mockBox = MockBox();
      dataSource = AuthLocalDataSourceImpl(mockHiveService);

      // Setup default mock behavior
      when(() => mockHiveService.getBox(HiveBoxes.authBox))
          .thenAnswer((_) async => mockBox);
    });

    group('saveTokens', () {
      test('should save access and refresh tokens to Hive box', () async {
        // Arrange
        when(() => mockBox.put(any(), any())).thenAnswer((_) async {});

        // Act
        await dataSource.saveTokens(
          accessToken: testAccessToken,
          refreshToken: testRefreshToken,
        );

        // Assert
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.put('access_token', testAccessToken)).called(1);
        verify(() => mockBox.put('refresh_token', testRefreshToken)).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should throw exception when Hive operation fails', () async {
        // Arrange
        when(() => mockBox.put(any(), any())).thenThrow(
          HiveError('Failed to save token'),
        );

        // Act & Assert
        expect(
          () => dataSource.saveTokens(
            accessToken: testAccessToken,
            refreshToken: testRefreshToken,
          ),
          throwsA(isA<HiveError>()),
        );
      });
    });

    group('getAccessToken', () {
      test('should return access token from Hive box', () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(testAccessToken);

        // Act
        final result = await dataSource.getAccessToken();

        // Assert
        expect(result, equals(testAccessToken));
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.get('access_token')).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should return null when no access token is stored', () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(null);

        // Act
        final result = await dataSource.getAccessToken();

        // Assert
        expect(result, isNull);
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.get('access_token')).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should throw exception when Hive operation fails', () async {
        // Arrange
        when(() => mockBox.get(any())).thenThrow(
          HiveError('Failed to get token'),
        );

        // Act & Assert
        expect(
          () => dataSource.getAccessToken(),
          throwsA(isA<HiveError>()),
        );
      });
    });

    group('getRefreshToken', () {
      test('should return refresh token from Hive box', () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(testRefreshToken);

        // Act
        final result = await dataSource.getRefreshToken();

        // Assert
        expect(result, equals(testRefreshToken));
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.get('refresh_token')).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should return null when no refresh token is stored', () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(null);

        // Act
        final result = await dataSource.getRefreshToken();

        // Assert
        expect(result, isNull);
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.get('refresh_token')).called(1);
        verifyNoMoreInteractions(mockBox);
      });
    });

    group('saveUser', () {
      test('should save user data to Hive box', () async {
        // Arrange
        when(() => mockBox.put(any(), any())).thenAnswer((_) async {});

        // Act
        await dataSource.saveUser(testUserDto);

        // Assert
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.put('user', testUserDto.toJson())).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should throw exception when Hive operation fails', () async {
        // Arrange
        when(() => mockBox.put(any(), any())).thenThrow(
          HiveError('Failed to save user'),
        );

        // Act & Assert
        expect(
          () => dataSource.saveUser(testUserDto),
          throwsA(isA<HiveError>()),
        );
      });
    });

    group('getUser', () {
      test('should return UserDto when user data exists', () async {
        // Arrange
        final userData = testUserDto.toJson();
        when(() => mockBox.get(any())).thenReturn(userData);

        // Act
        final result = await dataSource.getUser();

        // Assert
        expect(result, equals(testUserDto));
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.get('user')).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should return null when no user data is stored', () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn(null);

        // Act
        final result = await dataSource.getUser();

        // Assert
        expect(result, isNull);
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.get('user')).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should throw exception when Hive operation fails', () async {
        // Arrange
        when(() => mockBox.get(any())).thenThrow(
          HiveError('Failed to get user'),
        );

        // Act & Assert
        expect(
          () => dataSource.getUser(),
          throwsA(isA<HiveError>()),
        );
      });

      test('should handle invalid user data gracefully', () async {
        // Arrange
        when(() => mockBox.get(any())).thenReturn('invalid_data');

        // Act & Assert
        expect(
          () => dataSource.getUser(),
          throwsA(isA<TypeError>()),
        );
      });
    });

    group('clearAuthData', () {
      test('should clear all auth data from Hive box', () async {
        // Arrange
        when(() => mockBox.clear()).thenAnswer((_) async => 0);

        // Act
        await dataSource.clearAuthData();

        // Assert
        verify(() => mockHiveService.getBox(HiveBoxes.authBox)).called(1);
        verify(() => mockBox.clear()).called(1);
        verifyNoMoreInteractions(mockBox);
      });

      test('should throw exception when Hive operation fails', () async {
        // Arrange
        when(() => mockBox.clear()).thenThrow(
          HiveError('Failed to clear data'),
        );

        // Act & Assert
        expect(
          () => dataSource.clearAuthData(),
          throwsA(isA<HiveError>()),
        );
      });
    });
  });
}
