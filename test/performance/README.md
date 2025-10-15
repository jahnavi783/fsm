# Performance Tests

Performance tests ensure the FSM Mobile App maintains optimal performance under various conditions and loads.

## Overview

This directory contains performance tests covering:

- **App Startup Performance**: Measuring app initialization and first screen load times
- **Scrolling Performance**: Testing list scrolling with large datasets
- **Network Performance**: API call response times and concurrent request handling
- **Memory Performance**: Memory usage monitoring and leak detection
- **Load Tests**: Large dataset processing and concurrent operations

## Test Categories

### App Startup Performance (`app_startup_performance_test.dart`)
- App startup time (target: <3 seconds)
- Splash to login transition performance
- Memory usage during startup
- Initial widget tree construction

### Scrolling Performance (`scrolling_performance_test.dart`)
- Large list scrolling (100+ items)
- Rapid scroll and stop scenarios
- Memory management during extended scrolling
- Frame rate consistency

### Network Performance (`network_performance_test.dart`)
- API response times (login, work orders, documents)
- Concurrent API call efficiency
- Timeout handling performance
- Large payload processing
- Network error recovery

### Memory Performance (`memory_performance_test.dart`)
- Large dataset memory usage (1000+ items)
- Memory leak detection during navigation
- Widget rebuild efficiency
- Image loading memory management

### Load Tests (`load_test.dart`)
- Processing 1000+ work orders
- Concurrent operations with multiple datasets
- Search performance with large datasets
- Offline/online synchronization performance

## Performance Targets

### Response Times
- **App Startup**: <3 seconds
- **Login API**: <500ms
- **Work Orders Fetch**: <1000ms
- **Search Operations**: <2000ms
- **Page Navigation**: <200ms

### Throughput
- **Large Dataset Processing**: 1000 items in <5 seconds
- **Concurrent API Calls**: 3 simultaneous calls in <250ms
- **Scrolling**: Smooth 60 FPS with 100+ items

### Memory Usage
- **Startup Memory**: Reasonable baseline for mobile devices
- **Large Dataset**: Efficient memory management with 1000+ items
- **Memory Leaks**: No detectable leaks during navigation cycles

## Running Performance Tests

### All Performance Tests
```bash
flutter test test/performance/
```

### Specific Test Categories
```bash
# Network performance
flutter test test/performance/network_performance_test.dart

# Memory performance (requires integration test setup)
flutter test integration_test:test/performance/memory_performance_test.dart

# Load tests
flutter test test/performance/load_test.dart
```

### Integration Test Performance
```bash
# App startup and scrolling (requires device/emulator)
flutter test integration_test:test/performance/app_startup_performance_test.dart
flutter test integration_test:test/performance/scrolling_performance_test.dart
```

## Performance Monitoring

### Metrics Collected
- **Timing**: Execution time for operations
- **Memory**: Memory usage patterns and leaks
- **Frame Rate**: UI smoothness during interactions
- **Network**: API response times and throughput

### Continuous Monitoring
- Run performance tests in CI/CD pipeline
- Set up performance regression detection
- Monitor performance metrics over time
- Alert on performance degradation

## Optimization Guidelines

### Network Performance
- Implement request caching
- Use connection pooling
- Optimize payload sizes
- Handle timeouts gracefully

### Memory Performance
- Use lazy loading for large lists
- Implement proper widget disposal
- Cache management strategies
- Image memory optimization

### UI Performance
- Minimize widget rebuilds
- Use const constructors
- Implement efficient list builders
- Optimize animation performance

## Troubleshooting

### Slow Performance
1. Check for memory leaks
2. Analyze network request patterns
3. Profile widget rebuild frequency
4. Verify efficient data structures

### Memory Issues
1. Monitor memory usage patterns
2. Check for retained references
3. Verify proper disposal of resources
4. Analyze image caching behavior

### Network Issues
1. Test with different network conditions
2. Verify timeout configurations
3. Check concurrent request limits
4. Monitor API response patterns

## Best Practices

1. **Regular Testing**: Run performance tests regularly during development
2. **Realistic Data**: Use realistic dataset sizes and network conditions
3. **Device Testing**: Test on various device specifications
4. **Baseline Establishment**: Establish performance baselines for comparison
5. **Continuous Monitoring**: Integrate performance testing into CI/CD
6. **Optimization Focus**: Focus on user-perceived performance metrics