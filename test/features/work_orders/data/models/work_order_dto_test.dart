import 'package:flutter_test/flutter_test.dart';
import 'package:fsm/features/work_orders/data/models/work_order_dto.dart';
import 'package:fsm/features/work_orders/domain/entities/work_order_entity.dart';

void main() {
  group('WorkOrderDto - Serialization', () {
    test('fromJson creates dto from JSON', () {
      // Arrange
      final json = {
        'id': 1,
        'wo_number': 'WO-001',
        'sr_id': 100,
        'summary': 'Fix pump',
        'problem_description': 'Pump broken',
        'priority': 'high',
        'visit_date': '2025-01-15T00:00:00.000Z',
        'location': 'Building A',
        'status': 'assigned',
        'duration_days': 1,
        'duration_hours': 8.0,
        'createdAt': '2025-01-10T00:00:00.000Z',
        'updatedAt': '2025-01-10T00:00:00.000Z',
      };

      // Act
      final dto = WorkOrderDto.fromJson(json);

      // Assert
      expect(dto.id, 1);
      expect(dto.woNumber, 'WO-001');
      expect(dto.srId, 100);
      expect(dto.priority, 'high');
      expect(dto.status, 'assigned');
    });

    test('toJson converts dto to JSON', () {
      // Arrange
      const dto = WorkOrderDto(
        id: 1,
        woNumber: 'WO-001',
        srId: 100,
        summary: 'Fix pump',
        problemDescription: 'Pump broken',
        priority: 'high',
        visitDate: '2025-01-15T00:00:00.000Z',
        location: 'Building A',
        status: 'assigned',
        durationDays: 1,
        durationHours: 8.0,
        createdAt: '2025-01-10T00:00:00.000Z',
        updatedAt: '2025-01-10T00:00:00.000Z',
      );

      // Act
      final json = dto.toJson();

      // Assert
      expect(json['id'], 1);
      expect(json['wo_number'], 'WO-001');
      expect(json['sr_id'], 100);
      expect(json['priority'], 'high');
    });

    test('handles nullable fields correctly', () {
      // Arrange
      final json = {
        'id': 1,
        'wo_number': 'WO-001',
        'sr_id': 100,
        'summary': 'Fix pump',
        'problem_description': 'Pump broken',
        'priority': 'high',
        'visit_date': '2025-01-15T00:00:00.000Z',
        'location': 'Building A',
        'status': 'assigned',
        'duration_days': 1,
        'createdAt': '2025-01-10T00:00:00.000Z',
        'updatedAt': '2025-01-10T00:00:00.000Z',
        // No optional fields
      };

      // Act
      final dto = WorkOrderDto.fromJson(json);

      // Assert
      expect(dto.durationHours, isNull);
      expect(dto.startedAt, isNull);
      expect(dto.completedAt, isNull);
    });
  });

  group('WorkOrderDto - Mapping to Entity', () {
    test('toEntity converts dto to domain entity', () {
      // Arrange
      const dto = WorkOrderDto(
        id: 1,
        woNumber: 'WO-001',
        srId: 100,
        serviceRequestNumber: 'SR-000000000100',
        summary: 'Fix pump',
        problemDescription: 'Pump broken',
        priority: 'high',
        visitDate: '2025-01-15T00:00:00.000',
        location: 'Building A',
        status: 'assigned',
        durationDays: 1,
        durationHours: 8.0,
        createdAt: '2025-01-10T00:00:00.000',
        updatedAt: '2025-01-10T00:00:00.000',
      );

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity.id, 1);
      expect(entity.woNumber, 'WO-001');
      expect(entity.priority, WorkOrderPriority.high);
      expect(entity.status, WorkOrderStatus.assigned);
      expect(entity.visitDate, DateTime(2025, 1, 15));
    });

    test('maps status correctly - all status types', () {
      // Test data
      final testCases = {
        'new': WorkOrderStatus.created,
        'assigned': WorkOrderStatus.assigned,
        'in progress': WorkOrderStatus.inProgress,
        'in_progress': WorkOrderStatus.inProgress,
        'paused': WorkOrderStatus.paused,
        'completed': WorkOrderStatus.completed,
        'rejected': WorkOrderStatus.rejected,
        'reassigned': WorkOrderStatus.assigned,
        're_assigned': WorkOrderStatus.assigned,
      };

      testCases.forEach((statusString, expectedStatus) {
        // Arrange
        final dto = WorkOrderDto(
          id: 1,
          woNumber: 'WO-001',
          srId: 100,
          summary: 'Test',
          problemDescription: 'Test',
          priority: 'high',
          visitDate: '2025-01-15T00:00:00.000Z',
          location: 'Building A',
          status: statusString,
          durationDays: 1,
          createdAt: '2025-01-10T00:00:00.000Z',
          updatedAt: '2025-01-10T00:00:00.000Z',
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(
          entity.status,
          expectedStatus,
          reason: 'Failed to map status: $statusString',
        );
      });
    });

    test('maps priority correctly - all priority types', () {
      // Test data
      final testCases = {
        'low': WorkOrderPriority.low,
        'medium': WorkOrderPriority.medium,
        'high': WorkOrderPriority.high,
        'urgent': WorkOrderPriority.urgent,
      };

      testCases.forEach((priorityString, expectedPriority) {
        // Arrange
        final dto = WorkOrderDto(
          id: 1,
          woNumber: 'WO-001',
          srId: 100,
          summary: 'Test',
          problemDescription: 'Test',
          priority: priorityString,
          visitDate: '2025-01-15T00:00:00.000Z',
          location: 'Building A',
          status: 'assigned',
          durationDays: 1,
          createdAt: '2025-01-10T00:00:00.000Z',
          updatedAt: '2025-01-10T00:00:00.000Z',
        );

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(
          entity.priority,
          expectedPriority,
          reason: 'Failed to map priority: $priorityString',
        );
      });
    });

    test('converts date strings to DateTime correctly', () {
      // Arrange
      const dto = WorkOrderDto(
        id: 1,
        woNumber: 'WO-001',
        srId: 100,
        summary: 'Test',
        problemDescription: 'Test',
        priority: 'high',
        visitDate: '2025-01-15T10:30:00.000Z',
        location: 'Building A',
        status: 'in_progress',
        durationDays: 1,
        createdAt: '2025-01-10T00:00:00.000Z',
        updatedAt: '2025-01-12T14:30:00.000Z',
        startedAt: '2025-01-15T09:00:00.000Z',
        completedAt: '2025-01-15T17:00:00.000Z',
      );

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity.visitDate.year, 2025);
      expect(entity.visitDate.month, 1);
      expect(entity.visitDate.day, 15);
      expect(entity.startedAt?.year, 2025);
      expect(entity.completedAt?.year, 2025);
    });

    test('handles optional timestamps', () {
      // Arrange - DTO without timestamps
      const dto = WorkOrderDto(
        id: 1,
        woNumber: 'WO-001',
        srId: 100,
        summary: 'Test',
        problemDescription: 'Test',
        priority: 'high',
        visitDate: '2025-01-15T00:00:00.000Z',
        location: 'Building A',
        status: 'assigned',
        durationDays: 1,
        createdAt: '2025-01-10T00:00:00.000Z',
        updatedAt: '2025-01-10T00:00:00.000Z',
        startedAt: null,
        completedAt: null,
      );

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity.startedAt, isNull);
      expect(entity.completedAt, isNull);
      expect(entity.resumedAt, isNull);
    });
  });

  group('WorkOrderDto - Edge Cases', () {
    test('handles empty string summary', () {
      // Arrange
      const dto = WorkOrderDto(
        id: 1,
        woNumber: 'WO-001',
        srId: 100,
        summary: '',
        problemDescription: 'Problem',
        priority: 'high',
        visitDate: '2025-01-15T00:00:00.000Z',
        location: 'Building A',
        status: 'assigned',
        durationDays: 1,
        createdAt: '2025-01-10T00:00:00.000Z',
        updatedAt: '2025-01-10T00:00:00.000Z',
      );

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity.summary, '');
    });

    test('handles zero duration', () {
      // Arrange
      const dto = WorkOrderDto(
        id: 1,
        woNumber: 'WO-001',
        srId: 100,
        summary: 'Test',
        problemDescription: 'Test',
        priority: 'high',
        visitDate: '2025-01-15T00:00:00.000Z',
        location: 'Building A',
        status: 'assigned',
        durationDays: 0,
        durationHours: 0.0,
        createdAt: '2025-01-10T00:00:00.000Z',
        updatedAt: '2025-01-10T00:00:00.000Z',
      );

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity.durationDays, 0);
      expect(entity.durationHours, 0.0);
    });

    test('handles unknown status with fallback', () {
      // Arrange
      const dto = WorkOrderDto(
        id: 1,
        woNumber: 'WO-001',
        srId: 100,
        summary: 'Test',
        problemDescription: 'Test',
        priority: 'high',
        visitDate: '2025-01-15T00:00:00.000Z',
        location: 'Building A',
        status: 'unknown_status', // Invalid status
        durationDays: 1,
        createdAt: '2025-01-10T00:00:00.000Z',
        updatedAt: '2025-01-10T00:00:00.000Z',
      );

      // Act
      final entity = dto.toEntity();

      // Assert - Should fallback to a default status
      expect(entity.status, isNotNull);
    });
  });
}
