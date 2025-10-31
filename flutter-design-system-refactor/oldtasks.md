# Implementation Plan

## Overview
Complete refactor of the Flutter presentation layer to establish a scalable design system with zero hardcoded styling violations. This plan follows the architecture detailed in `design.md` and enforces strict CI compliance.

**Status**: In Progress - Phase 2 (Widget Consolidation)
**Approach**: Big Bang Refactor (Breaking Changes)
**Timeline**: 2-3 weeks intensive development
**Last Updated**: 2025-01-31

---

## Phase 1: Foundation - Theme System & Design Tokens ✅ COMPLETED

- [x] 1.1 Create DesignTokens class
  - [x] Implement centralized const values following 8pt grid system
  - [x] Add spacing scale (space0 through space16)
  - [x] Define icon sizes (iconXs, iconSm, iconMd, iconLg, iconXl)
  - [x] Define radius scale (radiusNone, radiusXs, radiusSm, radiusMd, radiusLg, radiusXl, radiusFull)
  - [x] Define component heights (button, input, appBar, bottomNav)
  - [x] Define typography scale (fontSize10 through fontSize48)
  - [x] Define elevation scale
  - [x] Add responsive helpers (paddingAllSmall, paddingAllMedium, verticalSpace, horizontalSpace)
  - [x] Add breakpoint helpers (isMobile, isTablet, isDesktop)
  - **File**: `lib/core/theme/design_tokens.dart`
  - **Replaces**: `lib/core/theme/app_dimensions.dart`
  - _Requirements: 1.1, 1.6, 3.1, 3.3, 3.6_

- [x] 1.2 Refactor FSMThemeExtension to strongly-typed properties
  - [x] Remove Map-based properties (statusColors, priorityColors)
  - [x] Add explicit color properties for work order priorities (urgent, high, medium, low)
  - [x] Add explicit color properties for statuses (pending, inProgress, completed, cancelled, overdue)
  - [x] Add explicit color properties for actions (start, pause, complete, cancel)
  - [x] Add explicit color properties for sync states (offline, syncing, synced, failed)
  - [x] Add component-specific colors (workOrderCardBackground, searchBarBackground, chipBackground, fabBackground)
  - [x] Implement proper lerp method for theme transitions
  - [x] Add FSMThemeExtensionAccessor extension for convenient access (context.fsmTheme)
  - [x] Define light and dark theme variants
  - **File**: `lib/core/theme/extensions/fsm_theme_extension.dart`
  - _Requirements: 1.2, 1.3, 1.4_

- [x] 1.3 Configure responsive typography in AppTheme
  - [x] Create _createTextTheme() method with DesignTokens and .sp extensions
  - [x] Configure all Material 3 TextTheme styles (displayLarge through labelSmall)
  - [x] Remove AppTypography wrapper class
  - [x] Ensure textScaleFactor support through Material 3 TextTheme
  - **File**: `lib/core/theme/app_theme.dart`
  - _Requirements: 1.5, 3.7_

- [x] 1.4 Update AppTheme component theme configurations
  - [x] Configure ElevatedButtonThemeData using DesignTokens
  - [x] Configure OutlinedButtonThemeData using DesignTokens
  - [x] Configure TextButtonThemeData using DesignTokens
  - [x] Configure CardThemeData using DesignTokens
  - [x] Configure ChipThemeData using DesignTokens
  - [x] Configure AppBarThemeData using DesignTokens
  - [x] Configure InputDecorationTheme using DesignTokens
  - [x] Configure SnackBarThemeData using DesignTokens
  - [x] Configure DialogThemeData using DesignTokens
  - [x] Configure DividerThemeData using DesignTokens
  - [x] Configure ProgressIndicatorThemeData
  - [x] Replace all AppDimensions references with DesignTokens
  - [x] Use REdgeInsets for all padding/margin configurations
  - **File**: `lib/core/theme/app_theme.dart`
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 3.2_

- [x] 1.5 Update ScreenUtil configuration
  - [x] Change designSize from Size(375, 812) to Size(390, 844)
  - [x] Ensure minTextAdapt: true
  - [x] Ensure splitScreenMode: true
  - [x] Add MediaQuery builder for textScaler
  - **File**: `lib/app.dart`
  - _Requirements: 1.6, 3.1, 3.2, 10.6, 10.7_

- [x] 1.6 Add CI lint rules for design system enforcement
  - [x] Check for hardcoded Colors usage (except Colors.transparent)
  - [x] Check for raw EdgeInsets usage
  - [x] Check for hardcoded SizedBox dimensions
  - [x] Check for direct .w/.h/.sp usage instead of tokens
  - [x] Check page line counts (300 line limit)
  - [x] Check for const constructors in custom widgets
  - [x] Check for anonymous functions in build methods
  - [x] Run golden tests
  - **File**: `.github/workflows/design_system_checks.yml`
  - _Requirements: 1.7, 8.5_

