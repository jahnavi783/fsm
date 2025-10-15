import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../di/injection.dart';
import '../services/memory_management_service.dart';
import '../services/performance_service.dart';

/// Performance monitoring widget for debug builds
class PerformanceMonitorWidget extends StatefulWidget {
  final Widget child;

  const PerformanceMonitorWidget({
    super.key,
    required this.child,
  });

  @override
  State<PerformanceMonitorWidget> createState() =>
      _PerformanceMonitorWidgetState();
}

class _PerformanceMonitorWidgetState extends State<PerformanceMonitorWidget> {
  bool _showMonitor = false;
  late final PerformanceService _performanceService;
  late final MemoryManagementService _memoryService;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _performanceService = getIt<PerformanceService>();
      _memoryService = getIt<MemoryManagementService>();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) {
      return widget.child;
    }

    return Stack(
      children: [
        widget.child,
        if (_showMonitor) _buildMonitorOverlay(),
        _buildToggleButton(),
      ],
    );
  }

  Widget _buildToggleButton() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10.h,
      right: 10.w,
      child: FloatingActionButton.small(
        onPressed: () {
          setState(() {
            _showMonitor = !_showMonitor;
          });
        },
        backgroundColor: Colors.black54,
        child: Icon(
          _showMonitor ? Icons.close : Icons.monitor,
          color: Colors.white,
          size: 16.w,
        ),
      ),
    );
  }

  Widget _buildMonitorOverlay() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 60.h,
      right: 10.w,
      child: Container(
        width: 200.w,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Performance Monitor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            _buildMemoryInfo(),
            SizedBox(height: 8.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoryInfo() {
    return FutureBuilder<MemoryStatistics>(
      future: Future.value(_memoryService.getMemoryStatistics()),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text(
            'Loading...',
            style: TextStyle(color: Colors.white70, fontSize: 10.sp),
          );
        }

        final stats = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatRow('Current', '${stats.currentUsageMB}MB'),
            _buildStatRow('Average', '${stats.averageUsageMB}MB'),
            _buildStatRow('Peak', '${stats.peakUsageMB}MB'),
            _buildStatRow('Samples', '${stats.snapshotCount}'),
          ],
        );
      },
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white70, fontSize: 10.sp),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 10.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              await _memoryService.optimizeMemory();
              setState(() {}); // Refresh display
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(vertical: 4.h),
            ),
            child: Text(
              'Optimize Memory',
              style: TextStyle(fontSize: 9.sp),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _performanceService.clearMetrics();
              setState(() {}); // Refresh display
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 4.h),
            ),
            child: Text(
              'Clear Metrics',
              style: TextStyle(fontSize: 9.sp),
            ),
          ),
        ),
      ],
    );
  }
}
