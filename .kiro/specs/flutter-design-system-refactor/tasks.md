# Implementation Plan

- [x] 1. Set up core design system infrastructure
- [x] 1.1 Create DesignTokens class with 8pt grid spacing system
  - Implement centralized spacing scale with const base values
  - Add responsive helpers using REdgeInsets and RSizedBox
  - Include icon sizes, border radius, and breakpoint constants
  - _Requirements: 1.3, 3.4, 3.5_

- [x] 1.2 Implement FSMThemeExtension with strongly-typed domain colors
  - Create compile-time safe domain color properties
  - Implement light and dark theme variants
  - Add proper copyWith and lerp methods for theme transitions
  - _Requirements: 1.2, 6.1, 6.4_

- [x] 1.3 Configure AppTheme with Material 3 integration
  - Set up component themes for all Material widgets
  - Configure responsive typography with flutter_screenutil
  - Integrate FSMThemeExtension with ThemeData
  - _Requirements: 1.4, 1.5, 6.3_

- [x] 1.4 Create BlocBuildConditions mixin for reusable buildWhen patterns
  - Implement property-based comparison patterns
  - Add specific conditions for WorkOrderState, DocumentState, PartsState
  - Provide common patterns like buildWhenData, buildWhenLoading
  - _Requirements: 5.4, 5.5_

- [x] 1.5 Create BLoC helper utilities for common patterns
  - Implement BlocListenerHelpers with static helper methods
  - Add showSnackBarOnError, navigateOnSuccess patterns
  - Create MultiBlocListener configuration helpers
  - _Requirements: 5.2, 5.3_

- [-] 2. Eliminate hardcoded styling violations


- [x] 2.1 Replace hardcoded Colors usage in presentation layer



  - Replace hardcoded Colors in work order widgets (Colors.white, Colors.grey, Colors.black)
  - Fix image preview dialog colors (Colors.black, Colors.white54, Colors.white70)
  - Update work order form sheet and action buttons to use theme colors
  - Replace hardcoded Colors in permission widgets and profile pages
  - Allow only Colors.transparent as exception
  - _Requirements: 1.1, 1.2_

- [x] 2.2 Replace hardcoded SizedBox with RSizedBox and design token helpers
  - Convert SizedBox usage to RSizedBox or DesignTokens.verticalSpace* helpers
  - Use design token spacing helpers where appropriate
  - Ensure const constructor compatibility
  - _Requirements: 1.8, 3.2_

- [x] 2.3 Replace raw EdgeInsets with REdgeInsets and design tokens


  - Convert EdgeInsets.symmetric/only/all usage in work order widgets to REdgeInsets
  - Replace hardcoded padding values with DesignTokens.space* constants
  - Focus on work order details, form sheets, image galleries, and timeline components
  - Update parts, profile, and documents pages to use responsive padding
  - _Requirements: 1.8, 3.2_



- [ ] 2.4 Mark AppDimensions and AppColors as deprecated
  - Add @Deprecated annotations to AppDimensions and AppColors classes
  - Update documentation to point to DesignTokens and FSMThemeExtension
  - Create migration guide comments in deprecated classes


  - _Requirements: 1.1, 1.2_

- [ ] 2.5 Update import statements to use design system
  - Replace app_colors.dart and app_dimensions.dart imports with theme system imports
  - Update FSMCard to use DesignTokens instead of AppDimensions
  - Ensure all presentation layer files import from design system
  - _Requirements: 8.4_

- [ ] 3. Consolidate widget library components
- [x] 3.1 Audit and merge duplicate button implementations
  - FsmButton class already exists with Material 3 composition pattern
  - Includes FsmIconButton for icon-only buttons
  - Has proper const constructors with super.key parameter
  - Supports variants (filled, outlined, text) and sizes (small, medium, large)
  - _Requirements: 2.1, 2.4, 9.1_

- [x] 3.2 Update all button usage to unified FsmButton
  - Replace ElevatedButton usage in work order widgets with FsmButton
  - Update action buttons in work order details and forms
  - Replace IconButton usage with FsmIconButton where appropriate
  - Ensure consistent button styling and behavior
  - _Requirements: 2.1, 9.3_

