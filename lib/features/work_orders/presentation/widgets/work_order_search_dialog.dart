import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm/core/router/app_router.gr.dart';
import 'package:fsm/core/theme/design_tokens.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_bloc.dart';
import 'package:fsm/features/work_orders/presentation/blocs/work_orders_list/work_orders_list_state.dart';

class WorkOrderSearchDialog extends StatefulWidget {
  const WorkOrderSearchDialog({super.key});

  /// Show the search dialog
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const WorkOrderSearchDialog(),
    );
  }

  @override
  State<WorkOrderSearchDialog> createState() => _WorkOrderSearchDialogState();
}

class _WorkOrderSearchDialogState extends State<WorkOrderSearchDialog> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    // Auto-focus the text field when dialog opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
      ),
      title: Row(
        children: [
          Icon(
            Icons.search,
            color: theme.colorScheme.primary,
            size: DesignTokens.iconMd,
          ),
          SizedBox(width: DesignTokens.space2.w),
          Text(
            'Search Work Order',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Enter Work Order Number',
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color:
                    theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
              ),
              prefixIcon: Icon(
                Icons.tag,
                color: theme.colorScheme.primary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                borderSide: BorderSide(
                  color: theme.colorScheme.outline,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
            textCapitalization: TextCapitalization.characters,
            autofocus: true,
            enabled: !_isSearching,
            onSubmitted: (_) => _performSearch(context),
          ),
          SizedBox(height: DesignTokens.space2.h),
          Text(
            'Example: WO-20251203-0003',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isSearching ? null : () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: _isSearching
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                  : theme.colorScheme.primary,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _isSearching ? null : () => _performSearch(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMd.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: DesignTokens.space4.w,
              vertical: DesignTokens.space3.h,
            ),
          ),
          child: _isSearching
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.onPrimary,
                    ),
                  ),
                )
              : const Text('Search'),
        ),
      ],
    );
  }

  void _performSearch(BuildContext context) {
    final searchQuery = _searchController.text.trim().toUpperCase();

    // Validate input
    if (searchQuery.isEmpty) {
      _showErrorSnackBar(context, 'Please enter a work order number');
      return;
    }

    setState(() => _isSearching = true);

    // Get work orders from the BLoC state
    final workOrdersListBloc = context.read<WorkOrdersListBloc>();
    final state = workOrdersListBloc.state;

    state.maybeWhen(
      loaded: (workOrders,
          unassignedWorkOrders,
          unassignedCount,
          currentPage,
          hasReachedMax,
          isLoadingMore,
          statusFilter,
          priorityFilter,
          searchQueryState,
          isOffline,
          hasPendingSync) {
        // Combine all work orders (assigned + unassigned)
        final allWorkOrders = [...unassignedWorkOrders, ...workOrders];

        // Search for matching work order
        // Search for matching work order
        final matches = allWorkOrders.where(
          (wo) => wo.woNumber.toUpperCase() == searchQuery,
        );
        final matchingWorkOrder = matches.isEmpty ? null : matches.first;

        setState(() => _isSearching = false);

        if (matchingWorkOrder != null) {
          // Found! Navigate to work order details
          Navigator.of(context).pop(); // Close the dialog
          context.router.push(
            WorkOrderDetailsRoute(workOrderId: matchingWorkOrder.id),
          );
        } else {
          // Not found
          _showErrorSnackBar(
            context,
            'Work order "$searchQuery" not found',
          );
        }
      },
      orElse: () {
        setState(() => _isSearching = false);
        _showErrorSnackBar(
          context,
          'Unable to search. Please try again.',
        );
      },
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
