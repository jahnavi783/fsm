### 1. Create BLoC Optimization Infrastructure

- [x] 1.1 Create BlocBuildConditions mixin for reusable buildWhen patterns
  - Create `lib/core/blocs/bloc_build_conditions.dart` with common buildWhen methods
  - Implement property-based comparison patterns (not runtimeType)
  - Add specific conditions for WorkOrderState, DocumentState, etc.
  - _Requirements: 5.5, 5.4_
  - _Status: Complete - comprehensive mixin with work order, document, parts, and profile conditions_

- [x] 1.2 Create BLoC helper utilities for common patterns
  - Create `lib/core/blocs/bloc_listener_helpers.dart` with static helper methods
  - Implement showSnackBarOnError, navigateOnSuccess patterns
  - Add MultiBlocListener configuration helpers
  - _Requirements: 5.2, 5.3_
  - _Status: Complete - comprehensive helpers for snackbars, navigation, dialogs, auth, connectivity, and sync_

### 2. Fix Hardcoded Styling Violations

- [ ] 2.1 Eliminate hardcoded Colors usage in presentation layer
  - Replace all `Colors.red`, `Colors.blue`, etc. with theme-based colors in `lib/features/*/presentation/`
  - Focus on parts pages (part_card.dart, part_details_page.dart) which have extensive violations
  - Update permission widgets to use FSMThemeExtension colors
  - Fix debug page color violations (keep only for debug-specific UI)
  - Allow only `Colors.transparent` as exception
  - _Requirements: 1.1, 1.2_

- [ ] 2.2 Replace raw EdgeInsets with REdgeInsets and design tokens
  - Convert all `EdgeInsets.all()`, `EdgeInsets.symmetric()` to `REdgeInsets` equivalents
  - Replace hardcoded padding values with `DesignTokens.space*` constants
  - Update all presentation layer files to use responsive padding
  - Focus on high-violation files: debug pages, parts widgets, profile widgets, work order pages
  - _Requirements: 1.8, 3.2_

- [ ] 2.3 Replace hardcoded SizedBox with RSizedBox and design token helpers
  - Convert `SizedBox(height: X, width: Y)` to `RSizedBox` or `DesignTokens.verticalSpace*`
  - Use design token spacing helpers where appropriate
  - Ensure const constructor compatibility
  - _Requirements: 1.8, 3.2_

### 3. Deprecate Legacy Theme Classes

- [x] 3.1 Mark AppDimensions and AppColors as deprecated
  - DesignTokens class already exists and is comprehensive
  - FSMThemeExtension already provides strongly-typed domain colors
  - AppColors and AppDimensions marked with @Deprecated annotations
  - _Requirements: 1.1, 1.2_
  - _Status: Complete - deprecation annotations added with migration examples_

- [ ] 3.2 Update import statements to use design system
  - Replace `app_colors.dart` and `app_dimensions.dart` imports with `widgets.dart` barrel
  - Ensure all presentation layer files import from design system
  - _Requirements: 8.4_

---

## Phase 2: Widget Library Consolidation

### 4. Consolidate Duplicate Button Components

- [ ] 4.1 Audit and merge duplicate button implementations
  - Current `fsm_button.dart` contains `CustomButton` class (not FsmButton)
  - Create proper `FsmButton` class with Material 3 composition pattern
  - Consolidate with existing custom button implementations
  - Ensure const constructors with super.key parameter
  - _Requirements: 2.1, 2.4, 9.1_

- [ ] 4.2 Update all button usage to unified FsmButton
  - Replace custom button widgets throughout presentation layer
  - Ensure consistent button styling and behavior
  - Add RepaintBoundary for performance optimization
  - _Requirements: 2.1, 9.3_

### 5. Consolidate State and Error Components

- [x] 5.1 Merge duplicate empty state implementations
  - FSMEmptyState already exists in widgets library
  - Dashboard states and other empty state widgets should use this unified component
  - _Requirements: 2.5_

- [x] 5.2 Merge duplicate error handling components
  - Error boundary components already exist and are organized
  - ErrorBoundaryService integration is already in place
  - _Requirements: 2.5_

### 6. Optimize List and Card Components

- [ ] 6.1 Ensure ListView.builder usage for all dynamic lists
  - Audit all list implementations for lazy loading
  - Replace Column with children for ListView.builder where appropriate
  - Add RepaintBoundary to complex list items
  - _Requirements: 9.5, 9.3_

- [ ] 6.2 Add performance optimizations to card components
  - Current FSMCard already has good structure but needs RepaintBoundary
  - Ensure const constructors throughout card hierarchy
  - Optimize card rendering for large lists
  - _Requirements: 9.3, 9.1_

---

## Phase 3: Page Refactoring and BLoC Integration

### 7. Refactor Pages to Use Design System

- [ ] 7.1 Refactor work orders pages
  - Dashboard page is already well-structured but needs hardcoded styling cleanup
  - Apply BlocBuildConditions mixin for optimized rebuilds
  - Replace hardcoded styling with design tokens
  - Ensure pages stay under 300 lines
  - _Requirements: 4.1, 4.4, 5.5_

- [ ] 7.2 Refactor documents pages
  - Update documents list and viewer pages
  - Apply consistent theming and responsive design
  - Implement proper BLoC optimization patterns
  - Extract complex sections to reusable widgets
  - _Requirements: 4.1, 4.4, 5.5_

- [ ] 7.3 Refactor parts and profile pages
  - Parts pages have significant hardcoded styling violations
  - Apply design system components consistently
  - Optimize BLoC integration with property-based buildWhen
  - Ensure accessibility compliance
  - _Requirements: 4.1, 4.4, 5.5_

