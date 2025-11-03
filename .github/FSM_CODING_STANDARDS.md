# FSM Coding Standards

## Code Style and Conventions

### File Naming

```
✅ DO:
- snake_case for files: work_order_bloc.dart
- Match class name: WorkOrderBloc → work_order_bloc.dart
- Use descriptive names: work_order_repository_impl.dart

❌ DON'T:
- camelCase: workOrderBloc.dart
- Abbreviations: wo_bloc.dart
- Generic names: repository.dart
```

### Class Naming

```dart
✅ DO:
class WorkOrderBloc extends Bloc<WorkOrderEvent, WorkOrderState> {}
abstract class IWorkOrderRepository {}
class WorkOrderRepositoryImpl implements IWorkOrderRepository {}
class WorkOrderDto extends WorkOrder {}

❌ DON'T:
class workorder_bloc {}  // Wrong case
class WOBloc {}          // Unclear abbreviation
class Repository {}      // Too generic
```

### Variable Naming

```dart
✅ DO:
final workOrder = WorkOrder();
const maxRetryCount = 3;
bool isLoading = false;
List<WorkOrder> workOrders = [];

❌ DON'T:
final wo = WorkOrder();      // Unclear abbreviation
const MAX_RETRY_COUNT = 3;   // Wrong case
bool loading = false;        // Missing 'is' prefix
var orders = [];             // Use explicit types
```

## Architecture Patterns

### Domain Layer Rules

```dart
// ✅ DO: Pure business entities
@freezed
class WorkOrder with _$WorkOrder {
  const factory WorkOrder({
    required String id,
    required String title,
    required WorkOrderStatus status,
  }) = _WorkOrder;
}

// ❌ DON'T: Include framework dependencies
class WorkOrder {
  final String id;
  final BuildContext context;  // ❌ No UI dependencies
  final Dio dio;               // ❌ No data layer dependencies
}

// ✅ DO: Abstract repository interfaces with 'I' prefix
abstract class IWorkOrderRepository {
  Future<Either<Failure, List<WorkOrder>>> getWorkOrders();
}

// ✅ DO: Single-responsibility use cases
class GetWorkOrders {
  final IWorkOrderRepository repository;
  
  GetWorkOrders(this.repository);
  
  Future<Either<Failure, List<WorkOrder>>> call() {
    return repository.getWorkOrders();
  }
}
```

### Data Layer Rules

```dart
// ✅ DO: DTOs with serialization
@freezed
class WorkOrderDto with _$WorkOrderDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkOrderDto({
    required String id,
    required String title,
  }) = _WorkOrderDto;
  
  factory WorkOrderDto.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderDtoFromJson(json);
      
  // Map to domain entity
  WorkOrder toEntity() => WorkOrder(id: id, title: title);
}

// ✅ DO: Separate remote and local data sources
abstract class WorkOrderRemoteDataSource {
  Future<List<WorkOrderDto>> getWorkOrders();
}

abstract class WorkOrderLocalDataSource {
  Future<List<WorkOrderDto>> getCachedWorkOrders();
  Future<void> cacheWorkOrders(List<WorkOrderDto> workOrders);
}

// ✅ DO: Repository implements domain interface
@LazySingleton(as: IWorkOrderRepository)
class WorkOrderRepositoryImpl implements IWorkOrderRepository {
  final WorkOrderRemoteDataSource remoteDataSource;
  final WorkOrderLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  WorkOrderRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.networkInfo,
  );
  
  @override
  Future<Either<Failure, List<WorkOrder>>> getWorkOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final dtos = await remoteDataSource.getWorkOrders();
        final entities = dtos.map((dto) => dto.toEntity()).toList();
        await localDataSource.cacheWorkOrders(dtos);
        return Right(entities);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      try {
        final dtos = await localDataSource.getCachedWorkOrders();
        final entities = dtos.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } catch (e) {
        return Left(CacheFailure(e.toString()));
      }
    }
  }
}
```

### Presentation Layer Rules

