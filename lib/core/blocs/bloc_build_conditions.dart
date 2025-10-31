import 'package:flutter_bloc/flutter_bloc.dart';

/// Mixin providing reusable buildWhen patterns for BLoC optimization.
///
/// This mixin implements property-based comparison patterns instead of
/// runtimeType comparisons for more precise rebuild control.
///
/// Requirements: 5.5, 5.4
///
/// Usage:
/// ```dart
/// class MyPage extends StatelessWidget with BlocBuildConditions {
///   @override
///   Widget build(BuildContext context) {
///     return BlocBuilder<MyBloc, MyState>(
///       buildWhen: buildWhenData, // Use mixin method
///       builder: (context, state) => MyWidget(),
///     );
///   }
/// }
/// ```
mixin BlocBuildConditions {
  /// Common build condition for loading state changes
  /// Only rebuilds when isLoading property changes
  bool buildWhenLoading<S extends BlocState>(S previous, S current) {
    // Use dynamic property access to handle different state types
    try {
      final prevLoading = (previous as dynamic).isLoading as bool?;
      final currLoading = (current as dynamic).isLoading as bool?;
      return prevLoading != currLoading;
    } catch (e) {
      // Fallback to always rebuild if property doesn't exist
      return true;
    }
  }

  /// Common build condition for data changes
  /// Only rebuilds when data property changes
  bool buildWhenData<S extends BlocState>(S previous, S current) {
    try {
      final prevData = (previous as dynamic).data;
      final currData = (current as dynamic).data;
      return prevData != currData;
    } catch (e) {
      // Fallback to always rebuild if property doesn't exist
      return true;
    }
  }

  /// Common build condition for error state changes
  /// Only rebuilds when hasError property changes
  bool buildWhenError<S extends BlocState>(S previous, S current) {
    try {
      final prevError = (previous as dynamic).hasError as bool?;
      final currError = (current as dynamic).hasError as bool?;
      return prevError != currError;
    } catch (e) {
      // Fallback to always rebuild if property doesn't exist
      return true;
    }
  }

  /// Common build condition for status changes
  /// Only rebuilds when status property changes
  bool buildWhenStatus<S extends BlocState>(S previous, S current) {
    try {
      final prevStatus = (previous as dynamic).status;
      final currStatus = (current as dynamic).status;
      return prevStatus != currStatus;
    } catch (e) {
      // Fallback to always rebuild if property doesn't exist
      return true;
    }
  }

  /// Specific build condition for WorkOrder-related states
  /// Optimized for work order list and detail pages
  bool buildWhenWorkOrders<S extends BlocState>(S previous, S current) {
    try {
      final prevWorkOrders = (previous as dynamic).workOrders;
      final currWorkOrders = (current as dynamic).workOrders;
      final prevLoading = (previous as dynamic).isLoading as bool?;
      final currLoading = (current as dynamic).isLoading as bool?;
      final prevFilter = (previous as dynamic).filterStatus;
      final currFilter = (current as dynamic).filterStatus;

      return prevWorkOrders != currWorkOrders ||
          prevLoading != currLoading ||
          prevFilter != currFilter;
    } catch (e) {
      // Fallback to always rebuild if properties don't exist
      return true;
    }
  }

  /// Specific build condition for Document-related states
  /// Optimized for document list and viewer pages
  bool buildWhenDocuments<S extends BlocState>(S previous, S current) {
    try {
      final prevDocuments = (previous as dynamic).documents;
      final currDocuments = (current as dynamic).documents;
      final prevLoading = (previous as dynamic).isLoading as bool?;
      final currLoading = (current as dynamic).isLoading as bool?;
      final prevFolder = (previous as dynamic).selectedFolder;
      final currFolder = (current as dynamic).selectedFolder;

      return prevDocuments != currDocuments ||
          prevLoading != currLoading ||
          prevFolder != currFolder;
    } catch (e) {
      // Fallback to always rebuild if properties don't exist
      return true;
    }
  }

  /// Specific build condition for Parts-related states
  /// Optimized for parts inventory and detail pages
  bool buildWhenParts<S extends BlocState>(S previous, S current) {
    try {
      final prevParts = (previous as dynamic).parts;
      final currParts = (current as dynamic).parts;
      final prevLoading = (previous as dynamic).isLoading as bool?;
      final currLoading = (current as dynamic).isLoading as bool?;
      final prevSearch = (previous as dynamic).searchQuery;
      final currSearch = (current as dynamic).searchQuery;

      return prevParts != currParts ||
          prevLoading != currLoading ||
          prevSearch != currSearch;
    } catch (e) {
      // Fallback to always rebuild if properties don't exist
      return true;
    }
  }

  /// Specific build condition for Profile-related states
  /// Optimized for user profile and settings pages
  bool buildWhenProfile<S extends BlocState>(S previous, S current) {
    try {
      final prevProfile = (previous as dynamic).profile;
      final currProfile = (current as dynamic).profile;
      final prevLoading = (previous as dynamic).isLoading as bool?;
      final currLoading = (current as dynamic).isLoading as bool?;
      final prevSettings = (previous as dynamic).settings;
      final currSettings = (current as dynamic).settings;

      return prevProfile != currProfile ||
          prevLoading != currLoading ||
          prevSettings != currSettings;
    } catch (e) {
      // Fallback to always rebuild if properties don't exist
      return true;
    }
  }

  /// Combined build condition for data or loading changes
  /// Useful for pages that need to rebuild on either data or loading state changes
  bool buildWhenDataOrLoading<S extends BlocState>(S previous, S current) {
    return buildWhenData(previous, current) ||
        buildWhenLoading(previous, current);
  }

  /// Combined build condition for data or error changes
  /// Useful for pages that need to rebuild on either data or error state changes
  bool buildWhenDataOrError<S extends BlocState>(S previous, S current) {
    return buildWhenData(previous, current) ||
        buildWhenError(previous, current);
  }

  /// Combined build condition for loading or error changes
  /// Useful for pages that show loading indicators or error states
  bool buildWhenLoadingOrError<S extends BlocState>(S previous, S current) {
    return buildWhenLoading(previous, current) ||
        buildWhenError(previous, current);
  }

  /// Comprehensive build condition that covers most common state changes
  /// Use this when you need to rebuild on data, loading, or error changes
  bool buildWhenCommon<S extends BlocState>(S previous, S current) {
    return buildWhenData(previous, current) ||
        buildWhenLoading(previous, current) ||
        buildWhenError(previous, current);
  }
}