- [x] 1.7 Fix build.yaml configuration
  - [x] Remove duplicate colon in hive_ce_generator
  - [x] Add proper options for freezed (union_key, union_value_case, map, copyWith)
  - [x] Add proper options for hive_ce_generator (type_adapter_suffix)
  - **File**: `build.yaml`
  - _Requirements: 10.1, 10.2_

- [x] 1.8 Verify code generation after configuration changes
  - [x] Run dart run build_runner build --delete-conflicting-outputs
  - [x] Verify no stale .g.dart or .freezed.dart files
  - [x] Verify Hive adapters generate correctly
  - [x] Verify freezed models have copyWith and map methods
  - _Requirements: 10.1, 10.2, 10.3, 10.4_

---

## Phase 2: Widget Library Consolidation & Refactoring

### 2.1 Buttons (5 files)

- [ ] 2.1.1 Create unified FsmButton component
  - [ ] Create new FsmButton class in `lib/core/widgets/buttons/fsm_button.dart`
  - [ ] Implement FsmButtonVariant enum (filled, outlined, text)
  - [ ] Implement FsmButtonSize enum (small, medium, large)
  - [ ] Add const constructor with super.key
  - [ ] Use composition pattern (wrap Material buttons, not inheritance)
  - [ ] Add loading state support with CircularProgressIndicator
  - [ ] Add icon support with proper spacing using DesignTokens
  - [ ] Use DesignTokens for all dimensions and spacing
  - [ ] Use theme.colorScheme for colors
  - [ ] Add factory constructors: FsmButton.primary(), .secondary(), .outline(), .text()
  - [ ] Replace existing CustomButton usage throughout codebase
  - **Files**: `lib/core/widgets/buttons/fsm_button.dart` (new implementation)
  - **Replace**: `lib/core/widgets/custom_button.dart`, `lib/core/widgets/buttons/fsm_button.dart` (current duplicate)
  - _Requirements: 2.1, 2.4, Performance optimization_

- [ ] 2.1.2 Refactor specialized action button components
  - [ ] Update FSMActionButton to use DesignTokens instead of hardcoded values
  - [ ] Update QuickActionButton to use DesignTokens instead of hardcoded values
  - [ ] Ensure const constructors with super.key
  - [ ] Replace hardcoded styling with theme references
  - [ ] Remove duplicate implementations between root and buttons/ folder
  - **Files**: `lib/core/widgets/buttons/fsm_action_button.dart`, `lib/core/widgets/buttons/fsm_quick_action_button.dart`
  - _Requirements: 2.1, 2.4_

### 2.2 Cards (4+ files)

- [ ] 2.2.1 Consolidate card implementations
  - [ ] Merge root fsm_card.dart with cards/fsm_card.dart
  - [ ] Create unified FsmCard with variant system
  - [ ] Implement FsmCardVariant enum (elevated, outlined, filled)
  - [ ] Add const constructor with super.key
  - [ ] Remove all hardcoded styling
  - [ ] Use theme.cardTheme for base styling
  - [ ] Add RepaintBoundary for performance
  - [ ] Create specialized cards: FsmCard.workOrder(), .stats(), .list()
  - **Files**: `lib/core/widgets/cards/fsm_card.dart`
  - _Requirements: 2.1, 2.2, Performance optimization_

- [ ] 2.2.2 Refactor specialized card components
  - [ ] Update fsm_list_card.dart to use DesignTokens and FsmCard
  - [ ] Update fsm_stats_card.dart to use DesignTokens and FsmCard
  - [ ] Ensure const constructors
  - [ ] Add RepaintBoundary where appropriate
  - **Files**: `lib/core/widgets/cards/fsm_list_card.dart`, `fsm_stats_card.dart`
  - _Requirements: 2.1, 2.2, Performance optimization_

### 2.3 Inputs (8 files)

- [ ] 2.3.1 Refactor search and filter components
  - [ ] Update fsm_search_bar.dart to use DesignTokens
  - [ ] Update fsm_filter_chip_group.dart to use DesignTokens
  - [ ] Remove hardcoded Colors, spacing, sizes
  - [ ] Use theme.inputDecorationTheme
  - [ ] Use theme.chipTheme
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/inputs/fsm_search_bar.dart`, `fsm_filter_chip_group.dart`
  - _Requirements: 2.1, 3.2_

- [ ] 2.3.2 Refactor form input widgets (6 files)
  - [ ] Update all widgets in lib/core/widgets/form/ to use DesignTokens
  - [ ] Remove hardcoded styling from reactive form components
  - [ ] Use theme.inputDecorationTheme consistently
  - [ ] Ensure const constructors where applicable
  - **Files**: All files in `lib/core/widgets/form/`
  - _Requirements: 2.1, 3.2_

### 2.4 Lists (6 files)

- [ ] 2.4.1 Refactor list components
  - [ ] Update fsm_list_item.dart to use DesignTokens
  - [ ] Update fsm_lazy_loading_list.dart to use DesignTokens
  - [ ] Remove hardcoded styling
  - [ ] Ensure ListView.builder for dynamic lists
  - [ ] Add RepaintBoundary to list items
  - [ ] Use method references instead of anonymous functions
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/lists/fsm_list_item.dart`, `fsm_lazy_loading_list.dart`
  - _Requirements: 2.1, 2.2, Performance optimization_