```dart
// ✅ DO: Use freezed for BLoC events and states
@freezed
class WorkOrderEvent with _$WorkOrderEvent {
  const factory WorkOrderEvent.load() = _Load;
  const factory WorkOrderEvent.refresh() = _Refresh;
  const factory WorkOrderEvent.delete(String id) = _Delete;
}

@freezed
class WorkOrderState with _$WorkOrderState {
  const factory WorkOrderState.initial() = _Initial;
  const factory WorkOrderState.loading() = _Loading;
  const factory WorkOrderState.loaded(List<WorkOrder> orders) = _Loaded;
  const factory WorkOrderState.error(String message) = _Error;
}

// ✅ DO: Inject dependencies via constructor
@injectable
class WorkOrderBloc extends Bloc<WorkOrderEvent, WorkOrderState> {
  final GetWorkOrders getWorkOrders;
  final DeleteWorkOrder deleteWorkOrder;
  
  WorkOrderBloc(
    this.getWorkOrders,
    this.deleteWorkOrder,
  ) : super(const WorkOrderState.initial()) {
    on<_Load>(_onLoad);
    on<_Delete>(_onDelete);
  }
  
  Future<void> _onLoad(_Load event, Emitter<WorkOrderState> emit) async {
    emit(const WorkOrderState.loading());
    
    final result = await getWorkOrders();
    
    result.fold(
      (failure) => emit(WorkOrderState.error(failure.message)),
      (orders) => emit(WorkOrderState.loaded(orders)),
    );
  }
}

// ✅ DO: Use @RoutePage() for pages
@RoutePage()
class WorkOrdersPage extends StatelessWidget {
  const WorkOrdersPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkOrderBloc>()
        ..add(const WorkOrderEvent.load()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Work Orders')),
        body: BlocBuilder<WorkOrderBloc, WorkOrderState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const LoadingIndicator(),
              loaded: (orders) => WorkOrderList(orders: orders),
              error: (message) => ErrorView(message: message),
            );
          },
        ),
      ),
    );
  }
}

// ✅ DO: Extract widgets for reusability
class WorkOrderList extends StatelessWidget {
  final List<WorkOrder> orders;
  
  const WorkOrderList({super.key, required this.orders});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return WorkOrderCard(order: orders[index]);
      },
    );
  }
}
```

## Theme and Styling

```dart
// ✅ DO: Use theme system
Container(
  padding: EdgeInsets.all(AppDimensions.paddingMedium),
  decoration: BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
  ),
  child: Text(
    'Work Order',
    style: AppTextStyles.titleMedium,
  ),
)

// ❌ DON'T: Hardcode values
Container(
  padding: EdgeInsets.all(16),  // ❌
  decoration: BoxDecoration(
    color: Color(0xFF116587),   // ❌
    borderRadius: BorderRadius.circular(8),  // ❌
  ),
  child: Text(
    'Work Order',
    style: TextStyle(fontSize: 16),  // ❌
  ),
)

// ✅ DO: Use responsive units
Text(
  'Title',
  style: TextStyle(fontSize: 16.sp),  // Responsive
)

Padding(
  padding: EdgeInsets.all(16.w),  // Responsive
)

// ✅ DO: Use theme extensions
final fsmTheme = context.fsmTheme;
Container(
  color: fsmTheme.workOrderCardBackground,
  child: Text(
    'Status',
    style: TextStyle(color: fsmTheme.getStatusColor('in_progress')),
  ),
)
```

## Error Handling

```dart
// ✅ DO: Use Either for error handling
Future<Either<Failure, WorkOrder>> getWorkOrder(String id) async {
  try {
    final result = await api.getWorkOrder(id);
    return Right(result);
  } on DioException catch (e) {
    return Left(ServerFailure(e.message ?? 'Unknown error'));
  } catch (e) {
    return Left(UnknownFailure(e.toString()));
  }
}

// ✅ DO: Define custom failure types
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');
}

// ✅ DO: Handle errors in presentation layer
result.fold(
  (failure) {
    // Show error to user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(failure.message)),
    );
  },
  (data) {
    // Update UI with data
    emit(LoadedState(data));
  },
);
```