### 8. Implement Method References Pattern

- [ ] 8.1 Replace anonymous functions with method references
  - Found extensive usage of `onPressed: () => action()` pattern
  - Convert to `onPressed: _handleAction` pattern
  - Create private methods for all button handlers
  - Ensure proper context access in method references
  - _Requirements: 9.4_

- [ ] 8.2 Optimize BLoC event dispatching
  - Replace anonymous functions in BLoC event calls
  - Use method references for consistent event handling
  - Implement proper error handling in event methods
  - _Requirements: 9.4, 5.1_

---

## Phase 4: Navigation and Deep Linking

### 9. Enhance Auto Route Integration

- [ ] 9.1 Implement navigation BLoC listeners
  - Create navigation listeners for BLoC state changes
  - Integrate Auto Route with existing BLoC patterns
  - Add deep linking support for work orders and documents
  - _Requirements: 5.2, 5.3_

- [ ] 9.2 Add route-based navigation helpers
  - Extend AppRouterExtension with additional navigation methods
  - Implement navigation state management
  - Add navigation error handling and fallbacks
  - _Requirements: 5.2_

### 10. Implement Responsive Layout Patterns

- [x] 10.1 Add responsive breakpoint helpers
  - DesignTokens already includes comprehensive breakpoint helpers
  - Mobile, tablet, and desktop breakpoint constants are defined
  - Helper methods for responsive checks are implemented
  - _Requirements: 3.5, 3.6_

- [ ] 10.2 Optimize responsive image and media components
  - Update FsmOptimizedImage for responsive behavior
  - Implement proper aspect ratios and sizing
  - Add performance optimizations for image loading
  - _Requirements: 3.5, 9.3_

---

## Phase 5: Testing and Quality Assurance

### 11. Implement Testing Infrastructure

- [ ]* 11.1 Create golden tests for key pages
  - Implement golden tests for dashboard, work order details, documents pages
  - Test both light and dark theme variants
  - Add responsive breakpoint testing
  - _Requirements: 8.1_

- [ ]* 11.2 Add widget tests for BLoC optimization
  - Test BlocBuildConditions mixin functionality
  - Verify buildWhen optimization with property-based comparisons
  - Test BlocSelector and context.select usage
  - _Requirements: 8.3_

- [ ]* 11.3 Implement accessibility testing
  - Test semantic labels and touch target sizes
  - Verify color contrast compliance
  - Test screen reader compatibility
  - _Requirements: 8.3, 3.6_

### 12. Create CI/CD Quality Checks

- [ ]* 12.1 Implement lint rules for design system compliance
  - Create CI checks for hardcoded Colors usage
  - Add checks for raw EdgeInsets and SizedBox usage
  - Verify import hygiene (widgets.dart barrel usage)
  - _Requirements: 1.7, 8.4_

- [ ]* 12.2 Add performance and code quality checks
  - Check page line count limits (300 lines max)
  - Verify const constructor usage in custom widgets
  - Check for anonymous function usage in build methods
  - _Requirements: 4.1, 9.1, 9.4_

### 13. Documentation and Migration Guide

- [ ]* 13.1 Create comprehensive migration documentation
  - Document all component replacements and usage patterns
  - Provide before/after examples for common UI patterns
  - Explain new design token system and responsive helpers
  - _Requirements: 7.1, 7.2, 7.3_

- [ ]* 13.2 Update development guidelines
  - Document BLoC optimization patterns and best practices
  - Create widget development guidelines
  - Add performance optimization recommendations
  - _Requirements: 7.4, 7.5_

---

## Phase 6: Build System and Code Generation

### 14. Optimize Build Configuration

- [ ]* 14.1 Update build.yaml for optimal code generation
  - Ensure proper freezed configuration with map: true, copyWith: true
  - Configure hive_ce_generator with consistent naming
  - Document mandatory build_runner execution workflow
  - _Requirements: 10.1, 10.2, 10.3_

- [x] 14.2 Implement ScreenUtil 5.9.3+ patterns
  - DesignTokens already uses proper REdgeInsets and RSizedBox patterns
  - Const constructor support is implemented
  - ScreenUtilInit configuration verified in app.dart with Size(390, 844)
  - _Requirements: 1.6, 1.8, 10.6, 10.7_
  - _Status: Complete - properly configured with minTextAdapt and splitScreenMode_

### 15. Final Integration and Validation

- [ ]* 15.1 Comprehensive integration testing
  - Test complete user flows with new design system
  - Validate theme switching functionality
  - Test responsive behavior across screen sizes
  - _Requirements: 8.1, 8.3_

- [ ]* 15.2 Performance benchmarking and optimization
  - Measure app startup time and memory usage
  - Validate RepaintBoundary effectiveness
  - Test BLoC rebuild optimization impact
  - _Requirements: 9.3, 9.5_

---

## Notes

- **Optional Tasks**: Tasks marked with `*` are optional and focus on testing, documentation, and advanced optimizations
- **Dependencies**: Tasks should be executed in order within each phase, but phases can overlap
- **Validation**: Each task should be validated against the specific requirements listed
- **Performance**: Focus on minimal, functional implementations that meet requirements without over-engineering
- **Current State**: The codebase already has strong foundations with DesignTokens, FSMThemeExtension, and widget organization, but needs cleanup of hardcoded styling violations

## Completion Criteria

The refactor is complete when:
1. All hardcoded styling violations are eliminated from presentation layer
2. All pages use design system components and stay under 300 lines
3. BLoC patterns use property-based buildWhen conditions
4. Widget library has no duplicate implementations
5. CI checks pass for design system compliance
6. Core functionality maintains identical UX behavior