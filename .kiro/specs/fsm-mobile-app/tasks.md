# Implementation Plan

- [x] 1. Project Setup and Migration from Legacy Codebase
  - Migrate assets from .old/assets to current project with flutter_gen integration
  - Update pubspec.yaml dependencies to match design requirements (injectable, auto_route, hive)
  - Extract and adapt business logic from .old/lib for new clean architecture
  - Configure flutter_screenutil for responsive design
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [x] 1.1 Migrate Assets and Configure Dependencies
  - Copy assets from .old/assets (images, icons, fonts) to current project
  - Update pubspec.yaml to add missing dependencies (injectable, auto_route, hive, flutter_gen_runner)
  - Configure flutter_gen for type-safe asset access with existing assets
  - Set up build_runner configuration for continuous code generation
  - Initialize ScreenUtilInit in main.dart with design size
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [x] 1.2 Migrate and Restructure Core Components
  - Migrate existing core components from .old/lib/core to new clean architecture structure
  - Adapt existing auth_interceptor.dart, constants.dart, and utils.dart to new patterns
  - Extract location_service.dart and enums.dart from old codebase
  - Create new core/di directory with injectable dependency injection setup
  - Create core/storage directory for Hive local storage (replacing shared_preferences)
  - Create core/router directory for Auto Route configuration
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [x] 1.3 Set Up Error Handling and Failure Types
  - Create Failure classes using Freezed for different error types
  - Implement ServerFailure, NetworkFailure, CacheFailure, ValidationFailure, PermissionFailure, LocationFailure
  - Create exception classes for custom error handling
  - Set up Either pattern for functional error handling
  - _Requirements: 10.1, 10.2, 10.3, 10.4, 10.5, 10.6_

- [x] 1.4 Configure Flutter Flavors for Multiple Environments
  - Set up Flutter flavors for development, staging, and production
  - Create flavor-specific configuration files (app_config_dev.dart, app_config_staging.dart, app_config_prod.dart)
  - Configure environment-specific API base URLs, app names, and bundle identifiers
  - Create separate main entry points (main_dev.dart, main_staging.dart, main_prod.dart)
  - Set up Android flavor configuration in build.gradle
  - Configure iOS schemes for different flavors in Xcode
  - Add flavor-specific app icons and launch screens
  - _Requirements: All requirements for environment-specific configurations_

- [x] 2. Core Services Implementation
  - Implement dependency injection container with Injectable
  - Create network layer with Dio client and interceptors
  - Set up Hive service for local storage
  - Implement location service for GPS functionality
  - Create network info service for connectivity checking
  - _Requirements: 3.1, 3.2, 3.3, 3.4, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

- [x] 2.1 Implement Dependency Injection Container with Environment Support
  - Create injection.dart with @InjectableInit configuration
  - Set up GetIt container for dependency management
  - Configure environment-specific registrations (@dev, @staging, @prod)
  - Create separate main files for each flavor (main_dev.dart, main_staging.dart, main_prod.dart)
  - Initialize DI container with environment-specific configurations
  - _Requirements: 3.1, 3.2, 3.3, 3.4_

- [x] 2.2 Create Network Layer with Dio and Environment Configuration
  - Implement DioClient as singleton with environment-specific base URLs
  - Create AuthInterceptor for JWT token management and automatic refresh
  - Add PrettyDioLogger for development debugging (disabled in production)
  - Implement retry mechanism with dio_smart_retry
  - Configure different timeout values and logging levels per environment
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

- [x] 2.3 Set Up Hive Local Storage Service
  - Create HiveService as singleton for box management
  - Initialize Hive with Flutter integration
  - Set up box constants and keys
  - Implement cache management methods
  - _Requirements: 3.1, 3.2, 3.3, 3.4, 3.5, 3.6_

- [x] 2.4 Implement Location Service
  - Create LocationService with permission handling
  - Implement getCurrentPosition with error handling
  - Add location accuracy validation
  - Handle location service disabled scenarios
  - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

- [x] 2.5 Create Network Info Service
  - Implement NetworkInfo service using connectivity_plus
  - Add connection state monitoring
  - Create methods for checking internet connectivity
  - Handle network state changes
  - _Requirements: 3.1, 3.2, 3.3, 3.4_