## Dependency Injection

```dart
// ✅ DO: Use appropriate scopes
@singleton  // Single instance for entire app lifetime
class AuthService {}

@lazySingleton  // Created on first access, then reused
class ApiClient {}

@injectable  // New instance every time
class WorkOrderBloc {}

// ✅ DO: Create modules for third-party dependencies
@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() => Dio(
    BaseOptions(baseUrl: AppConfig.baseUrl),
  );
  
  @lazySingleton
  @Named('authDio')
  Dio provideAuthDio(AuthInterceptor interceptor) => Dio()
    ..interceptors.add(interceptor);
}

// ✅ DO: Use interfaces for testability
@LazySingleton(as: IWorkOrderRepository)
class WorkOrderRepositoryImpl implements IWorkOrderRepository {}

// ✅ DO: Use @preResolve for async initialization
@preResolve
@singleton
class DatabaseService {
  final Future<Database> database;
  
  DatabaseService._(this.database);
  
  @factoryMethod
  static Future<DatabaseService> create() async {
    final db = await openDatabase('fsm.db');
    return DatabaseService._(Future.value(db));
  }
}
```

## Code Organization

```dart
// ✅ DO: Use barrel files for exports
// lib/features/work_orders/domain/domain.dart
export 'entities/work_order.dart';
export 'repositories/i_work_order_repository.dart';
export 'usecases/get_work_orders.dart';

// ✅ DO: Group imports
// Dart imports
import 'dart:async';
import 'dart:convert';

// Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports
import 'package:fsm/core/core.dart';
import 'package:fsm/features/work_orders/domain/domain.dart';

// ❌ DON'T: Mix import types
import 'package:flutter/material.dart';
import 'package:fsm/core/core.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
```

## Testing Standards

```dart
// ✅ DO: Test domain logic thoroughly
group('GetWorkOrders', () {
  late MockWorkOrderRepository mockRepository;
  late GetWorkOrders useCase;
  
  setUp(() {
    mockRepository = MockWorkOrderRepository();
    useCase = GetWorkOrders(mockRepository);
  });
  
  test('should return list of work orders on success', () async {
    // Arrange
    final workOrders = [WorkOrder(id: '1', title: 'Test')];
    when(() => mockRepository.getWorkOrders())
        .thenAnswer((_) async => Right(workOrders));
    
    // Act
    final result = await useCase();
    
    // Assert
    expect(result, Right(workOrders));
    verify(() => mockRepository.getWorkOrders()).called(1);
  });
});

// ✅ DO: Test BLoCs with bloc_test
blocTest<WorkOrderBloc, WorkOrderState>(
  'emits [loading, loaded] when load event is successful',
  build: () {
    when(() => mockGetWorkOrders())
        .thenAnswer((_) async => Right([workOrder]));
    return WorkOrderBloc(mockGetWorkOrders);
  },
  act: (bloc) => bloc.add(const WorkOrderEvent.load()),
  expect: () => [
    const WorkOrderState.loading(),
    WorkOrderState.loaded([workOrder]),
  ],
);

// ✅ DO: Test widgets
testWidgets('WorkOrderCard displays work order info', (tester) async {
  final workOrder = WorkOrder(id: '1', title: 'Test Order');
  
  await tester.pumpWidget(
    MaterialApp(
      home: WorkOrderCard(order: workOrder),
    ),
  );
  
  expect(find.text('Test Order'), findsOneWidget);
});
```

## Comments and Documentation

```dart
// ✅ DO: Use doc comments for public APIs
/// Retrieves all work orders for the current user.
/// 
/// Returns [Right] containing a list of [WorkOrder] on success.
/// Returns [Left] containing a [Failure] on error.
/// 
/// Throws no exceptions - all errors are captured in [Either].
Future<Either<Failure, List<WorkOrder>>> getWorkOrders();

// ✅ DO: Comment complex logic
// Calculate priority score based on urgency and due date
// Score = (10 - daysUntilDue) * urgencyMultiplier
final priorityScore = (10 - daysUntilDue) * _getUrgencyMultiplier(urgency);

// ❌ DON'T: State the obvious
// Increment counter by 1
counter++;

// Get user name
final name = user.name;
```

