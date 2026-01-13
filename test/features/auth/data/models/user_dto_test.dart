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
