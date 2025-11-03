import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Base class for all mocks to ensure proper registration
abstract class TestMock extends Mock {}

/// Helper function to register fallback values for mocktail
void registerFallbackValues() {
  // This function can be called in setUp to register fallback values
  // for types that are used in when() calls
}

/// Helper to verify no more interactions across multiple mocks
void verifyNoMoreInteractionsMultiple(List<Mock> mocks) {
  for (final mock in mocks) {
    verifyNoMoreInteractions(mock);
  }
}

/// Helper to reset all mocks
void resetMocks(List<Mock> mocks) {
  for (final mock in mocks) {
    reset(mock);
  }
}