## Performance Best Practices

```dart
// ✅ DO: Use const constructors
const Text('Hello')
const SizedBox(height: 16)
const EdgeInsets.all(8)

// ✅ DO: Extract widgets that don't change
class _StaticHeader extends StatelessWidget {
  const _StaticHeader();
  
  @override
  Widget build(BuildContext context) {
    return const Text('Header');
  }
}

// ✅ DO: Use ListView.builder for long lists
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemWidget(items[index]),
)

// ❌ DON'T: Use ListView for long lists
ListView(
  children: items.map((item) => ItemWidget(item)).toList(),
)

// ✅ DO: Cache network images
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => const ShimmerWidget(),
  errorWidget: (context, url, error) => const Icon(Icons.error),
)

// ✅ DO: Dispose controllers
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```

## Security Best Practices

```dart
// ✅ DO: Store sensitive data securely
await secureStorage.write(key: 'token', value: token);

// ❌ DON'T: Store tokens in plain storage
await prefs.setString('token', token);  // ❌

// ✅ DO: Validate user input
if (email.isEmpty || !email.contains('@')) {
  return 'Invalid email';
}

// ✅ DO: Use HTTPS only
const baseUrl = 'https://api.example.com';

// ✅ DO: Log out sensitive data before logging
logger.info('Login attempt for user: ${email.substring(0, 3)}***');
```

## Async Programming

```dart
// ✅ DO: Use async/await
Future<WorkOrder> getWorkOrder(String id) async {
  final response = await api.get('/work-orders/$id');
  return WorkOrder.fromJson(response.data);
}

// ✅ DO: Handle errors in async code
try {
  final result = await riskyOperation();
  return Right(result);
} catch (e) {
  return Left(Failure(e.toString()));
}

// ✅ DO: Use Future.wait for parallel operations
final results = await Future.wait([
  getWorkOrders(),
  getTechnicians(),
  getParts(),
]);

// ❌ DON'T: Await sequentially if not needed
final orders = await getWorkOrders();     // ❌ Waits unnecessarily
final techs = await getTechnicians();     // ❌ Could run in parallel
final parts = await getParts();           // ❌
```

## Null Safety

```dart
// ✅ DO: Use null-aware operators
final name = user?.name ?? 'Unknown';
final length = list?.length ?? 0;
items?.forEach(print);

// ✅ DO: Use late for non-nullable fields initialized later
late final String userId;

@override
void initState() {
  super.initState();
  userId = widget.user.id;
}

// ✅ DO: Use nullable types when appropriate
String? getNullableName() => user?.name;

// ❌ DON'T: Use ! unnecessarily
final name = user!.name;  // ❌ Could throw if null
```

## Git Commit Standards

```bash
# ✅ DO: Use conventional commits
feat: Add work order filtering by status
fix: Resolve crash on empty work order list
refactor: Extract work order card widget
docs: Update architecture documentation
test: Add tests for work order bloc
chore: Update dependencies

# ✅ DO: Write descriptive commit messages
feat: Implement offline sync for work orders

- Add background sync service
- Implement conflict resolution
- Add sync status indicator
- Update data layer to support offline mode

# ❌ DON'T: Write vague messages
fix: bug
update: stuff
wip
```

## Code Review Checklist

- [ ] Follows Clean Architecture principles
- [ ] Uses appropriate design patterns
- [ ] Implements proper error handling
- [ ] Includes unit tests
- [ ] Uses theme system (no hardcoded values)
- [ ] Follows naming conventions
- [ ] Has appropriate documentation
- [ ] Handles null safety correctly
- [ ] Optimized for performance
- [ ] No security vulnerabilities
- [ ] Generated files updated (if needed)
- [ ] No lint warnings