- [x] 3.3 Merge duplicate empty state implementations
  - FSMEmptyState already exists in widgets library
  - Dashboard states and other empty state widgets should use this unified component
  - _Requirements: 2.5_

- [ ] 3.4 Merge duplicate error handling components


  - Error boundary components already exist and are organized
  - ErrorBoundaryService integration is already in place
  - _Requirements: 2.5_

- [ ] 3.5 Organize widgets in functional categories
  - Ensure widgets are properly categorized in buttons/, cards/, states/, etc.
  - Verify single widgets.dart barrel export includes all components
  - Remove any remaining duplicate implementations
  - _Requirements: 2.2, 2.3_

- [ ] 4. Implement performance optimizations
- [ ] 4.1 Ensure ListView.builder usage for all dynamic lists
  - Audit work order list implementations for lazy loading
  - Check document and parts list implementations
  - Add RepaintBoundary to complex list items like WorkOrderListCard
  - _Requirements: 9.5, 9.3_

- [ ] 4.2 Add performance optimizations to card components
  - Update FSMCard to use DesignTokens instead of AppDimensions
  - Add RepaintBoundary to FSMCard implementation
  - Ensure const constructors throughout card hierarchy
  - Optimize WorkOrderListCard for large lists
  - _Requirements: 9.3, 9.1_

- [x] 4.3 Replace anonymous functions with method references





  - Convert onPressed: () => Navigator.of(context).pop() patterns to method references
  - Update work order form sheets, dialogs, and action buttons
  - Create private methods for all button handlers in pages and widgets
  - Ensure proper context access in method references
  - _Requirements: 9.4_

- [ ] 5. Refactor presentation layer pages
- [ ] 5.1 Refactor work orders pages
  - Apply BlocBuildConditions mixin for optimized rebuilds
  - Replace hardcoded styling with design tokens
  - Extract complex UI sections to reusable widgets
  - Ensure pages stay under 300 lines
  - _Requirements: 4.1, 4.2, 4.4, 5.5_

- [ ] 5.2 Refactor documents pages
  - Update documents list and viewer pages
  - Apply consistent theming and responsive design
  - Implement proper BLoC optimization patterns
  - Extract complex sections to reusable widgets
  - _Requirements: 4.1, 4.2, 4.4, 5.5_

- [ ] 5.3 Refactor parts and profile pages
  - Apply design system components consistently
  - Optimize BLoC integration with property-based buildWhen
  - Extract complex UI to presentation/widgets or core/widgets
  - Ensure accessibility compliance with minimum touch targets
  - _Requirements: 4.1, 4.2, 4.4, 5.5, 3.6_

- [ ] 6. Optimize BLoC integration patterns
- [ ] 6.1 Optimize BLoC event dispatching
  - Replace anonymous functions in BLoC event calls with method references
  - Use method references for consistent event handling
  - Implement proper error handling in event methods
  - _Requirements: 9.4, 5.1_

- [ ] 6.2 Implement BLoC UI optimization patterns
  - Apply BlocBuilder for UI rendering based on state changes
  - Use BlocListener for side effects like navigation and dialogs
  - Implement BlocSelector for fine-grained rebuilds
  - Apply buildWhen conditions comparing specific state properties
  - _Requirements: 5.1, 5.2, 5.3, 5.4_

- [ ] 6.3 Implement navigation BLoC listeners
  - Create navigation listeners for BLoC state changes
  - Integrate Auto Route with existing BLoC patterns
  - Add deep linking support for work orders and documents
  - Maintain existing business logic and routing behavior
  - _Requirements: 5.2, 5.6_

- [ ] 7. Implement responsive design system
- [x] 7.1 Add responsive breakpoint helpers
  - DesignTokens already includes comprehensive breakpoint helpers
  - Mobile, tablet, and desktop breakpoint constants are defined
  - Helper methods for responsive checks are implemented
  - _Requirements: 3.5, 3.6_

- [ ] 7.2 Configure ScreenUtilInit with proper settings
  - Set designSize to Size(390, 844) for consistent scaling
  - Enable minTextAdapt and splitScreenMode for accessibility
  - Ensure support for system textScaleFactor up to 200%
  - _Requirements: 1.6, 3.1, 3.7, 10.7_