- [x] 3. Authentication Feature Implementation
  - Create authentication domain entities and use cases
  - Implement authentication data layer with API client
  - Build authentication BLoC for state management
  - Create login and splash pages with responsive UI
  - Set up Auto Route configuration with auth guards
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

- [x] 3.1 Migrate and Enhance Authentication Domain Layer
  - Migrate existing UserEntity from .old/lib/data/entity/user_entity.dart to domain layer
  - Create IAuthRepository interface based on existing authentication patterns
  - Implement LoginUseCase, LogoutUseCase, CheckAuthUseCase, RefreshTokenUseCase
  - Add authentication-related failure types
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

- [x] 3.2 Migrate and Enhance Authentication Data Layer
  - Migrate existing LoginRequest and LoginResponse from .old/lib/data/response/
  - Adapt existing API client patterns from .old/lib/data/client.dart to Retrofit
  - Migrate existing auth_interceptor.dart to new network layer
  - Create AuthRemoteDataSource for API communication
  - Implement AuthLocalDataSource for token storage in Hive (replacing shared_preferences)
  - Create AuthRepositoryImpl implementing IAuthRepository
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

- [x] 3.3 Build Authentication BLoC
  - Create AuthEvent and AuthState with Freezed
  - Implement AuthBloc with Injectable registration
  - Handle login, logout, check auth, and token refresh events
  - Implement proper state transitions and error handling
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

- [x] 3.4 Migrate and Enhance Authentication UI Pages
  - Migrate existing SplashPage from .old/lib/presentation/pages/splash/ and add @RoutePage annotation
  - Migrate existing LoginPage from .old/lib/presentation/pages/login/ with gradient components
  - Adapt existing login form to reactive forms pattern
  - Migrate existing gradient components from .old/lib/presentation/core/components/
  - Add loading states with shimmer effects and ensure flutter_screenutil usage
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 9.1, 9.2, 9.3, 9.4_

- [x] 3.5 Set Up Auto Route Configuration
  - Create AppRouter with @AutoRouterConfig
  - Define routes for splash, login, and main app sections
  - Implement AuthGuard for protected routes
  - Configure nested navigation structure
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

- [x] 4. Work Orders Feature Implementation
  - Create work order domain entities with business logic
  - Implement work order data layer with offline-first approach
  - Build work order BLoCs for list and action management
  - Create dashboard, work order list, and details pages
  - Implement work order state machine with GPS tracking
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

- [x] 4.1 Migrate and Enhance Work Order Domain Layer
  - Migrate existing WorkOrderEntity from .old/lib/data/entity/work_order_entity.dart to domain layer
  - Migrate existing ServiceRequestEntity from .old/lib/data/entity/service_request_entity.dart
  - Extract WorkOrderStatus and WorkOrderPriority enums from .old/lib/core/services/enums.dart
  - Create IWorkOrderRepository interface based on existing patterns
  - Implement work order use cases (Get, Start, Pause, Resume, Complete)
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7_

- [x] 4.2 Migrate and Enhance Work Order Data Layer
  - Migrate existing work order DTOs from .old/lib/data/response/ (work_order_response, start_work_order_request, etc.)
  - Create WorkOrderHiveModel for local caching (replacing shared_preferences approach)
  - Adapt existing API client patterns to Retrofit with work order endpoints
  - Migrate existing work order models from .old/lib/data/models/
  - Create WorkOrderRemoteDataSource and WorkOrderLocalDataSource
  - Create WorkOrderRepositoryImpl with offline-first logic
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6_

- [x] 4.3 Build Work Order BLoCs
  - Create WorkOrdersListBloc for managing work order lists
  - Implement WorkOrderActionBloc for work order state transitions
  - Create events and states with Freezed for both BLoCs
  - Handle pagination, filtering, and search functionality
  - Implement GPS capture before state transitions
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

- [x] 4.4 Create Work Order UI Components
  - Build WorkOrderCard with status indicators and responsive design
  - Create WorkOrderStatusChip with color coding
  - Implement WorkOrderActionSheet for state transitions
  - Add WorkOrderShimmer for loading states
  - Use flutter_screenutil for all dimensions and gradients
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 9.1, 9.2, 9.3, 9.4_

