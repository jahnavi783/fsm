# Requirements Document

## Introduction

This specification defines the requirements for refactoring the Flutter presentation layer of the FSM app into a reusable design system with strict theming and responsive tokens. The refactor aims to eliminate hardcoded styling, consolidate duplicate components, enforce consistent theming patterns, and establish proper responsive design tokens while maintaining identical UX behavior.

## Glossary

- **Design_System**: A centralized collection of reusable UI components, design tokens, and guidelines that ensure consistency across the application
- **Design_Tokens**: Named entities that store visual design attributes (colors, spacing, typography, etc.) in a centralized location
- **FSM_App**: Field Service Management mobile application built with Flutter
- **Material_3**: Google's latest Material Design system implementation for Flutter
- **Responsive_Tokens**: Design values that adapt to different screen sizes using flutter_screenutil
- **Theme_Extension**: Flutter's mechanism for extending ThemeData with custom properties
- **Widget_Barrel**: A single file that exports multiple related widgets for easier importing
- **BLoC_Pattern**: Business Logic Component pattern used for state management in Flutter
- **Component_Theme**: Pre-configured styling for Material Design components (buttons, cards, etc.)
- **Presentation_Layer**: All Flutter UI code in lib/features/*/presentation/ and lib/core/widgets/
- **CI_Build**: Continuous Integration build process that validates code quality

## Requirements

### Requirement 1

**User Story:** As a Flutter developer, I want a centralized design system with strict theming tokens, so that I can build consistent UI components without hardcoded styling values.

#### Acceptance Criteria

1. THE Design_System SHALL eliminate all direct Colors.* usage in Presentation_Layer files except Colors.transparent
2. THE Design_System SHALL provide all colors through ThemeData.colorScheme for Material 3 semantic colors and strongly-typed FSMThemeExtension properties for domain-specific colors
3. THE Design_System SHALL centralize all spacing, sizing, and radius values in Design_Tokens with const base values and responsive extensions
4. THE Design_System SHALL configure component themes for all Material widgets used in the FSM_App
5. THE Design_System SHALL provide typography through theme.textTheme with responsive scaling configured in AppTheme
6. THE Design_System SHALL use ScreenUtilInit wrapper with designSize Size(390, 844) and proper initialization
7. IF hardcoded Colors.* or raw EdgeInsets/SizedBox appear in Presentation_Layer, THEN THE CI_Build SHALL fail
8. THE Design_System SHALL use REdgeInsets and RSizedBox for responsive layouts instead of raw EdgeInsets and SizedBox

### Requirement 2

**User Story:** As a Flutter developer, I want consolidated widget components with no duplicates, so that I can maintain a single source of truth for each UI pattern.

#### Acceptance Criteria

1. THE Widget_Library SHALL provide one canonical implementation per component type (button, card, list item, etc.)
2. THE Widget_Library SHALL organize components in functional categories under lib/core/widgets/{buttons,inputs,cards,lists,layout,states,navigation,media}
3. THE Widget_Library SHALL export all components through a single widgets.dart barrel file
4. THE Widget_Library SHALL eliminate duplicate implementations like custom_button.dart vs fsm_button.dart
5. THE Widget_Library SHALL merge similar components (empty states, error handlers, bottom sheets) into unified implementations

### Requirement 3

**User Story:** As a Flutter developer, I want responsive design tokens that work consistently across screen sizes, so that the app provides optimal UX on all devices.

#### Acceptance Criteria

1. THE Responsive_System SHALL use flutter_screenutil with a single designSize configuration
2. THE Responsive_System SHALL eliminate raw EdgeInsets, SizedBox, and ad-hoc .w/.h/.sp usage in UI code
3. THE Responsive_System SHALL provide spacing through Design_Tokens properties and REdgeInsets/RSizedBox helpers
4. THE Responsive_System SHALL centralize icon sizes, border radii, and layout gaps in Design_Tokens
5. THE Responsive_System SHALL provide breakpoint constants and helper APIs in Design_Tokens for mobile, tablet, and desktop layouts
6. THE Responsive_System SHALL ensure interactive targets meet minimum 48dp accessibility requirements
7. THE Responsive_System SHALL support system textScaleFactor up to 200% through theme-based typography

### Requirement 4

**User Story:** As a Flutter developer, I want clean page implementations under 300 lines, so that I can focus on composition rather than styling logic.

#### Acceptance Criteria

1. THE Page_Architecture SHALL limit all page files to maximum 300 lines of code
2. THE Page_Architecture SHALL extract complex UI sections to presentation/widgets or core/widgets
3. THE Page_Architecture SHALL compose pages using shared widgets and pure build helper functions
4. THE Page_Architecture SHALL eliminate inline styling constants and logic from page files
5. THE Page_Architecture SHALL maintain identical UX behavior after refactoring

### Requirement 5

**User Story:** As a Flutter developer, I want proper BLoC UI patterns with optimized rebuilds, so that the app performs efficiently with clean state management.

#### Acceptance Criteria

1. THE BLoC_Integration SHALL use BlocBuilder for UI rendering based on state changes
2. THE BLoC_Integration SHALL use BlocListener for side effects like navigation, dialogs, and snackbars
3. THE BLoC_Integration SHALL use BlocSelector and context.select for fine-grained rebuilds
4. THE BLoC_Integration SHALL apply buildWhen conditions that compare specific state properties, not runtimeType
5. THE BLoC_Integration SHALL implement BlocBuildConditions mixin for common buildWhen patterns
6. THE BLoC_Integration SHALL maintain existing business logic and routing behavior unchanged

### Requirement 6

**User Story:** As a Flutter developer, I want theme extensions that follow Material 3 patterns, so that I can extend theming capabilities while maintaining framework consistency.

#### Acceptance Criteria

1. THE Theme_System SHALL extend ThemeData using ThemeExtension pattern for custom properties
2. THE Theme_System SHALL wrap Material buttons (Filled/Elevated/Outlined) with themed defaults rather than extending ButtonStyleButton
3. THE Theme_System SHALL configure component themes so widgets rely on theme defaults instead of explicit styling
4. THE Theme_System SHALL provide both light and dark theme variants for all custom extensions
5. THE Theme_System SHALL use ThemeData.copyWith for theme inheritance and customization

### Requirement 7

**User Story:** As a Flutter developer, I want comprehensive migration documentation, so that I can understand the changes and apply the new patterns correctly.

#### Acceptance Criteria

1. THE Migration_Documentation SHALL document all component replacements and usage patterns
2. THE Migration_Documentation SHALL provide before/after examples for common UI patterns
3. THE Migration_Documentation SHALL explain the new Design_Tokens system and responsive helpers
4. THE Migration_Documentation SHALL list all deprecated components and their replacements
5. THE Migration_Documentation SHALL include guidelines for extending the Design_System

### Requirement 8

**User Story:** As a Flutter developer, I want quality assurance through automated testing, so that I can ensure the design system maintains consistency and performance.

#### Acceptance Criteria

1. THE Quality_Assurance SHALL include golden tests for key pages (dashboard, work order details, documents)
2. THE Quality_Assurance SHALL provide theme snapshot tests for light and dark variants
3. THE Quality_Assurance SHALL include widget tests demonstrating buildWhen/listenWhen optimization
4. THE Quality_Assurance SHALL enforce import hygiene where pages only import shared UI via widgets.dart barrel
5. THE Quality_Assurance SHALL provide lint rules and CI checks to prevent hardcoded styling violations

### Requirement 9

**User Story:** As a Flutter developer, I want performance-optimized widgets with best practices, so that the app renders efficiently and follows Flutter conventions.

#### Acceptance Criteria

1. THE Performance_System SHALL implement const constructors with super.key parameter for all custom widgets
2. THE Performance_System SHALL use composition pattern (wrap Material widgets) rather than inheritance
3. THE Performance_System SHALL add RepaintBoundary to complex list items and cards for paint isolation
4. THE Performance_System SHALL replace anonymous functions in build methods with method references
5. THE Performance_System SHALL use ListView.builder for all dynamic lists to enable lazy loading

### Requirement 10

**User Story:** As a Flutter developer, I want proper code generation configuration and workflows, so that I can maintain consistency and avoid build errors.

#### Acceptance Criteria

1. THE Build_System SHALL configure build.yaml with proper freezed options (map: true, copyWith: true)
2. THE Build_System SHALL use hive_ce_generator with type_adapter_suffix for consistent naming
3. THE Build_System SHALL document mandatory build_runner execution after model changes
4. THE Build_System SHALL use --delete-conflicting-outputs flag to prevent stale generated files
5. THE Build_System SHALL enforce code generation order: freezed → json_serializable → hive_ce
6. THE Build_System SHALL require flutter_screenutil 5.9.3+ with await tester.pumpAndSettle() in tests
7. THE Build_System SHALL use ScreenUtilInit with minTextAdapt: true and splitScreenMode: true
8. THE Build_System SHALL document REdgeInsets and RSizedBox usage for const constructor support