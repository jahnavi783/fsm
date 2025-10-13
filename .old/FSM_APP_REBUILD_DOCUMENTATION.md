# FSM (Field Service Management) Mobile Application - Complete Rebuild Documentation

## Table of Contents
1. [Project Overview](#project-overview)
2. [Architecture & Tech Stack](#architecture--tech-stack)
3. [Dependencies](#dependencies)
4. [Project Structure](#project-structure)
5. [Data Models & Entities](#data-models--entities)
6. [API Integration](#api-integration)
7. [State Management (BLoC/Cubit)](#state-management-bloccubit)
8. [UI/UX Flows & Navigation](#uiux-flows--navigation)
9. [Core Features Implementation](#core-features-implementation)
10. [Authentication Flow](#authentication-flow)
11. [Work Order Management](#work-order-management)
12. [Location Services](#location-services)
13. [Document Management](#document-management)
14. [Theme & Styling](#theme--styling)

---

## Project Overview

The FSM Mobile Application is a Flutter-based field service management solution designed for technicians to manage work orders, track service requests, document work completion, and access technical assistance. The app provides real-time work order status management, GPS tracking, parts inventory management, and document access.

**Target Users:** Field Service Technicians
**Platform:** Android & iOS (Flutter)
**Current Version:** 2.0.5+5

### Key Features
- Work order lifecycle management (Assigned → In Progress → Paused → Completed)
- Real-time GPS location tracking
- Parts/materials usage tracking
- Image capture and attachment
- Calendar view for scheduled work orders
- Document library with search and filtering
- Profile management
- Offline-first capability considerations

---

## Architecture & Tech Stack

### Architecture Pattern
- **State Management:** BLoC (Business Logic Component) pattern with flutter_bloc
- **Dependency Injection:** GetIt for service locator pattern
- **API Client:** Retrofit + Dio for REST API communication
- **Data Serialization:** Freezed + JSON Serializable for immutable models
- **Routing:** Navigator 2.0 with MaterialApp

### Core Technologies
- **Flutter SDK:** ^3.6.1
- **Language:** Dart
- **Design Pattern:** Clean Architecture principles with separation of concerns
  - Presentation Layer (UI + BLoC/Cubit)
  - Data Layer (API Client + Models)
  - Core Layer (Services + Utilities)

---

## Dependencies

### Core Dependencies
```yaml
dependencies:
  # Framework
  flutter:
    sdk: flutter

  # State Management
  flutter_bloc: ^9.0.0
  equatable: ^2.0.7

  # Dependency Injection
  get_it: ^8.0.3

  # Network & API
  dio: ^5.8.0+1
  retrofit: ^4.4.2
  http: ^1.3.0
  pretty_dio_logger: ^1.4.0
  dio_smart_retry: ^7.0.1
  dio_refresh_token: ^0.0.1
  chucker_flutter: ^1.8.5  # Network inspector

  # Data Serialization
  freezed_annotation: ^3.0.0
  json_annotation: ^4.9.0

  # Storage
  shared_preferences: ^2.3.2

  # UI Components
  flutter_screenutil: ^5.9.3  # Responsive design
  shimmer: ^3.0.0  # Loading effects
  very_good_infinite_list: ^0.9.0  # Infinite scroll
  rounded_loading_button_plus: ^3.0.1

  # Forms
  reactive_forms: ^17.0.0

  # Location & Maps
  location: ^7.0.1
  flutter_map: ^8.1.1

  # Media & Files
  file_picker: ^8.3.5
  image_picker: ^1.1.0
  screenshot: ^3.0.0
  permission_handler: ^11.3.1

  # Calendar
  calendar_view: ^1.4.0

  # Document Viewing
  syncfusion_flutter_pdfviewer: ^30.1.37
  chewie: ^1.12.1  # Video player
  url_launcher: ^6.3.0

  # Real-time Communication
  socket_io_client: ^3.0.2
  flutter_webrtc: ^0.12.9

  # Utilities
  either_dart: ^1.0.0
  intl: ^0.20.2
  cupertino_icons: ^1.0.8

dev_dependencies:
  # Testing
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0

  # Code Generation
  build_runner: ^2.4.15
  json_serializable: ^6.9.5
  retrofit_generator: ^9.2.0
  freezed: ^3.0.6
```

---

## Project Structure

```
lib/
├── core/
│   ├── auth_interceptor.dart          # JWT token management
│   ├── constants.dart                  # App constants
│   ├── utils.dart                      # Utility functions
│   └── services/
│       ├── enums.dart                  # App-wide enums
│       └── location_service.dart       # GPS location handling
│
├── data/
│   ├── client.dart                     # Retrofit API client
│   ├── entity/                         # Data entities (with Freezed)
│   │   ├── work_order_entity.dart
│   │   ├── user_entity.dart
│   │   ├── service_request_entity.dart
│   │   ├── spare_part.dart
│   │   └── document_entity.dart
│   ├── models/                         # Business models
│   │   ├── login_model.dart
│   │   ├── work_order_model.dart
│   │   └── material_used_collection.dart
│   └── response/                       # API request/response models
│       ├── login_request.dart
│       ├── login_response.dart
│       ├── work_order_response.dart
│       ├── wo_complete_request.dart
│       └── ...
│
├── presentation/
│   ├── main_app.dart                   # Root app widget
│   ├── core/
│   │   ├── components/                 # Reusable UI components
│   │   │   ├── gradient_appbar_widget.dart
│   │   │   ├── gradient_elevated_button.dart
│   │   │   ├── custom_expansion_tile.dart
│   │   │   └── action_bottom_sheet.dart
│   │   ├── themes/
│   │   │   ├── app_theme.dart
│   │   │   └── cubit/theme_service_cubit.dart
│   │   └── resources/                  # Images, colors, etc.
│   │
│   └── pages/
│       ├── splash/
│       │   └── splash_screen.dart
│       ├── login/
│       │   ├── login_page.dart
│       │   └── cubit/login_cubit.dart
│       ├── fsm_dashboard/
│       │   ├── fsm_dashboard.dart
│       │   ├── job_list_widget.dart
│       │   └── cubit/fsm_work_orders_cubit.dart
│       ├── job_details/
│       │   ├── job_details_page.dart
│       │   ├── start_job_screen.dart
│       │   └── cubit/work_order_job_cubit.dart
│       ├── work_order/
│       │   ├── work_order_bloc.dart    # Work order state management
│       │   ├── work_order_event.dart
│       │   └── work_order_state.dart
│       ├── documents/
│       │   ├── document_bloc.dart
│       │   └── document_preview_page.dart
│       ├── calendar/
│       │   └── calendar_view.dart
│       ├── parts_management/
│       │   └── parts_management_screen.dart
│       └── profile/
│           └── profile_screen.dart
│
├── injection.dart                      # Dependency injection setup
└── main.dart                          # App entry point
```

---

## Data Models & Entities

### 1. WorkOrderEntity
Primary entity representing a work order/job.

```dart
@freezed
abstract class WorkOrderEntity with _$WorkOrderEntity {
  const factory WorkOrderEntity({
    required int id,
    @JsonKey(name: 'wo_number') required String woNumber,
    @JsonKey(name: 'sr_id') required int srId,
    @Default('') String summary,
    @Default('') @JsonKey(name: 'problem_description') String problemDescription,
    required WorkOrderPriority priority,
    @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate,
    @Default('') String location,
    required WorkOrderStatus status,
    @Default(30) @JsonKey(name: 'duration') int duration,
    @DateTimeConverter() @JsonKey(name: 'started_at') DateTime? startedAt,
    @DateTimeConverter() @JsonKey(name: 'resumed_at') DateTime? resumedAt,
    @DateTimeConverter() @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'pause_logs') dynamic pauseLogs,
    @JsonKey(name: 'work_log') String? workLog,
    @Default([]) @JsonKey(name: 'parts_used') List<WoCompletePartsUsedRequest> partsUsed,
    @Default([]) @JsonKey(name: 'images') List<String> images,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime updatedAt,
    UserEntity? createdBy,
    UserEntity? assignedTo,
    ServiceRequestEntity? serviceRequest,
  }) = _WorkOrderEntity;

  factory WorkOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderEntityFromJson(json);
}

enum WorkOrderStatus {
  @JsonValue('Completed') completed,
  @JsonValue('Paused') paused,
  @JsonValue('New') created,
  @JsonValue('Assigned') assigned,
  @JsonValue('In Progress') inProgress,
  @JsonValue('Rejected') rejected,
  @JsonValue('Reassigned') reAssigned;
}

enum WorkOrderPriority {
  @JsonValue('high') high,
  @JsonValue('medium') medium,
  @JsonValue('low') low;
}
```

### 2. UserEntity
Represents user/technician information.

```dart
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @Default('') @JsonKey(name: 'last_name') String lastName,
    required String email,
    String? phone,
    Gender? gender,
    String? city,
    @DateTimeConverter() DateTime? dob,
    @JsonKey(name: 'role_id') UserRole? roleId,
    String? role,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

enum UserRole {
  @JsonValue(0) superAdmin,
  @JsonValue(1) manager,
  @JsonValue(2) helpDesk,
  @JsonValue(3) partsManager,
  @JsonValue(4) technician,
}
```

### 3. ServiceRequestEntity
Associated service request information for a work order.

```dart
@freezed
abstract class ServiceRequestEntity with _$ServiceRequestEntity {
  const factory ServiceRequestEntity({
    @JsonKey(name: 'sr_number') required String srNumber,
    String? priority,
    @JsonKey(name: 'sr_type') required String srType,
    @JsonKey(name: 'issue_description') String? issueDescription,
    @JsonKey(name: 'machine_serial') String? machineSerial,
    String? model,
    @JsonKey(name: 'customer_name') String? customerName,
    String? location,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'under_warranty') String? underWarranty,
    @DateTimeConverter() @JsonKey(name: 'visit_date') DateTime? visitDate,
  }) = _ServiceRequestEntity;

  factory ServiceRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestEntityFromJson(json);
}
```

### 4. SparePartEntity
Represents inventory parts/materials.

```dart
@freezed
abstract class SparePartEntity with _$SparePartEntity {
  const factory SparePartEntity({
    required int id,
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'part_name') required String partName,
    String? description,
    int? quantity,
    String? category,
  }) = _SparePartEntity;

  factory SparePartEntity.fromJson(Map<String, dynamic> json) =>
      _$SparePartEntityFromJson(json);
}
```

### 5. DocumentEntity
Represents technical documents/manuals.

```dart
@freezed
abstract class DocumentEntity with _$DocumentEntity {
  const factory DocumentEntity({
    required int id,
    required String title,
    String? description,
    required String url,
    DocumentCategory? category,
    String? model,
    @DateTimeConverter() required DateTime createdAt,
  }) = _DocumentEntity;

  factory DocumentEntity.fromJson(Map<String, dynamic> json) =>
      _$DocumentEntityFromJson(json);
}

enum DocumentCategory {
  @JsonValue('manual') manual,
  @JsonValue('sop') sop,
  @JsonValue('repair_guide') repair_guide,
  @JsonValue('other') other;
}
```

---

## API Integration

### Base Configuration

```dart
// lib/core/constants.dart
abstract class AppConstants {
  static const String baseUrl = "https://your-api-domain.com/api";
  static const String refreshToken = "refresh_token";
  static const String accessToken = "access_token";
}
```

### Retrofit API Client

```dart
// lib/data/client.dart
@RestApi(baseUrl: AppConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  // Authentication
  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST('/auth/refresh-token')
  Future<RefreshTokenResponse> refreshToken(@Body() Map<String, dynamic> body);

  // Work Orders
  @GET('/work-orders')
  Future<WorkOrdersResponse> getWorkOrders({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('status') WorkOrderStatus? status,
    @Query('priority') WorkOrderPriority? priority,
  });

  @GET('/work-orders/{id}')
  Future<WorkOrderResponse> getWorkOrderById(@Path('id') int id);

  @PATCH('/work-orders/{id}/start')
  @MultiPart()
  Future<WorkOrderResponse> startWorkOrder({
    @Path('id') required int id,
    @Part(name: 'gps_coordinates') required String gpsCoordinates,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/pause')
  @MultiPart()
  Future<WorkOrderResponse> pauseWorkOrder({
    @Path('id') required int id,
    @Part(name: 'reason') required String reason,
    @Part(name: 'gps_coordinates') required String gpsCoordinates,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/resume')
  @MultiPart()
  Future<WorkOrderResponse> resumeWorkOrder({
    @Path('id') required int id,
    @Part(name: 'gps_coordinates') String? gpsCoordinates,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/complete')
  @MultiPart()
  Future<WorkOrderResponse> completeWorkOrder({
    @Path('id') required int id,
    @Part(name: 'work_log') required String workLog,
    @Part(name: 'gps_coordinates') required String gpsCoordinates,
    @Part(name: 'parts_used') required List<WoCompletePartsUsedRequest> partsUsed,
    @Part(name: 'files') List<File> files = const [],
  });

  @PATCH('/work-orders/{id}/reject')
  Future<WorkOrderResponse> rejectWorkOrder({
    @Path('id') required int id,
    @Body() required WoRejectRequest body,
  });

  // User
  @GET("/users/me")
  Future<UserEntity> getUserById();

  // Inventory
  @GET("/inventory")
  Future<InventoryResponse> getInventory();

  // Documents
  @GET("/documents")
  Future<DocumentResponse> getDocuments({
    @Query('model') String? model,
    @Query('category') DocumentCategory? category,
    @Query('keyword') String? keyword,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });
}
```

### Authentication Interceptor

```dart
// lib/core/auth_interceptor.dart
class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = serviceLocator<SharedPreferences>();
    final accessToken = prefs.getString(AppConstants.accessToken);

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token expired - attempt refresh
      final prefs = serviceLocator<SharedPreferences>();
      final refreshToken = prefs.getString(AppConstants.refreshToken);

      if (refreshToken != null) {
        try {
          final client = RestClient(_dio);
          final response = await client.refreshToken({
            'refresh_token': refreshToken,
          });

          await prefs.setString(AppConstants.accessToken, response.accessToken);

          // Retry original request
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer ${response.accessToken}';

          final retryResponse = await _dio.fetch(options);
          return handler.resolve(retryResponse);
        } catch (e) {
          // Refresh failed - logout user
          return handler.reject(err);
        }
      }
    }

    return handler.next(err);
  }
}
```

### Dependency Injection Setup

```dart
// lib/injection.dart
final serviceLocator = GetIt.I;

Future<void> init() async {
  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(() => prefs);

  // Dio
  final dio = Dio();
  serviceLocator.registerLazySingleton<Dio>(() => dio);

  // Dio Interceptors
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  ));
  dio.interceptors.add(ChuckerDioInterceptor());

  final authInterceptor = AuthInterceptor(serviceLocator<Dio>());
  serviceLocator.registerLazySingleton<AuthInterceptor>(() => authInterceptor);
  dio.interceptors.add(authInterceptor);

  dio.interceptors.add(RetryInterceptor(
    dio: dio,
    retryableExtraStatuses: {status401Unauthorized},
  ));

  // API Client
  serviceLocator.registerLazySingleton<RestClient>(
    () => RestClient(serviceLocator<Dio>())
  );

  // Location Service
  serviceLocator.registerLazySingleton<LocationService>(() => LocationService());
}
```

---

## State Management (BLoC/Cubit)

### Work Order BLoC Pattern

The app uses BLoC pattern for complex state management (work orders) and Cubit for simpler states.

#### Work Order BLoC

```dart
// lib/presentation/pages/work_order/work_order_bloc.dart

// Events
abstract class WorkOrderEvent {}

class StartWorkOrderEvent extends WorkOrderEvent {
  final int workOrderId;
  final String gpsCoordinates;
  final List<File> files;
}

class PauseWorkOrderEvent extends WorkOrderEvent {
  final int workOrderId;
  final String gpsCoordinates;
  final String reason;
  final List<File> files;
}

class ResumeWorkOrderEvent extends WorkOrderEvent {
  final int workOrderId;
  final String gpsCoordinates;
  final List<File> files;
}

class CompleteWorkOrderEvent extends WorkOrderEvent {
  final int workOrderId;
  final String gpsCoordinates;
  final String? comment;
  final List<File> files;
  final List<WoCompletePartsUsedRequest> partsUsed;
}

class RejectWorkOrderEvent extends WorkOrderEvent {
  final int workOrderId;
  final String reason;
}

// States
abstract class WorkOrderState {
  final WorkOrderEntity workOrder;
  WorkOrderState({required this.workOrder});
}

class WorkOrderAssignedState extends WorkOrderState {
  WorkOrderAssignedState({required super.workOrder});
}

class WorkOrderInProgressState extends WorkOrderState {
  WorkOrderInProgressState({required super.workOrder});
}

class WorkOrderPausedState extends WorkOrderState {
  WorkOrderPausedState({required super.workOrder});
}

class WorkOrderCompletedState extends WorkOrderState {
  WorkOrderCompletedState({required super.workOrder});
}

class WorkOrderLoadingState extends WorkOrderState {
  final String? message;
  WorkOrderLoadingState({required super.workOrder, this.message});
}

class WorkOrderRejectedState extends WorkOrderState {
  WorkOrderRejectedState({required super.workOrder});
}

// BLoC
class WorkOrderBloc extends Bloc<WorkOrderEvent, WorkOrderState> {
  final RestClient _restClient = serviceLocator<RestClient>();
  final LocationService _locationService = serviceLocator<LocationService>();

  WorkOrderBloc(WorkOrderEntity workOrder)
      : super(WorkOrderAssignedState(workOrder: workOrder)) {
    on<StartWorkOrderEvent>(_onStartWorkOrder);
    on<PauseWorkOrderEvent>(_onPauseWorkOrder);
    on<ResumeWorkOrderEvent>(_onResumeWorkOrder);
    on<CompleteWorkOrderEvent>(_onCompleteWorkOrder);
    on<RejectWorkOrderEvent>(_onRejectWorkOrder);
  }

  Future<void> _onStartWorkOrder(
      StartWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Starting Work Order.."));
    try {
      final res = await _restClient.startWorkOrder(
        id: event.workOrderId,
        gpsCoordinates: event.gpsCoordinates,
        files: event.files,
      );
      emit(WorkOrderInProgressState(
          workOrder: res.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderAssignedState(workOrder: state.workOrder));
    }
  }

  Future<void> _onCompleteWorkOrder(
      CompleteWorkOrderEvent event, Emitter<WorkOrderState> emit) async {
    emit(WorkOrderLoadingState(
        workOrder: state.workOrder, message: "Completing Work Order.."));
    try {
      final res = await _restClient.completeWorkOrder(
        id: event.workOrderId,
        gpsCoordinates: event.gpsCoordinates,
        workLog: event.comment ?? "",
        files: event.files,
        partsUsed: event.partsUsed,
      );
      emit(WorkOrderCompletedState(
          workOrder: res.workOrder.copyWith(
        serviceRequest: state.workOrder.serviceRequest,
      )));
    } catch (e) {
      emit(WorkOrderInProgressState(workOrder: state.workOrder));
    }
  }
}
```

### Dashboard Cubit

```dart
// lib/presentation/pages/fsm_dashboard/cubit/fsm_work_orders_cubit.dart

part 'fsm_work_orders_state.dart';

class FsmWorkOrdersCubit extends Cubit<FsmWorkOrdersState> {
  FsmWorkOrdersCubit() : super(FsmWorkOrderInitial());
  final RestClient _restClient = serviceLocator<RestClient>();

  final Set<WorkOrderStatus> _loadedStatuses = {};

  Future<void> workOrder(int page, int limit, WorkOrderStatus status) async {
    // Cache check
    if (_loadedStatuses.contains(status)) {
      if (state is FsmWorkOrdersSuccess) {
        final currentState = state as FsmWorkOrdersSuccess;
        emit(currentState.copyWith(activeStatus: status));
        return;
      }
    }

    emit(FsmWorkOrdersLoading(status: status));
    try {
      final response = await _restClient.getWorkOrders(
        page: page,
        limit: limit,
      );

      Map<WorkOrderStatus, List<WorkOrderEntity>> workOrderMap;

      if (state is FsmWorkOrdersSuccess) {
        workOrderMap = Map.from((state as FsmWorkOrdersSuccess).workOrderMap);
      } else {
        workOrderMap = {
          WorkOrderStatus.assigned: [],
          WorkOrderStatus.inProgress: [],
          WorkOrderStatus.paused: [],
          WorkOrderStatus.completed: [],
          WorkOrderStatus.created: [],
        };
      }

      // Group work orders by status
      for (var workOrder in response.workOrders) {
        if (!workOrderMap.containsKey(workOrder.status)) {
          workOrderMap[workOrder.status] = [];
        }
        workOrderMap[workOrder.status]!.add(workOrder);

        // Handle reassigned status
        if (workOrder.status == WorkOrderStatus.reAssigned) {
          workOrderMap[WorkOrderStatus.assigned]!.add(workOrder);
        }
      }

      _loadedStatuses.add(status);

      emit(FsmWorkOrdersSuccess(
        workOrderMap: workOrderMap,
        activeStatus: status,
        page: response.page,
        total: response.total,
      ));
    } catch (e) {
      emit(FsmWorkOrdersFailure(error: e.toString(), status: status));
    }
  }

  Future<void> refreshWorkOrders(
      int page, int limit, WorkOrderStatus status) async {
    _loadedStatuses.remove(status);
    emit(FsmWorkOrdersLoading(status: status, isRefreshing: true));
    // ... similar logic with cache clearing
  }
}
```

---

## UI/UX Flows & Navigation

### 1. App Initialization Flow

```
main()
  → MultiBlocProvider setup
  → MyApp (MaterialApp)
  → SplashScreen
    ├─ Check access token in SharedPreferences
    ├─ If token exists → FSMDashboardPage
    └─ If no token → LoginPage
```

**Code Example:**

```dart
// lib/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();  // Initialize dependency injection

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeServiceCubit()),
          BlocProvider(create: (_) => LoginCubit()),
          BlocProvider(create: (_) => FsmWorkOrdersCubit()),
          BlocProvider(create: (_) => WorkOrderJobCubit()),
          BlocProvider(create: (_) => PartsManagementCubit()),
          BlocProvider(create: (_) => ProfileCubit()),
          BlocProvider(create: (_) => DocumentBloc()),
        ],
        child: const MyApp(),
      ),
    );
  });
}
```

```dart
// lib/presentation/pages/splash/splash_screen.dart
class _SplashScreenPageState extends State<SplashScreenPage> {
  startDelay() {
    Timer(const Duration(seconds: 2), getInitialScreens);
  }

  getInitialScreens() async {
    sharedPreferences = serviceLocator<SharedPreferences>();
    final accessToken = sharedPreferences.getString(AppConstants.accessToken);

    final hasToken = accessToken != null;

    if (!hasToken) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage())
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => FSMDashboardPage()),
        (route) => false
      );
    }
  }
}
```

### 2. Authentication Flow

```
LoginPage
  ├─ User enters email/password
  ├─ Form validation
  ├─ LoginCubit.loginUser()
  │   ├─ API call to /auth/login
  │   ├─ Save tokens to SharedPreferences
  │   └─ Emit LoginSuccessState
  └─ Navigate to FSMDashboardPage
```

**Code Example:**

```dart
// lib/presentation/pages/login/login_page.dart
GradientElevatedButton(
  onPressed: () async {
    setState(() { validated = true; });

    if (_formKey.currentState!.validate()) {
      setState(() { isLoading = true; });

      final username = emailController.text;
      final password = passwordController.text;

      final cubit = context.read<LoginCubit>();
      final profile = context.read<ProfileCubit>();

      await cubit.loginUser(username, password);
      profile.fetchUser();

      setState(() { isLoading = false; });
    }
  },
  child: isLoading
      ? CircularProgressIndicator()
      : Text("Login"),
),

// BlocConsumer listener
BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is LoginSuccessState) {
      if (state.user.roleId == UserRole.technician) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FSMDashboardPage())
        );
      } else {
        showCustomSnackbar(
          context,
          "Please use webportal for authentication."
        );
      }
    }
    if (state is LoginErrorState) {
      showCustomSnackbar(context, state.errorMessage);
    }
  },
  builder: (context, state) {
    // ... UI
  },
)
```

### 3. Dashboard Flow

```
FSMDashboardPage
  ├─ TabController with 4 tabs
  │   ├─ Assigned
  │   ├─ In Progress
  │   ├─ Paused
  │   └─ Completed
  ├─ Stats Cards (count per status)
  ├─ FsmWorkOrdersCubit.workOrder(page, limit, status)
  └─ Display work orders in InfiniteList
      └─ JobListWidget for each work order
          └─ Tap → Navigate to JobDetailsPage
```

**Code Example:**

```dart
// lib/presentation/pages/fsm_dashboard/fsm_dashboard.dart
class _FSMDashboardPageState extends State<FSMDashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: initialTabIndex
    );
    _tabController.addListener(_onTabChanged);

    context.read<FsmWorkOrdersCubit>().workOrder(
      _page,
      _limit,
      widget.initialStatus
    );
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      WorkOrderStatus newStatus;
      switch (_tabController.index) {
        case 0: newStatus = WorkOrderStatus.assigned; break;
        case 1: newStatus = WorkOrderStatus.inProgress; break;
        case 2: newStatus = WorkOrderStatus.paused; break;
        case 3: newStatus = WorkOrderStatus.completed; break;
        default: newStatus = WorkOrderStatus.assigned;
      }
      context.read<FsmWorkOrdersCubit>().workOrder(_page, _limit, newStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Job List")),
      body: Column(
        children: [
          // Stats Cards
          BlocBuilder<FsmWorkOrdersCubit, FsmWorkOrdersState>(
            builder: (context, state) {
              if (state is FsmWorkOrdersSuccess) {
                return Row(
                  children: [
                    _buildStatsCard("Assigned",
                      state.workOrderMap[WorkOrderStatus.assigned]?.length.toString() ?? "0"),
                    _buildStatsCard("In Progress",
                      state.workOrderMap[WorkOrderStatus.inProgress]?.length.toString() ?? "0"),
                    // ... more stats
                  ],
                );
              }
              return Row(/* placeholder stats */);
            },
          ),

          // TabBar
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Assigned", icon: Icon(Icons.not_started_outlined)),
              Tab(text: "In Progress", icon: Icon(Icons.autorenew_rounded)),
              Tab(text: "Paused", icon: Icon(Icons.pause_rounded)),
              Tab(text: "Closed", icon: Icon(Icons.check_circle_outline)),
            ],
          ),

          // TabBarView with work order lists
          Expanded(
            child: BlocBuilder<FsmWorkOrdersCubit, FsmWorkOrdersState>(
              builder: (context, state) {
                if (state is FsmWorkOrdersSuccess) {
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      _buildTabContent(WorkOrderStatus.assigned, state),
                      _buildTabContent(WorkOrderStatus.inProgress, state),
                      _buildTabContent(WorkOrderStatus.paused, state),
                      _buildTabContent(WorkOrderStatus.completed, state),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(WorkOrderStatus status, FsmWorkOrdersSuccess state) {
    final workOrders = state.workOrderMap[status] ?? [];

    if (workOrders.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => _refreshData(status),
        child: NoDataWidget(title: status.toString()),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _refreshData(status),
      child: InfiniteList(
        itemCount: workOrders.length,
        onFetchData: () {},
        itemBuilder: (context, index) {
          final workOrder = workOrders[index];
          return JobListWidget(workOrder: workOrder, status: status);
        },
      ),
    );
  }
}
```

### 4. Work Order Lifecycle Flow

```
JobDetailsPage (View work order details)
  │
  ├─ Status: ASSIGNED
  │   ├─ "Reject" button → ActionBottomSheet (reject with reason)
  │   └─ "Start" button → ActionBottomSheet (capture location + photos)
  │       └─ WorkOrderBloc.add(StartWorkOrderEvent)
  │           └─ Status changes to IN_PROGRESS
  │               └─ Navigate to StartJobScreen
  │
  ├─ Status: IN_PROGRESS
  │   └─ "Open" button → Navigate to StartJobScreen
  │       ├─ Select materials/parts used
  │       ├─ Capture GPS location
  │       ├─ Add photos
  │       ├─ Enter work log comments
  │       ├─ "Pause" button → PauseWorkOrderDialog
  │       │   └─ WorkOrderBloc.add(PauseWorkOrderEvent)
  │       │       └─ Status changes to PAUSED
  │       └─ "Complete" button → CompleteWorkOrderEvent
  │           └─ Status changes to COMPLETED
  │               └─ Navigate back to Dashboard (Completed tab)
  │
  └─ Status: PAUSED
      ├─ "Reject" button → ActionBottomSheet (cancel/reject)
      └─ "Resume" button → ActionBottomSheet (capture location)
          └─ WorkOrderBloc.add(ResumeWorkOrderEvent)
              └─ Status changes to IN_PROGRESS
```

**Code Example - Job Details Page:**

```dart
// lib/presentation/pages/job_details/job_details_page.dart
floatingActionButton: BlocBuilder<WorkOrderBloc, WorkOrderState>(
  builder: (context, state) {
    final bloc = context.read<WorkOrderBloc>();
    return Container(
      child: Row(
        children: [
          // Reject/Cancel button
          if (state.workOrder.status == WorkOrderStatus.assigned ||
              state.workOrder.status == WorkOrderStatus.paused)
            Expanded(
              child: GradientElevatedButton(
                onPressed: () async {
                  final res = await showModalBottomSheet<bool>(
                    context: context,
                    builder: (context) => BlocProvider.value(
                      value: bloc,
                      child: ActionBottomSheet(
                        actionType: state.workOrder.status == WorkOrderStatus.assigned
                            ? ActionType.reject
                            : ActionType.cancel,
                      ),
                    ),
                  );
                  if (res == true) Navigator.of(context).pop();
                },
                backgroundColor: Colors.redAccent,
                child: Text(getBtnLabel2(state.workOrder.status)),
              )
            ),

          // Start/Resume/Open button
          Expanded(
            child: GradientElevatedButton(
              child: Text(getBtnLabel(state.workOrder.status)),
              onPressed: () async {
                if (state.workOrder.status == WorkOrderStatus.completed) return;

                if (state.workOrder.status == WorkOrderStatus.inProgress) {
                  // Navigate directly to StartJobScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: StartJobScreen(workOrderId: state.workOrder.id),
                      ),
                    ),
                  );
                  return;
                }

                // Show bottom sheet for Start/Resume actions
                final res = await showModalBottomSheet<bool>(
                  context: context,
                  builder: (context) => BlocProvider.value(
                    value: bloc,
                    child: ActionBottomSheet(
                      actionType: state.workOrder.status == WorkOrderStatus.assigned
                          ? ActionType.start
                          : ActionType.resume,
                    ),
                  ),
                );

                if (res == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: bloc,
                        child: StartJobScreen(workOrderId: state.workOrder.id),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  },
),

String getBtnLabel(WorkOrderStatus status) {
  switch (status) {
    case WorkOrderStatus.assigned:
    case WorkOrderStatus.reAssigned:
      return 'Start';
    case WorkOrderStatus.inProgress:
      return 'Open';
    case WorkOrderStatus.paused:
      return 'Resume';
    case WorkOrderStatus.completed:
      return 'Completed';
    default:
      return 'Unknown';
  }
}
```

**Code Example - Start Job Screen (Work In Progress):**

```dart
// lib/presentation/pages/job_details/start_job_screen.dart
class _StartJobScreenState extends State<StartJobScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentsController = TextEditingController();

  List<SparePartEntity> materialUsedList = [];
  List<SparePartEntity> selectedMaterials = [];
  List<XFile> _imageFiles = [];
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    // Fetch inventory/parts list
    _client.getInventory().then((response) {
      setState(() {
        materialUsedList = response.parts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<WorkOrderBloc>();

    return BlocConsumer<WorkOrderBloc, WorkOrderState>(
      listener: (context, state) {
        if (state is WorkOrderCompletedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Work Order Completed Successfully!")),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FSMDashboardPage(
                initialStatus: WorkOrderStatus.completed,
              ),
            ),
          );
        }
        if (state is WorkOrderPausedState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => FSMDashboardPage(
                initialStatus: WorkOrderStatus.paused,
              ),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: GradientAppBar(title: Text("Job ID - ${widget.workOrderId}")),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Location status indicator
                  Container(
                    decoration: BoxDecoration(
                      color: _currentLocation != null
                        ? Colors.green.shade100
                        : Colors.amber.shade100,
                    ),
                    child: Row(
                      children: [
                        Icon(_currentLocation != null
                          ? Icons.location_on
                          : Icons.location_searching),
                        Text(_currentLocation != null
                          ? "Location successfully captured"
                          : "Waiting for location..."),
                      ],
                    ),
                  ),

                  // Materials/Parts selection
                  InkWell(
                    onTap: _openSelectionBottomSheetForMaterials,
                    child: CustomDropDownFormField(
                      label: "Materials(Parts) Used",
                      items: [],
                    ),
                  ),

                  // Selected materials chips
                  Wrap(
                    children: selectedMaterials.map((item) {
                      return Chip(
                        label: Text("${item.partName}\n(${item.partNumber})"),
                        backgroundColor: Colors.green,
                      );
                    }).toList(),
                  ),

                  // Map showing current location
                  Container(
                    height: 100,
                    child: _currentLocation == null
                        ? CircularProgressIndicator()
                        : FlutterMap(
                            options: MapOptions(
                              initialCenter: _currentLocation!,
                              initialZoom: 15.0,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: _currentLocation!,
                                    child: Icon(Icons.location_on, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),

                  // Work log text field
                  TextFormField(
                    maxLines: 3,
                    controller: _commentsController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "General comments cannot be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text("General Comments *"),
                      hintText: 'Enter General Comments',
                    ),
                  ),

                  // Image capture
                  Wrap(
                    children: [
                      ..._imageFiles.map((image) => Image.file(File(image.path))),
                      GestureDetector(
                        onTap: () => _getImage(ImageSource.camera),
                        child: Container(
                          child: Icon(Icons.add_a_photo_outlined),
                        ),
                      ),
                    ],
                  ),

                  // Action buttons
                  Row(
                    children: [
                      // Pause button
                      Expanded(
                        child: PauseWorkOrderProvider(
                          requestId: widget.workOrderId,
                        ),
                      ),

                      // Complete button
                      Expanded(
                        child: GradientElevatedButton(
                          onPressed: _currentLocation == null
                              ? () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(
                                      "Please wait for location to load"
                                    )),
                                  );
                                }
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Confirm completion?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              final event = CompleteWorkOrderEvent(
                                                workOrderId: widget.workOrderId,
                                                gpsCoordinates: jsonEncode([
                                                  _currentLocation?.latitude,
                                                  _currentLocation?.longitude
                                                ]),
                                                comment: _commentsController.text,
                                                files: _imageFiles.map((e) => File(e.path)).toList(),
                                                partsUsed: selectedMaterials.map((e) =>
                                                  WoCompletePartsUsedRequest(e.partNumber, 1)
                                                ).toList(),
                                              );
                                              bloc.add(event);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Complete"),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                          child: Text("Complete"),
                        ),
                      ),
                    ],
                  ),

                  // Help button
                  TextButton(
                    onPressed: _showDocumentActionSheet,
                    child: Text("Need Help?"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
```

### 5. Navigation to Other Features

**Drawer Navigation:**

```dart
// lib/presentation/pages/fsm_dashboard/fsm_dashboard_drawer.dart
Drawer(
  child: ListView(
    children: [
      DrawerHeader(/* User info */),

      ListTile(
        leading: Icon(Icons.calendar_today),
        title: Text("Calendar"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalendarPage()),
          );
        },
      ),

      ListTile(
        leading: Icon(Icons.inventory),
        title: Text("Parts Management"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartsManagementScreen()),
          );
        },
      ),

      ListTile(
        leading: Icon(Icons.description),
        title: Text("Documents"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DocumentsPage()),
          );
        },
      ),

      ListTile(
        leading: Icon(Icons.person),
        title: Text("Profile"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserProfileScreen()),
          );
        },
      ),

      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        onTap: () async {
          final prefs = serviceLocator<SharedPreferences>();
          await prefs.clear();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false,
          );
        },
      ),
    ],
  ),
)
```

---

## Core Features Implementation

### 1. Location Services

```dart
// lib/core/services/location_service.dart
import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<LocationData> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location service is enabled
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location service is disabled');
      }
    }

    // Check location permissions
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permission denied');
      }
    }

    // Get current location
    return await _location.getLocation();
  }

  Stream<LocationData> getLocationStream() {
    return _location.onLocationChanged;
  }
}
```

### 2. Image Picker Integration

```dart
// Usage in StartJobScreen
Future<void> _getImage(ImageSource source) async {
  try {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(pickedFile);
      });
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error picking image: $e')),
    );
  }
}
```

### 3. Document Management with Search & Filters

```dart
// lib/presentation/pages/documents/document_bloc.dart
class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final RestClient _client = serviceLocator<RestClient>();
  static const int _limit = 20;

  DocumentBloc() : super(const DocumentState()) {
    on<DocumentsRequested>(_onDocumentsRequested);
    on<DocumentsSearchRequested>(_onDocumentsSearchRequested);
    on<DocumentsCategoryFilterRequested>(_onDocumentsCategoryFilterRequested);
    on<DocumentsLoadMore>(_onDocumentsLoadMore);
  }

  Future<void> _onDocumentsSearchRequested(
    DocumentsSearchRequested event,
    Emitter<DocumentState> emit,
  ) async {
    emit(state.copyWith(
      keyword: event.keyword,
      documents: [],
      currentPage: 1,
      status: DocumentStatus.loading,
    ));

    try {
      final response = await _client.getDocuments(
        page: 1,
        limit: _limit,
        keyword: event.keyword.isEmpty ? null : event.keyword,
        category: state.selectedCategory,
        model: state.selectedModel,
      );

      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: response.documents,
        hasReachedMax: response.documents.length < _limit,
        total: response.total,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: DocumentStatus.failure,
        error: error.toString(),
      ));
    }
  }

  Future<void> _onDocumentsLoadMore(
    DocumentsLoadMore event,
    Emitter<DocumentState> emit,
  ) async {
    if (state.hasReachedMax || state.status == DocumentStatus.loading) return;

    final nextPage = state.currentPage + 1;

    try {
      final response = await _client.getDocuments(
        page: nextPage,
        limit: _limit,
        keyword: state.keyword.isEmpty ? null : state.keyword,
        category: state.selectedCategory,
        model: state.selectedModel,
      );

      final newDocuments = [...state.documents, ...response.documents];

      emit(state.copyWith(
        status: DocumentStatus.success,
        documents: newDocuments,
        hasReachedMax: response.documents.length < _limit,
        currentPage: nextPage,
      ));
    } catch (error) {
      emit(state.copyWith(status: DocumentStatus.failure));
    }
  }
}
```

### 4. Calendar View Integration

```dart
// lib/presentation/pages/calendar/calendar_view.dart
import 'package:calendar_view/calendar_view.dart';

class CalendarViewContent extends StatefulWidget {
  @override
  State<CalendarViewContent> createState() => _CalendarViewContentState();
}

class _CalendarViewContentState extends State<CalendarViewContent> {
  final EventController<WorkOrderEntity> _eventController =
      EventController<WorkOrderEntity>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarCubit, CalendarState>(
      listener: (context, state) {
        if (state is CalendarSuccess) {
          final events = <CalendarEventData<WorkOrderEntity>>[];

          for (final workOrder in state.workOrders) {
            if (workOrder.visitDate != null) {
              final startTime = workOrder.visitDate!;
              final endTime = startTime.add(Duration(minutes: workOrder.duration));

              events.add(CalendarEventData<WorkOrderEntity>(
                title: workOrder.summary,
                description: workOrder.problemDescription,
                date: startTime,
                startTime: startTime,
                endTime: endTime,
                event: workOrder,
              ));
            }
          }

          _eventController.removeWhere((_) => true);
          _eventController.addAll(events);
        }
      },
      builder: (context, state) {
        return DayView<WorkOrderEntity>(
          controller: _eventController,
          showVerticalLine: true,
          showLiveTimeLineInAllDays: true,
          initialDay: DateTime.now(),
          heightPerMinute: 3,
          onEventTap: (eventList, date) {
            if (eventList.isNotEmpty) {
              final workOrder = eventList.first.event;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => WorkOrderBloc(workOrder!),
                    child: JobDetailsPage(),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
```

---

## Theme & Styling

### App Theme Configuration

```dart
// lib/presentation/core/themes/app_theme.dart
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.initialColor,
        brightness: Brightness.light,
      ),
      fontFamily: 'Inter',
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.initialColor,
        brightness: Brightness.dark,
      ),
      fontFamily: 'Inter',
    );
  }
}

class AppColors {
  static const Color initialColor = Color(0xFF1E88E5);
  static const Color finalColor = Color(0xFF42A5F5);
  static const Color whiteColor = Colors.white;
}
```

### Gradient Components

```dart
// lib/presentation/core/components/gradient_appbar_widget.dart
class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const GradientAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.00, 0.00),
            end: Alignment(-1, 0),
            colors: [AppColors.initialColor, AppColors.finalColor],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// lib/presentation/core/components/gradient_elevated_button.dart
class GradientElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundColor == null
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.initialColor, AppColors.finalColor],
              ),
              borderRadius: BorderRadius.circular(8.0),
            )
          : BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
```

---

## Additional Implementation Details

### Error Handling

```dart
// Global error handler for API calls
try {
  final response = await _restClient.someApiCall();
  // Handle success
} on DioException catch (e) {
  if (e.response != null) {
    // Server returned an error response
    final statusCode = e.response?.statusCode;
    final errorMessage = e.response?.data['message'] ?? 'Unknown error';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  } else {
    // Network error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Network error. Please check your connection.')),
    );
  }
} catch (e) {
  // Other errors
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('An unexpected error occurred')),
  );
}
```

### Form Validation

```dart
// lib/presentation/core/form_errors/form_error.dart
const String emailNullError = "Please enter your email";
const String invalidEmailError = "Please enter a valid email";
const String passWordNullError = "Please enter your password";
const String shortPassError = "Password must be at least 6 characters";

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

// Usage
TextFormField(
  validator: (value) {
    if (value!.isEmpty) {
      return emailNullError;
    } else if (!emailValidatorRegExp.hasMatch(value)) {
      return invalidEmailError;
    }
    return null;
  },
  decoration: InputDecoration(
    labelText: "Email ID",
    hintText: "Enter Your Email",
  ),
)
```

---

## Build & Run Instructions

### 1. Code Generation

```bash
# Generate freezed and json_serializable code
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode for continuous generation during development
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 2. Run the App

```bash
# Debug mode
flutter run

# Release mode
flutter run --release

# For specific device
flutter run -d <device_id>
```

### 3. Build APK/IPA

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

---

## Key Implementation Notes

1. **State Preservation**: The app uses `WorkOrderBloc` to maintain work order state across navigation. Always pass the bloc instance using `BlocProvider.value()` when navigating.

2. **Location Requirements**: Location must be captured before starting, pausing, resuming, or completing a work order. The UI should disable actions until location is available.

3. **Image Attachments**: Images are optional for most operations but can be required based on business rules.

4. **Offline Capability**: Consider implementing local database (SQLite/Hive) for offline work order access and sync queue.

5. **Real-time Updates**: Socket.io client is included for potential real-time work order updates from the backend.

6. **Token Refresh**: The `AuthInterceptor` automatically handles token refresh on 401 responses.

7. **Network Logging**: Chucker is integrated for debugging API calls in development builds.

---

## Testing Recommendations

1. **Unit Tests**: Test BLoC/Cubit logic independently
2. **Widget Tests**: Test UI components and user interactions
3. **Integration Tests**: Test complete flows (login → work order completion)
4. **API Mocking**: Use `mockito` or `http_mock_adapter` for testing

---

## Future Enhancements

1. **Offline-First Architecture**: Implement local caching with sync queue
2. **Push Notifications**: Firebase Cloud Messaging for work order assignments
3. **Signature Capture**: Customer signature on completion
4. **Route Optimization**: Map-based routing for multiple work orders
5. **Voice Notes**: Audio recording for work logs
6. **Analytics**: Track technician performance metrics
7. **Multi-language Support**: Internationalization (i18n)

---

## Conclusion

This documentation provides a comprehensive blueprint for rebuilding the FSM mobile application from scratch. The architecture emphasizes:

- **Clean Code**: Separation of concerns with clear layer boundaries
- **Scalability**: Easy to add new features and maintain
- **Testability**: BLoC pattern enables easy unit testing
- **User Experience**: Responsive design with proper loading and error states
- **Performance**: Efficient state management and API call optimization

For questions or clarifications on specific implementations, refer to the code examples provided throughout this document.