- [x] 4.5 Migrate and Enhance Work Order Pages
  - Migrate existing DashboardPage from .old/lib/presentation/pages/fsm_dashboard/ with responsive layout
  - Migrate existing WorkOrdersPage from .old/lib/presentation/pages/work_order/ with BLoC integration
  - Migrate existing WorkOrderDetailsPage from .old/lib/presentation/pages/job_details/ 
  - Enhance existing location service integration from .old/lib/core/services/location_service.dart
  - Add offline indicators and sync status to existing UI patterns
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 5. Documents Feature Implementation
  - Create document domain entities and use cases
  - Implement document data layer with search capabilities
  - Build document BLoC for state management
  - Create documents page and PDF viewer
  - Add offline document access functionality
  - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.6_

- [ ] 5.1 Migrate and Enhance Document Domain Layer
  - Migrate existing DocumentEntity from .old/lib/data/entity/document_entity.dart to domain layer
  - Create IDocumentRepository interface based on existing patterns
  - Implement GetDocumentsUseCase and SearchDocumentsUseCase
  - Add DownloadDocumentUseCase for offline access
  - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.6_

- [ ] 5.2 Migrate and Enhance Document Data Layer
  - Migrate existing DocumentResponse from .old/lib/data/response/document_response.dart
  - Adapt existing API patterns to Retrofit with document endpoints
  - Create DocumentRemoteDataSource for API communication
  - Implement DocumentLocalDataSource for file caching with Hive
  - Create DocumentRepositoryImpl with offline capabilities
  - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.6_

- [ ] 5.3 Build Document BLoC
  - Create DocumentsBloc with search and filter functionality
  - Implement events and states with Freezed
  - Handle document loading, searching, and downloading
  - Add offline state management
  - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.6_

- [ ] 5.4 Create Document UI Components
  - Build DocumentListItem with download indicators
  - Create document search bar with filtering
  - Implement document category filters
  - Add download progress indicators
  - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 5.5 Migrate and Enhance Document Pages
  - Migrate existing DocumentsPage from .old/lib/presentation/pages/documents/ with BLoC integration
  - Enhance existing PDF viewer implementation with SyncfusionPdfViewer
  - Add zoom, navigation, and bookmark features to existing viewer
  - Implement offline document access with Hive caching
  - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 6. Parts and Inventory Feature Implementation
  - Create parts domain entities and inventory management
  - Implement parts data layer with search and filtering
  - Build parts BLoC for inventory tracking
  - Create parts catalog and inventory management pages
  - Add low stock notifications and inventory updates
  - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6_

- [ ] 6.1 Migrate and Enhance Parts Domain Layer
  - Migrate existing SparePart entity from .old/lib/data/entity/spare_part.dart to domain layer
  - Create IPartsRepository interface based on existing patterns
  - Implement GetPartsUseCase, SearchPartsUseCase, UpdateInventoryUseCase
  - Add GetLowStockPartsUseCase for notifications
  - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6_

- [ ] 6.2 Migrate and Enhance Parts Data Layer
  - Migrate existing InventoryResponse from .old/lib/data/response/inventory_response.dart
  - Migrate existing MaterialUsedCollection from .old/lib/data/models/material_used_collection.dart
  - Adapt existing API patterns to Retrofit with parts and inventory endpoints
  - Create PartsRemoteDataSource for API communication
  - Implement PartsLocalDataSource for inventory caching with Hive
  - Create PartsRepositoryImpl with offline inventory tracking
  - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6_

- [ ] 6.3 Build Parts BLoC
  - Create PartsBloc for catalog and inventory management
  - Implement events and states with Freezed
  - Handle parts search, filtering, and inventory updates
  - Add low stock monitoring and notifications
  - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6_

- [ ] 6.4 Create Parts UI Components
  - Build PartCard with inventory indicators
  - Create InventoryIndicator with color-coded stock levels
  - Implement parts search and filter components
  - Add inventory update forms with validation
  - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 6.5 Migrate and Enhance Parts Pages
  - Migrate existing PartsPage from .old/lib/presentation/pages/parts_management/ with BLoC integration
  - Enhance existing parts management UI with inventory tracking
  - Add inventory update functionality with offline support using Hive
  - Create low stock alerts and reorder suggestions
  - _Requirements: 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 7. Calendar Feature Implementation
  - Create calendar domain entities and scheduling logic
  - Implement calendar data layer with event management
  - Build calendar BLoC for schedule management
  - Create calendar page with event display
  - Add route optimization for daily schedules
  - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.6_

