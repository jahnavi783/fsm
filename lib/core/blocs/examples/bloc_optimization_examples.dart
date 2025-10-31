import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs.dart';

/// Example implementations demonstrating BLoC optimization patterns
///
/// These examples show how to use the BlocBuildConditions mixin and
/// BlocListenerHelpers for optimal performance and clean code.

// Example 1: Basic page with optimized rebuilds
class OptimizedWorkOrdersPage extends StatelessWidget with BlocBuildConditions {
  const OptimizedWorkOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Work Orders')),
      body: BlocConsumer<WorkOrderBloc, WorkOrderState>(
        // Use mixin method for precise rebuild control
        buildWhen: buildWhenWorkOrders,

        // Use helper for error handling
        listenWhen: (previous, current) =>
            previous.hasError != current.hasError,
        listener: BlocListenerHelpers.showSnackBarOnError,

        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: state.workOrders.length,
            itemBuilder: (context, index) {
              return WorkOrderCard(workOrder: state.workOrders[index]);
            },
          );
        },
      ),
    );
  }
}

// Example 2: Page with multiple BLoC listeners
class OptimizedDashboardPage extends StatelessWidget with BlocBuildConditions {
  const OptimizedDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          // Authentication listener
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) =>
                previous.isAuthenticated != current.isAuthenticated,
            listener: BlocListenerHelpers.handleAuthenticationChange,
          ),

          // Connectivity listener
          BlocListener<ConnectivityBloc, ConnectivityState>(
            listenWhen: (previous, current) =>
                previous.isOnline != current.isOnline,
            listener: BlocListenerHelpers.handleConnectivityChange,
          ),

          // Sync status listener
          BlocListener<SyncBloc, SyncState>(
            listenWhen: (previous, current) =>
                previous.syncStatus != current.syncStatus,
            listener: BlocListenerHelpers.handleSyncStatusChange,
          ),
        ],
        child: BlocBuilder<DashboardBloc, DashboardState>(
          buildWhen: buildWhenCommon, // Rebuild on data, loading, or error
          builder: (context, state) {
            return _buildDashboardContent(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildDashboardContent(BuildContext context, DashboardState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),
            Text(state.errorMessage ?? 'An error occurred'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _handleRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return const DashboardContent();
  }

  void _handleRetry() {
    // Handle retry logic
  }
}

// Example 3: Fine-grained rebuilds with BlocSelector
class OptimizedWorkOrderCountWidget extends StatelessWidget {
  const OptimizedWorkOrderCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Only rebuilds when workOrders list length changes
    return BlocSelector<WorkOrderBloc, WorkOrderState, int>(
      selector: (state) => state.workOrders.length,
      builder: (context, count) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$count Work Orders',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        );
      },
    );
  }
}

// Example 4: Complex selector with multiple properties
class OptimizedWorkOrderStatsWidget extends StatelessWidget {
  const OptimizedWorkOrderStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Only rebuilds when specific derived values change
    return BlocSelector<WorkOrderBloc, WorkOrderState,
        ({int total, int urgent, int completed})>(
      selector: (state) => (
        total: state.workOrders.length,
        urgent: state.workOrders.where((w) => w.priority == 'urgent').length,
        completed:
            state.workOrders.where((w) => w.status == 'completed').length,
      ),
      builder: (context, stats) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard('Total', stats.total.toString()),
            _buildStatCard('Urgent', stats.urgent.toString()),
            _buildStatCard('Completed', stats.completed.toString()),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label),
          ],
        ),
      ),
    );
  }
}

// Example 5: Form with confirmation dialog
class OptimizedWorkOrderFormPage extends StatelessWidget
    with BlocBuildConditions {
  const OptimizedWorkOrderFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Work Order')),
      body: MultiBlocListener(
        listeners: [
          // Success navigation
          BlocListener<WorkOrderFormBloc, WorkOrderFormState>(
            listenWhen: (previous, current) =>
                previous.isSuccess != current.isSuccess,
            listener: (context, state) {
              BlocListenerHelpers.navigateBackOnCompletion(context, state);
              BlocListenerHelpers.showSnackBarOnSuccess(context, state);
            },
          ),

          // Error handling
          BlocListener<WorkOrderFormBloc, WorkOrderFormState>(
            listenWhen: (previous, current) =>
                previous.hasError != current.hasError,
            listener: BlocListenerHelpers.showSnackBarOnError,
          ),

          // Confirmation dialog
          BlocListener<WorkOrderFormBloc, WorkOrderFormState>(
            listenWhen: (previous, current) =>
                previous.showConfirmation != current.showConfirmation,
            listener: (context, state) {
              BlocListenerHelpers.showConfirmationDialog(
                context,
                state,
                onConfirm: _handleConfirmSubmit,
                onCancel: _handleCancelSubmit,
              );
            },
          ),
        ],
        child: BlocBuilder<WorkOrderFormBloc, WorkOrderFormState>(
          buildWhen: buildWhenLoadingOrError,
          builder: (context, state) {
            return const WorkOrderForm();
          },
        ),
      ),
    );
  }

  void _handleConfirmSubmit() {
    // Handle form submission confirmation
  }

  void _handleCancelSubmit() {
    // Handle form submission cancellation
  }
}

// Placeholder classes for the examples
abstract class WorkOrderBloc extends Cubit<WorkOrderState> {
  WorkOrderBloc() : super(const WorkOrderState());
}

class WorkOrderState {
  const WorkOrderState({
    this.workOrders = const [],
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
    this.filterStatus,
  });

  final List<WorkOrder> workOrders;
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final String? filterStatus;
}

class WorkOrder {
  const WorkOrder({
    required this.id,
    required this.title,
    required this.priority,
    required this.status,
  });

  final String id;
  final String title;
  final String priority;
  final String status;
}

// Additional placeholder classes
abstract class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState());
}

class AuthState {
  const AuthState({this.isAuthenticated = false});
  final bool isAuthenticated;
}

abstract class ConnectivityBloc extends Cubit<ConnectivityState> {
  ConnectivityBloc() : super(const ConnectivityState());
}

class ConnectivityState {
  const ConnectivityState({this.isOnline = true});
  final bool isOnline;
}

abstract class SyncBloc extends Cubit<SyncState> {
  SyncBloc() : super(const SyncState());
}

class SyncState {
  const SyncState({this.syncStatus});
  final String? syncStatus;
}

abstract class DashboardBloc extends Cubit<DashboardState> {
  DashboardBloc() : super(const DashboardState());
}

class DashboardState {
  const DashboardState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
  });

  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
}

abstract class WorkOrderFormBloc extends Cubit<WorkOrderFormState> {
  WorkOrderFormBloc() : super(const WorkOrderFormState());
}

class WorkOrderFormState {
  const WorkOrderFormState({
    this.isSuccess = false,
    this.hasError = false,
    this.errorMessage,
    this.successMessage,
    this.showConfirmation = false,
    this.isCompleted = false,
  });

  final bool isSuccess;
  final bool hasError;
  final String? errorMessage;
  final String? successMessage;
  final bool showConfirmation;
  final bool isCompleted;
}

// Placeholder widgets
class WorkOrderCard extends StatelessWidget {
  const WorkOrderCard({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    return const Card(child: ListTile(title: Text('Work Order')));
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard Content'));
  }
}

class WorkOrderForm extends StatelessWidget {
  const WorkOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Work Order Form'));
  }
}
