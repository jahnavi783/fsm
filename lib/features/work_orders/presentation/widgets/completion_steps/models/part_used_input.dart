import 'package:flutter/material.dart';
import 'package:fsm/features/parts/domain/entities/part_entity.dart';

/// Model for part used input with quantity
class PartUsedInput {
  final PartEntity part;
  final TextEditingController quantityController;

  PartUsedInput({
    required this.part,
    required this.quantityController,
  });

  void dispose() {
    quantityController.dispose();
  }
}