- [ ] 7.1 Create Calendar Domain Layer
  - Define CalendarEventEntity with CalendarEventType enum
  - Create ICalendarRepository interface
  - Implement GetCalendarEventsUseCase and GetDailyScheduleUseCase
  - Add OptimizeRouteUseCase for work order scheduling
  - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.6_

- [ ] 7.2 Implement Calendar Data Layer
  - Create CalendarEventDto with JSON serialization
  - Implement CalendarApiClient with event endpoints
  - Create CalendarRemoteDataSource for API communication
  - Implement CalendarLocalDataSource for event caching
  - Create CalendarRepositoryImpl with offline event access
  - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.6_

- [ ] 7.3 Build Calendar BLoC
  - Create CalendarBloc for event and schedule management
  - Implement events and states with Freezed
  - Handle calendar loading, date navigation, and event filtering
  - Add route optimization logic
  - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.6_

- [ ] 7.4 Create Calendar UI Components
  - Build CalendarView with calendar_view package
  - Create EventCard for displaying calendar events
  - Implement date navigation and view switching
  - Add route optimization display
  - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 7.5 Migrate and Enhance Calendar Page
  - Migrate existing CalendarPage from .old/lib/presentation/pages/calendar/ with BLoC integration
  - Enhance existing calendar implementation with month, week, and day views
  - Implement event filtering and search functionality
  - Add work order integration with calendar events
  - Create route optimization suggestions
  - _Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 8. Profile Feature Implementation
  - Create profile domain entities and user management
  - Implement profile data layer with settings
  - Build profile BLoC for user data management
  - Create profile page with settings and preferences
  - Add app configuration and user preferences
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6_

- [ ] 8.1 Create Profile Domain Layer
  - Define ProfileEntity with user information and preferences
  - Create IProfileRepository interface
  - Implement GetProfileUseCase and UpdateProfileUseCase
  - Add settings and preferences management
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6_

- [ ] 8.2 Implement Profile Data Layer
  - Create ProfileDto with JSON serialization
  - Implement ProfileApiClient with user endpoints
  - Create ProfileRemoteDataSource for API communication
  - Implement ProfileLocalDataSource for settings caching
  - Create ProfileRepositoryImpl with offline settings
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6_

- [ ] 8.3 Build Profile BLoC
  - Create ProfileBloc for user data and settings management
  - Implement events and states with Freezed
  - Handle profile loading, updating, and settings changes
  - Add notification preferences management
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6_

- [ ] 8.4 Create Profile UI Components
  - Build ProfileHeader with user information display
  - Create SettingsSection with preference controls
  - Implement settings toggles and form inputs
  - Add logout and account management options
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 8.5 Migrate and Enhance Profile Page
  - Migrate existing ProfilePage from .old/lib/presentation/pages/profile/ with BLoC integration
  - Enhance existing profile UI with settings categories and preferences
  - Add app configuration options with Hive storage
  - Enhance existing logout functionality with confirmation
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 8.6, 9.1, 9.2, 9.3, 9.4_

- [ ] 9. Main Navigation and Integration
  - Create main navigation wrapper with bottom navigation
  - Integrate all feature modules with routing
  - Implement navigation guards and deep linking
  - Add global app state management
  - Create unified theme and design system
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [ ] 9.1 Create Main Navigation Structure
  - Build MainNavigationWrapperPage with bottom navigation
  - Implement navigation between feature modules
  - Add navigation guards for authentication
  - Create deep linking support for work orders and documents
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [ ] 9.2 Migrate and Enhance Global Theme and Design System
  - Migrate existing theme components from .old/lib/presentation/core/themes/
  - Migrate existing gradient components from .old/lib/presentation/core/components/
  - Enhance existing AppTheme with responsive sizing using flutter_screenutil
  - Implement AppDimensions with responsive sizing constants
  - Ensure consistent typography and spacing across migrated components
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [ ] 9.3 Integrate All Features with Routing
  - Update AppRouter with all feature routes
  - Implement nested navigation for main app sections
  - Add route parameters and navigation arguments
  - Create navigation helpers and extensions
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [ ] 9.4 Set Up Global State Management
  - Create app-level BLoCs for global state
  - Implement connectivity monitoring and offline indicators
  - Add global error handling and user feedback
  - Create sync status management across features
  - _Requirements: 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 10.1, 10.2, 10.3, 10.4, 10.5, 10.6_