### 2.5 Navigation (7 files)

- [ ] 2.5.1 Refactor navigation components
  - [ ] Update fsm_drawer.dart to use DesignTokens
  - [ ] Update fsm_tab_bar.dart to use DesignTokens
  - [ ] Update fsm_bottom_sheet.dart to use DesignTokens
  - [ ] Remove hardcoded styling
  - [ ] Use theme configuration
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/navigation/fsm_drawer.dart`, `fsm_tab_bar.dart`, `fsm_bottom_sheet.dart`
  - _Requirements: 2.1, 3.2_

### 2.6 States (5 files)

- [ ] 2.6.1 Consolidate state components
  - [ ] Merge root fsm_empty_state.dart with states/fsm_empty_state.dart
  - [ ] Create unified FsmEmptyState component
  - [ ] Update fsm_error_state.dart to use DesignTokens
  - [ ] Update fsm_loading_indicator.dart to use DesignTokens
  - [ ] Update fsm_shimmer_loading.dart to use DesignTokens
  - [ ] Remove hardcoded styling
  - [ ] Use theme colors consistently
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/states/`
  - _Requirements: 2.1, 2.5_

### 2.7 Layout (10 files)

- [ ] 2.7.1 Refactor layout components
  - [ ] Update fsm_section_header.dart to use DesignTokens
  - [ ] Update fsm_info_row.dart to use DesignTokens
  - [ ] Update fsm_metadata_row.dart to use DesignTokens
  - [ ] Remove hardcoded spacing, colors
  - [ ] Use theme.textTheme for typography
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/layout/fsm_section_header.dart`, `fsm_info_row.dart`, `fsm_metadata_row.dart`
  - _Requirements: 2.1, 3.2_

### 2.8 Feedback (9 files)

- [ ] 2.8.1 Refactor feedback components
  - [ ] Update fsm_status_badge.dart to use DesignTokens and context.fsmTheme
  - [ ] Update fsm_priority_indicator.dart to use DesignTokens and context.fsmTheme
  - [ ] Remove hardcoded status/priority colors
  - [ ] Use context.fsmTheme for domain colors
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/feedback/fsm_status_badge.dart`, `fsm_priority_indicator.dart`
  - _Requirements: 2.1, 2.5, 1.2_

### 2.9 Media (6 files)