- [ ] 7.3 Optimize responsive image and media components
  - Update FsmOptimizedImage for responsive behavior
  - Fix hardcoded Colors in WorkOrderImageThumbnail shimmer loading
  - Add performance optimizations for image loading
  - Ensure minimum 48dp touch targets for interactive elements
  - _Requirements: 3.5, 3.6, 9.3_

- [ ] 8. Implement build system and CI compliance
- [ ] 8.1 Update build.yaml for optimal code generation
  - Configure freezed with map: true, copyWith: true options
  - Set up hive_ce_generator with consistent type_adapter_suffix
  - Document mandatory build_runner execution workflow
  - Use --delete-conflicting-outputs flag to prevent stale files
  - _Requirements: 10.1, 10.2, 10.3, 10.4_

- [ ] 8.2 Implement lint rules for design system compliance
  - Create CI checks for hardcoded Colors usage violations
  - Add checks for raw EdgeInsets and SizedBox usage
  - Verify import hygiene using widgets.dart barrel exports
  - Enforce page line count limits and const constructor usage
  - _Requirements: 1.7, 8.4, 4.1, 9.1_

- [ ]* 8.3 Create golden tests for key pages
  - Implement golden tests for dashboard, work order details, documents pages
  - Test both light and dark theme variants
  - Add responsive breakpoint testing
  - _Requirements: 8.1_

- [ ]* 8.4 Add widget tests for BLoC optimization
  - Test BlocBuildConditions mixin functionality
  - Verify buildWhen optimization with property-based comparisons
  - Test BlocSelector and context.select usage
  - _Requirements: 8.3_

- [ ]* 8.5 Implement accessibility testing
  - Test semantic labels and touch target sizes
  - Verify color contrast compliance
  - Test screen reader compatibility
  - _Requirements: 8.3, 3.6_

- [ ]* 9. Create comprehensive documentation and migration guides
- [ ]* 9.1 Create comprehensive migration documentation
  - Document all component replacements and usage patterns
  - Provide before/after examples for common UI patterns
  - Explain new design token system and responsive helpers
  - List all deprecated components and their replacements
  - _Requirements: 7.1, 7.2, 7.3, 7.4_

- [ ]* 9.2 Update development guidelines
  - Document BLoC optimization patterns and best practices
  - Create widget development guidelines for extending the design system
  - Add performance optimization recommendations
  - Include guidelines for maintaining design system consistency
  - _Requirements: 7.4, 7.5_

- [ ]* 10. Advanced testing and validation
- [ ]* 10.1 Comprehensive integration testing
  - Test complete user flows with new design system
  - Validate theme switching functionality between light and dark modes
  - Test responsive behavior across mobile, tablet, and desktop breakpoints
  - Verify identical UX behavior after refactoring
  - _Requirements: 8.1, 8.3, 4.5_

- [ ]* 10.2 Performance benchmarking and optimization
  - Measure app startup time and memory usage improvements
  - Validate RepaintBoundary effectiveness in complex list items
  - Test BLoC rebuild optimization impact on performance
  - Monitor frame performance with design system components
  - _Requirements: 9.3, 9.5_

---

## Notes

- **Optional Tasks**: Tasks marked with `*` are optional and focus on testing, documentation, and advanced optimizations
- **Dependencies**: Tasks should be executed in order within each phase, but phases can overlap
- **Validation**: Each task should be validated against the specific requirements listed
- **Performance**: Focus on minimal, functional implementations that meet requirements without over-engineering
- **Current State**: The codebase has strong foundations with DesignTokens, FSMThemeExtension, BLoC optimization infrastructure, and widget organization. Main work needed is cleaning up hardcoded styling violations and applying the existing design system consistently.

## Completion Criteria

The refactor is complete when:
1. All hardcoded styling violations are eliminated from presentation layer
2. All pages use design system components and stay under 300 lines
3. BLoC patterns use property-based buildWhen conditions (infrastructure already exists)
4. Widget library has no duplicate implementations
5. CI checks pass for design system compliance
6. Core functionality maintains identical UX behavior