- [ ] 10. Comprehensive Testing Implementation
  - Create unit tests for all BLoCs, use cases, and repositories
  - Implement widget tests for all pages and components
  - Build integration tests for complete user flows
  - Add golden tests for visual regression testing
  - Create performance tests for app optimization
  - _Requirements: All requirements for maximum test coverage_

- [ ] 10.1 Implement Unit Tests for Authentication Feature
  - Create tests for AuthBloc with all state transitions
  - Test LoginUseCase, LogoutUseCase, CheckAuthUseCase with success/error scenarios
  - Test AuthRepositoryImpl with online/offline scenarios
  - Add tests for AuthRemoteDataSource and AuthLocalDataSource
  - Achieve 95%+ coverage for authentication module
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

- [ ] 10.2 Implement Unit Tests for Work Orders Feature
  - Create comprehensive tests for WorkOrdersListBloc and WorkOrderActionBloc
  - Test all work order use cases with GPS scenarios and state transitions
  - Test WorkOrderRepositoryImpl with offline-first logic
  - Add tests for work order data sources and API clients
  - Achieve 95%+ coverage for work orders module
  - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6_

- [ ] 10.3 Implement Unit Tests for Documents, Parts, Calendar, and Profile Features
  - Create unit tests for all remaining feature BLoCs and use cases
  - Test repository implementations with offline scenarios
  - Add tests for data sources and API clients
  - Test search, filtering, and caching functionality
  - Achieve 95%+ coverage for all feature modules
  - _Requirements: 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 8.1, 8.2, 8.3, 8.4, 8.5, 8.6_

- [ ] 10.4 Implement Widget Tests for All UI Components
  - Create widget tests for all pages with different states (loading, success, error)
  - Test all custom widgets and components with various props
  - Add tests for user interactions, navigation, and form validation
  - Test responsive design with different screen sizes
  - Achieve 90%+ coverage for all UI components
  - _Requirements: 9.1, 9.2, 9.3, 9.4_

- [ ] 10.5 Create Integration Tests for Critical User Flows
  - Implement complete authentication flow test
  - Create work order lifecycle integration test (start to completion)
  - Add offline functionality integration test
  - Test document viewing and downloading flow
  - Create parts inventory management integration test
  - Achieve 100% coverage for critical user journeys
  - _Requirements: All requirements for end-to-end functionality_

- [ ] 10.6 Implement Golden Tests and Performance Tests
  - Create golden tests for all major UI components and pages
  - Add visual regression tests for different device sizes
  - Implement performance tests for app startup, scrolling, and memory usage
  - Create load tests for large data sets
  - Add network performance tests for API calls
  - _Requirements: 9.1, 9.2, 9.3, 9.4, 10.1, 10.2, 10.3, 10.4, 10.5, 10.6_

- [ ] 11. Final Integration and Optimization
  - Run complete code generation for all modules
  - Optimize app performance and memory usage
  - Implement final error handling and user feedback
  - Add app icons, splash screens, and branding
  - Create build configurations for development and production
  - _Requirements: 10.1, 10.2, 10.3, 10.4, 10.5, 10.6_

- [ ] 11.1 Complete Code Generation and Build Setup with Flavors
  - Run dart run build_runner build for all generated files
  - Verify all @injectable, @freezed, @RoutePage, and @RestApi annotations
  - Generate Flutter assets with flutter_gen_runner
  - Set up Flutter flavors for development, staging, and production environments
  - Configure environment-specific app configurations and API endpoints
  - _Requirements: All requirements for code generation_

- [ ] 11.2 Performance Optimization and Final Polish
  - Optimize app startup time and memory usage
  - Implement lazy loading for large data sets
  - Add proper error boundaries and crash reporting
  - Use existing app icons and branding assets from .old/assets/images/ (csg-logo.png, fsm_logo.png)
  - Finalize responsive design across all screen sizes with flutter_screenutil
  - _Requirements: 9.1, 9.2, 9.3, 9.4, 10.1, 10.2, 10.3, 10.4, 10.5, 10.6_