- [ ] 2.9.1 Refactor media components
  - [ ] Update fsm_optimized_image.dart to use DesignTokens
  - [ ] Remove hardcoded dimensions
  - [ ] Use theme colors for placeholders
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/media/fsm_optimized_image.dart`
  - _Requirements: 2.1, 3.2_

### 2.10 Connectivity (8 files)

- [ ] 2.10.1 Consolidate connectivity components
  - [ ] Update fsm_offline_banner.dart to use DesignTokens
  - [ ] Update fsm_connectivity_indicator.dart to use DesignTokens and context.fsmTheme
  - [ ] Update fsm_sync_indicator.dart to use DesignTokens and context.fsmTheme
  - [ ] Use context.fsmTheme for sync state colors
  - [ ] Remove hardcoded styling
  - [ ] Ensure const constructors
  - **Files**: `lib/core/widgets/connectivity/`
  - _Requirements: 2.1, 1.2_

### 2.11 Update widget barrel exports

- [ ] 2.11.1 Reorganize widgets.dart barrel file
  - [ ] Remove exports for deleted/merged widgets
  - [ ] Add exports for all refactored components organized by category
  - [ ] Ensure single canonical export per component
  - [ ] Remove duplicate exports
  - **File**: `lib/core/widgets/widgets.dart`
  - _Requirements: 2.2, 2.3, 8.4_

---

## Phase 3: Presentation Layer Migration

### 3.1 Work Orders Feature (Priority 1)

- [ ] 3.1.1 Refactor dashboard_page.dart (650 lines → <300)
  - [ ] Extract FilterBar widget to widgets/dashboard/filter_bar.dart
  - [ ] Extract StatsCards widget to widgets/dashboard/stats_cards.dart
  - [ ] Extract WorkOrderList widget to widgets/dashboard/work_order_list.dart
  - [ ] Extract FAB to widgets/dashboard/dashboard_fab.dart
  - [ ] Update BLoC integration with property-based buildWhen
  - [ ] Replace all hardcoded Colors with theme references
  - [ ] Replace all EdgeInsets with REdgeInsets + DesignTokens
  - [ ] Replace all SizedBox with DesignTokens helpers
  - [ ] Replace all .w/.h/.sp with DesignTokens + extensions
  - [ ] Use method references instead of anonymous functions
  - [ ] Verify page is <300 lines after extraction
  - **Files**: `lib/features/work_orders/presentation/pages/dashboard_page.dart`, `widgets/dashboard/`
  - _Requirements: 4.1, 4.2, 4.4, 5.1, 5.2_

- [ ] 3.1.2 Refactor work_order_details_page.dart (642 lines → <300)
  - [ ] Extract HeaderSection widget to widgets/details/header_section.dart
  - [ ] Extract StatusTimeline widget to widgets/details/status_timeline.dart
  - [ ] Extract PartsSection widget to widgets/details/parts_section.dart
  - [ ] Extract ActionsBar widget to widgets/details/actions_bar.dart
  - [ ] Update BLoC integration with property-based buildWhen
  - [ ] Replace all hardcoded styling with theme/token references
  - [ ] Use method references instead of anonymous functions
  - [ ] Verify page is <300 lines after extraction
  - **Files**: `lib/features/work_orders/presentation/pages/work_order_details_page.dart`, `widgets/details/`
  - _Requirements: 4.1, 4.2, 4.4, 5.1, 5.2_

- [ ] 3.1.3 Fix work_order_card.dart styling violations
  - [ ] Replace hardcoded values at lines 56, 63, 75, 80
  - [ ] Use DesignTokens for all spacing and dimensions
  - [ ] Use context.fsmTheme for priority/status colors
  - [ ] Use theme.textTheme for typography
  - [ ] Add RepaintBoundary for performance
  - [ ] Ensure const constructor
  - **File**: `lib/features/work_orders/presentation/widgets/work_order_card.dart`
  - _Requirements: 1.1, 1.2, 3.2, Performance optimization_

- [ ] 3.1.4 Update all work_orders BLoCs to property-based buildWhen
  - [ ] Replace runtimeType comparisons with property comparisons
  - [ ] Use BlocConsumer where both builder and listener are needed
  - [ ] Add listenWhen conditions to prevent unnecessary callbacks
  - [ ] Use BlocSelector for fine-grained rebuilds
  - [ ] Use method references instead of anonymous functions
  - **Files**: All BLoC files in `lib/features/work_orders/presentation/blocs/`
  - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5_

### 3.2 Documents Feature (Priority 2)

- [ ] 3.2.1 Refactor documents_page.dart (468 lines → <300)
  - [ ] Extract DocumentFilters widget
  - [ ] Extract DocumentGrid widget
  - [ ] Extract UploadFAB widget
  - [ ] Update BLoC integration with property-based buildWhen
  - [ ] Replace all hardcoded styling
  - [ ] Verify page is <300 lines
  - **Files**: `lib/features/documents/presentation/pages/documents_page.dart`, `widgets/`
  - _Requirements: 4.1, 4.2, 4.4_

- [ ] 3.2.2 Update documents BLoCs
  - [ ] Replace runtimeType with property-based buildWhen
  - [ ] Add proper listenWhen conditions
  - [ ] Use method references
  - **Files**: `lib/features/documents/presentation/blocs/`
  - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5_

### 3.3 Parts Feature (Priority 3)

- [ ] 3.3.1 Refactor parts pages
  - [ ] Apply composition pattern to all pages >300 lines
  - [ ] Update BLoC integration patterns
  - [ ] Replace all hardcoded styling
  - **Files**: `lib/features/parts/presentation/pages/`
  - _Requirements: 4.1, 4.2, 4.4_

- [ ] 3.3.2 Update parts BLoCs
  - [ ] Apply property-based buildWhen patterns
  - [ ] Add listenWhen conditions
  - **Files**: `lib/features/parts/presentation/blocs/`
  - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5_

### 3.4 Calendar Feature (Priority 4)

- [ ] 3.4.1 Refactor calendar pages
  - [ ] Apply composition pattern
  - [ ] Update BLoC integration
  - [ ] Replace hardcoded styling
  - **Files**: `lib/features/calendar/presentation/pages/`
  - _Requirements: 4.1, 4.2, 4.4_

- [ ] 3.4.2 Update calendar BLoCs
  - [ ] Apply BLoC best practices
  - **Files**: `lib/features/calendar/presentation/blocs/`
  - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5_

### 3.5 Profile Feature (Priority 5)

- [ ] 3.5.1 Refactor profile pages
  - [ ] Apply design system patterns
  - [ ] Update BLoC integration
  - **Files**: `lib/features/profile/presentation/pages/`
  - _Requirements: 4.1, 4.2, 4.4_

- [ ] 3.5.2 Update profile BLoCs
  - [ ] Apply BLoC best practices
  - **Files**: `lib/features/profile/presentation/blocs/`
  - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5_

### 3.6 Systematic Violation Fixes (All Features)

- [ ] 3.6.1 Fix Colors violations in parts feature
  - [ ] Fix `lib/features/parts/presentation/widgets/quick_stats_bar.dart` - replace AppColors.black, AppColors.grey200
  - [ ] Fix `lib/features/parts/presentation/widgets/parts_search_bar.dart` - replace Colors.white, Colors.grey, Colors.black87
  - [ ] Fix `lib/features/parts/presentation/widgets/inventory_indicator.dart` - replace Colors.grey, Colors.red, Colors.orange, Colors.green
  - [ ] Fix `lib/features/parts/presentation/pages/part_details_page.dart` - replace Colors.grey, Colors.black87, Colors.blue, Colors.green
  - [ ] Use theme.colorScheme and context.fsmTheme for all color references
  - **Files**: Parts feature presentation widgets and pages
  - _Requirements: 1.1, 4.3_

- [ ] 3.6.2 Fix Colors violations in debug feature
  - [ ] Fix `lib/features/debug/presentation/pages/developer_options_page.dart` - replace Colors.green, Colors.orange, Colors.red, Colors.blue
  - [ ] Use theme.colorScheme and context.fsmTheme for semantic colors
  - **Files**: Debug feature presentation pages
  - _Requirements: 1.1, 4.3_

- [ ] 3.6.3 Replace EdgeInsets violations across codebase
  - [ ] Search for remaining EdgeInsets.all, EdgeInsets.symmetric, EdgeInsets.only usage
  - [ ] Replace with REdgeInsets and DesignTokens
  - [ ] Focus on presentation layer files first
  - **Files**: All files with EdgeInsets violations
  - _Requirements: 3.2, 4.3_

- [ ] 3.6.4 Replace SizedBox violations across codebase
  - [ ] Search for SizedBox with hardcoded width/height values
  - [ ] Replace with RSizedBox and DesignTokens spacing helpers
  - [ ] Use DesignTokens.verticalSpace* and horizontalSpace* helpers
  - **Files**: All files with SizedBox violations
  - _Requirements: 3.2, 4.3_

---

## Phase 4: BLoC Optimization & Performance

### 4.1 Create BLoC Helper Patterns

- [ ] 4.1.1 Create BlocBuildConditions mixin
  - [ ] Implement buildWhenLoading helper
  - [ ] Implement buildWhenData helper
  - [ ] Implement buildWhenError helper
  - [ ] Implement buildWhenStatus helper
  - [ ] Document usage patterns
  - **File**: `lib/core/blocs/bloc_build_conditions.dart` (new)
  - _Requirements: 5.1, 5.2, 5.3, 5.4_

- [ ] 4.1.2 Create BlocListenerHelpers class
  - [ ] Implement showSnackBarOnError static method
  - [ ] Implement navigateOnSuccess static method
  - [ ] Implement showDialogOnState static method
  - [ ] Document usage patterns
  - **File**: `lib/core/blocs/bloc_listener_helpers.dart` (new)
  - _Requirements: 5.1, 5.5_

### 4.2 Performance Optimizations

- [ ] 4.2.1 Add const constructors to all custom widgets
  - [ ] Audit all widgets in lib/core/widgets/
  - [ ] Add const constructors with super.key
  - [ ] Verify const usage throughout codebase
  - **Files**: All widgets in `lib/core/widgets/`
  - _Requirements: Performance optimization_

- [ ] 4.2.2 Add RepaintBoundary to complex components
  - [ ] Add to list items (work order cards, document cards, part cards)
  - [ ] Add to complex cards with multiple children
  - [ ] Document when to use RepaintBoundary
  - **Files**: Card and list components
  - _Requirements: Performance optimization_

- [ ] 4.2.3 Replace anonymous functions with method references
  - [ ] Audit all pages and widgets
  - [ ] Replace onPressed: () => action with onPressed: _handleAction
  - [ ] Create handler methods for all callbacks
  - **Files**: All presentation layer files
  - _Requirements: Performance optimization_

---

## Phase 5: Testing & Quality Assurance

### 5.1 Golden Tests

- [ ] 5.1.1 Create golden tests for key pages
  - [ ] Dashboard page (light theme)
  - [ ] Dashboard page (dark theme)
  - [ ] Work order details page (light theme)
  - [ ] Work order details page (dark theme)
  - [ ] Documents page (light theme)
  - [ ] Documents page (dark theme)
  - **Directory**: `test/golden/`
  - _Requirements: 8.1, 8.2_

- [ ] 5.1.2 Create responsive breakpoint tests
  - [ ] Test mobile layout (390x844)
  - [ ] Test tablet layout (768x1024)
  - [ ] Test desktop layout (1920x1080)
  - **Directory**: `test/golden/responsive/`
  - _Requirements: 8.2_

### 5.2 Widget Tests

- [ ] 5.2.1 Create BLoC optimization tests
  - [ ] Test buildWhen prevents unnecessary rebuilds
  - [ ] Test listenWhen prevents unnecessary callbacks
  - [ ] Test BlocSelector fine-grained rebuilds
  - [ ] Measure build count with vs without optimization
  - **Directory**: `test/widget/bloc/`
  - _Requirements: 8.3_

- [ ] 5.2.2 Create component behavior tests
  - [ ] Test FsmButton variants
  - [ ] Test FsmCard variants
  - [ ] Test theme switching
  - [ ] Test accessibility (minimum touch targets)
  - **Directory**: `test/widget/components/`
  - _Requirements: 8.3, 3.6_

### 5.3 Test Helper Updates

- [ ] 5.3.1 Update test helpers for ScreenUtil 5.9.3+
  - [ ] Add ScreenUtilInit wrapper to testableWidget helper
  - [ ] Add await tester.pumpAndSettle() to all tests
  - [ ] Add tester.view.reset to tearDown
  - [ ] Update test documentation
  - **File**: `test/helpers/widget_test_helpers.dart`
  - _Requirements: 10.8_

### 5.4 CI Integration

- [ ] 5.4.1 Verify design_system_checks.yml workflow
  - [ ] Test hardcoded Colors check
  - [ ] Test raw EdgeInsets check
  - [ ] Test SizedBox violations check
  - [ ] Test direct .w/.h/.sp check
  - [ ] Test page line count check
  - [ ] Test const constructor check
  - [ ] Test anonymous function check
  - [ ] Ensure workflow fails on violations
  - **File**: `.github/workflows/design_system_checks.yml`
  - _Requirements: 8.5, 1.7_

- [ ] 5.4.2 Create code_generation_check.yml workflow
  - [ ] Check for uncommitted .g.dart files
  - [ ] Check for uncommitted .freezed.dart files
  - [ ] Check for uncommitted .gr.dart files
  - [ ] Fail build if generated code is out of sync
  - [ ] Document resolution steps
  - **File**: `.github/workflows/code_generation_check.yml`
  - _Requirements: 10.3, 10.4, 10.5_

---

## Phase 6: Documentation & Migration Guide

### 6.1 Create MIGRATION.md

- [ ] 6.1.1 Document theme access patterns
  - [ ] Before/after: Colors → theme.colorScheme
  - [ ] Before/after: AppColors → context.fsmTheme
  - [ ] Before/after: AppDimensions → DesignTokens
  - [ ] Before/after: AppTypography → theme.textTheme
  - **File**: `MIGRATION.md` (new)
  - _Requirements: 7.1, 7.2_

- [ ] 6.1.2 Document responsive design patterns
  - [ ] EdgeInsets → REdgeInsets with DesignTokens
  - [ ] SizedBox → RSizedBox or DesignTokens helpers
  - [ ] Direct .w/.h/.sp → DesignTokens + extensions
  - [ ] Breakpoint usage examples
  - **File**: `MIGRATION.md`
  - _Requirements: 7.1, 7.3_

- [ ] 6.1.3 Document component replacements
  - [ ] CustomButton → FsmButton
  - [ ] List of all deprecated components
  - [ ] Widget categories and usage
  - **File**: `MIGRATION.md`
  - _Requirements: 7.1, 7.4_

- [ ] 6.1.4 Document BLoC patterns
  - [ ] Property-based buildWhen examples
  - [ ] BlocConsumer usage
  - [ ] BlocSelector usage
  - [ ] BlocListener for side effects
  - [ ] Common anti-patterns to avoid
  - **File**: `MIGRATION.md`
  - _Requirements: 7.1, 5.1, 5.2, 5.3, 5.4, 5.5_

- [ ] 6.1.5 Document performance optimization patterns
  - [ ] Const constructors with super.key
  - [ ] RepaintBoundary usage
  - [ ] Method references vs anonymous functions
  - [ ] ListView.builder for lists
  - **File**: `MIGRATION.md`
  - _Requirements: 7.1, Performance optimization_

- [ ] 6.1.6 Document code generation workflow
  - [ ] build_runner commands
  - [ ] Execution order (freezed → json → hive)
  - [ ] Common pitfalls
  - [ ] Troubleshooting guide
  - [ ] CI integration
  - **File**: `MIGRATION.md`
  - _Requirements: 7.1, 10.3_

### 6.2 Update Code Comments

- [ ] 6.2.1 Add deprecation warnings
  - [ ] Mark AppDimensions as @Deprecated
  - [ ] Mark AppTypography as @Deprecated
  - [ ] Mark AppColors as @Deprecated
  - [ ] Add deprecation message with alternative
  - **Files**: Deprecated files
  - _Requirements: 7.2_

- [ ] 6.2.2 Document new design tokens
  - [ ] Add documentation comments to DesignTokens class
  - [ ] Add usage examples in comments
  - [ ] Add references to MIGRATION.md
  - **File**: `lib/core/theme/design_tokens.dart`
  - _Requirements: 7.4_

### 6.3 Create Design System Showcase

- [ ] 6.3.1 Create component showcase page (optional)
  - [ ] Showcase all button variants
  - [ ] Showcase all card variants
  - [ ] Showcase typography scale
  - [ ] Showcase spacing scale
  - [ ] Showcase color palette
  - [ ] Add to debug feature
  - **File**: `lib/features/debug/presentation/pages/design_system_showcase_page.dart` (new)
  - _Requirements: Documentation, 7.4_

---

## Phase 7: Cleanup & Final Validation

### 7.1 Delete Deprecated Files

- [ ] 7.1.1 Mark deprecated theme files with @Deprecated annotation
  - [ ] Add @Deprecated annotation to lib/core/theme/app_dimensions.dart
  - [ ] Add @Deprecated annotation to lib/core/theme/app_text_styles.dart (if exists)
  - [ ] Keep lib/core/theme/app_colors.dart as it's still used by FSMThemeExtension
  - [ ] Update imports to use DesignTokens and theme.textTheme
  - **Files**: Deprecated theme files
  - _Requirements: 2.4, 7.2_

- [ ] 7.1.2 Remove deprecated widgets after migration
  - [ ] Delete lib/core/widgets/custom_button.dart after FsmButton migration
  - [ ] Remove duplicate implementations between root and subfolder widgets
  - [ ] Update all imports to use consolidated widget paths
  - **Files**: Merged/consolidated widgets
  - _Requirements: 2.4, 7.2_

### 7.2 Final Audit

- [ ] 7.2.1 Run static analysis
  - [ ] Run dart analyze
  - [ ] Fix all analysis errors
  - [ ] Fix all analysis warnings
  - [ ] Verify zero linting issues
  - _Requirements: 4.5_

- [ ] 7.2.2 Run all tests
  - [ ] Run flutter test
  - [ ] Verify all tests pass
  - [ ] Verify golden tests pass
  - [ ] Check test coverage
  - _Requirements: 8.3_

- [ ] 7.2.3 Verify CI workflows
  - [ ] Push to branch
  - [ ] Verify design_system_checks.yml passes
  - [ ] Verify code_generation_check.yml passes
  - [ ] Verify zero violations
  - _Requirements: 8.5, 10.5_

- [ ] 7.2.4 Manual testing
  - [ ] Test dashboard page
  - [ ] Test work order details page
  - [ ] Test documents page
  - [ ] Test parts feature
  - [ ] Test calendar feature
  - [ ] Test profile feature
  - [ ] Test theme switching (light/dark)
  - [ ] Test on different screen sizes
  - [ ] Verify no ScreenUtil crashes
  - _Requirements: 4.5_

### 7.3 Validate Success Criteria

- [ ] 7.3.1 Zero CI violations
  - [ ] Run design_system_checks.yml workflow and verify it passes
  - [ ] No hardcoded Colors (except Colors.transparent)
  - [ ] No raw EdgeInsets (use REdgeInsets)
  - [ ] No hardcoded SizedBox (use RSizedBox or DesignTokens helpers)
  - [ ] All pages <300 lines
  - [ ] All widgets have const constructors
  - [ ] No anonymous functions in build methods
  - _Requirements: 1.1, 3.2, 4.1, 4.4_

- [ ] 7.3.2 Single source of truth
  - [ ] All spacing from DesignTokens
  - [ ] All colors from theme.colorScheme or context.fsmTheme
  - [ ] All typography from theme.textTheme
  - [ ] No duplicate widget implementations
  - _Requirements: 1.1, 1.2, 1.5_

- [ ] 7.3.3 Performance optimizations
  - [ ] All custom widgets use const constructors with super.key
  - [ ] Complex list items use RepaintBoundary
  - [ ] All callbacks use method references instead of anonymous functions
  - [ ] All lists use ListView.builder for lazy loading
  - _Requirements: Performance optimization_

- [ ] 7.3.4 BLoC best practices
  - [ ] All BLoCs use property-based buildWhen conditions
  - [ ] No runtimeType comparisons in buildWhen
  - [ ] All side effects use BlocListener/BlocConsumer
  - [ ] Fine-grained rebuilds use BlocSelector where appropriate
  - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5_

---

## Phase 8: Code Generation Validation

### 8.1 Verify Build Configuration

- [ ] 8.1.1 Validate build.yaml
  - [ ] Verify freezed options (union_key, union_value_case, map, copyWith)
  - [ ] Verify hive_ce_generator options (type_adapter_suffix)
  - [ ] Verify no syntax errors
  - **File**: `build.yaml`
  - _Requirements: 10.1, 10.2_

### 8.2 Run Code Generation

- [ ] 8.2.1 Execute build_runner
  - [ ] Run dart run build_runner clean
  - [ ] Run dart run build_runner build --delete-conflicting-outputs
  - [ ] Verify no errors
  - [ ] Verify all .g.dart files generated
  - [ ] Verify all .freezed.dart files generated
  - [ ] Verify all .gr.dart files generated
  - _Requirements: 10.1, 10.2, 10.3, 10.4_

- [ ] 8.2.2 Validate generated code
  - [ ] Check Hive adapters have correct type IDs
  - [ ] Check freezed models have copyWith methods
  - [ ] Check freezed models have map methods
  - [ ] Check JSON serialization works
  - [ ] Check no stale files remain
  - _Requirements: 10.4_

### 8.3 ScreenUtil Integration Validation

- [ ] 8.3.1 Verify ScreenUtil configuration
  - [ ] Confirm designSize is Size(390, 844)
  - [ ] Confirm minTextAdapt: true
  - [ ] Confirm splitScreenMode: true
  - [ ] Confirm MediaQuery builder present
  - **File**: `lib/app.dart`
  - _Requirements: 10.6, 10.7_

- [ ] 8.3.2 Test REdgeInsets and RSizedBox
  - [ ] Verify const constructors work
  - [ ] Test responsive scaling
  - [ ] Test in widget tests with pumpAndSettle
  - _Requirements: 10.8_

---

## Success Criteria Checklist

✅ **Phase 1 Complete**: Theme system and design tokens established
⬜ **Zero CI Violations**: All workflows pass with no hardcoded styling
⬜ **All Pages <300 Lines**: Dashboard, details, documents refactored
⬜ **Widget Consolidation**: Single canonical implementation per component
⬜ **Single Source of Truth**: DesignTokens for spacing, theme for colors
⬜ **BLoC Optimization**: Property-based buildWhen, no runtimeType
⬜ **Performance Optimized**: Const constructors, RepaintBoundary, method refs
⬜ **Testing Complete**: Golden tests, widget tests, BLoC tests pass
⬜ **Documentation Complete**: MIGRATION.md with comprehensive examples

## Next Priority Tasks

**Immediate (Phase 2):**
1. Create unified FsmButton component (Task 2.1.1)
2. Fix Colors violations in parts feature (Task 3.6.1)
3. Fix Colors violations in debug feature (Task 3.6.2)

**Short-term (Phase 3):**
1. Refactor work orders dashboard page (Task 3.1.1)
2. Replace EdgeInsets violations (Task 3.6.3)
3. Replace SizedBox violations (Task 3.6.4)ve examples
⬜ **Zero Crashes**: App runs smoothly without ScreenUtil errors

---

## Estimated Timeline

- **Phase 1**: ✅ Completed (4 days)
- **Phase 2**: Widget consolidation (5-6 days)
- **Phase 3**: Presentation layer migration (7-8 days)
- **Phase 4**: BLoC optimization (2-3 days)
- **Phase 5**: Testing (3-4 days)
- **Phase 6**: Documentation (2 days)
- **Phase 7**: Cleanup & validation (2 days)
- **Phase 8**: Final validation (1 day)

**Total**: 22-28 days (4-5 weeks)

---

## Common Migration Patterns Quick Reference

### Colors
```dart
// ❌ BEFORE
Colors.blue
// ✅ AFTER
Theme.of(context).colorScheme.primary
context.fsmTheme.statusPending  // for domain colors
```

### Spacing
```dart
// ❌ BEFORE
EdgeInsets.all(16)
SizedBox(height: 8)
// ✅ AFTER
REdgeInsets.all(DesignTokens.space4)
DesignTokens.verticalSpaceSmall
```

### Typography
```dart
// ❌ BEFORE
TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)
// ✅ AFTER
Theme.of(context).textTheme.bodyMedium
```

### BLoC
```dart
// ❌ BEFORE
buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType
// ✅ AFTER
buildWhen: (prev, curr) => prev.count != curr.count
```

### Performance
```dart
// ❌ BEFORE
class MyWidget extends StatelessWidget {
  Widget build(context) => ElevatedButton(
    onPressed: () => doSomething(),
  );
}
// ✅ AFTER
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  Widget build(context) => ElevatedButton(
    onPressed: _handlePress,
  );
  void _handlePress() => doSomething();
}
```

---

## References

- **Spec Documents**: `.kiro/specs/flutter-design-system-refactor/`
- **Design Details**: `.kiro/specs/flutter-design-system-refactor/design.md`
- **Requirements**: `.kiro/specs/flutter-design-system-refactor/requirements.md`
- **This File**: `.kiro/specs/flutter-design-system-refactor/tasks.md`
