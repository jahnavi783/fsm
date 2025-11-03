# FSM Feature Development Guide

## Overview

This guide provides step-by-step instructions for implementing new features in the FSM app using Clean Architecture principles.

## Feature Development Workflow

### Phase 1: Planning and Design

1. **Define Requirements**
   - User stories
   - Acceptance criteria
   - API contracts
   - Data models
   - UI mockups

2. **Architecture Planning**
   - Identify domain entities
   - Define repository interfaces
   - Plan use cases
   - Design state management
   - Determine offline requirements

3. **Create Feature Structure**
```bash
lib/features/new_feature/
├── data/
│   ├── api/
│   │   └── new_feature_api.dart
│   ├── datasources/
│   │   ├── new_feature_remote_datasource.dart
│   │   └── new_feature_local_datasource.dart
│   ├── models/
│   │   ├── new_feature_dto.dart
│   │   ├── new_feature_dto.freezed.dart
│   │   ├── new_feature_dto.g.dart
│   │   └── new_feature_hive_model.dart
│   └── repositories/
│       └── new_feature_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── new_feature.dart
│   ├── repositories/
│   │   └── i_new_feature_repository.dart
│   └── usecases/
│       ├── get_new_features.dart
│       ├── create_new_feature.dart
│       └── update_new_feature.dart
└── presentation/
    ├── blocs/
    │   ├── new_feature_bloc.dart
    │   ├── new_feature_event.dart
    │   └── new_feature_state.dart
    ├── pages/
    │   ├── new_feature_list_page.dart
    │   └── new_feature_detail_page.dart
    ├── widgets/
    │   ├── new_feature_card.dart
    │   └── new_feature_form.dart
    └── forms/
        └── new_feature_form.dart
```

### Phase 2: Domain Layer Implementation

#### Step 1: Create Domain Entity

```dart
// lib/features/new_feature/domain/entities/new_feature.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_feature.freezed.dart';

@freezed
class NewFeature with _$NewFeature {
  const factory NewFeature({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _NewFeature;
  
  const NewFeature._();
  
  // Add business logic methods if needed
  bool get isRecent {
    final difference = DateTime.now().difference(createdAt);
    return difference.inDays < 7;
  }
}
```

#### Step 2: Define Repository Interface

```dart
// lib/features/new_feature/domain/repositories/i_new_feature_repository.dart
import 'package:either_dart/either.dart';
import '../entities/new_feature.dart';
import 'package:fsm/core/error/failures.dart';

abstract class INewFeatureRepository {
  /// Get all features
  Future<Either<Failure, List<NewFeature>>> getFeatures();
  
  /// Get a single feature by ID
  Future<Either<Failure, NewFeature>> getFeatureById(String id);
  
  /// Create a new feature
  Future<Either<Failure, NewFeature>> createFeature(NewFeature feature);
  
  /// Update an existing feature
  Future<Either<Failure, NewFeature>> updateFeature(NewFeature feature);
  
  /// Delete a feature
  Future<Either<Failure, void>> deleteFeature(String id);
  
  /// Sync features with server
  Future<Either<Failure, void>> syncFeatures();
}
```

#### Step 3: Create Use Cases

```dart
// lib/features/new_feature/domain/usecases/get_features.dart
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../entities/new_feature.dart';
import '../repositories/i_new_feature_repository.dart';
import 'package:fsm/core/error/failures.dart';

@injectable
class GetFeatures {
  final INewFeatureRepository repository;
  
  GetFeatures(this.repository);
  
  Future<Either<Failure, List<NewFeature>>> call() {
    return repository.getFeatures();
  }
}

// lib/features/new_feature/domain/usecases/create_feature.dart
@injectable
class CreateFeature {
  final INewFeatureRepository repository;
  
  CreateFeature(this.repository);
  
  Future<Either<Failure, NewFeature>> call(NewFeature feature) {
    return repository.createFeature(feature);
  }
}
```

### Phase 3: Data Layer Implementation

#### Step 1: Create DTO Model

```dart
// lib/features/new_feature/data/models/new_feature_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/new_feature.dart';

part 'new_feature_dto.freezed.dart';
part 'new_feature_dto.g.dart';

@freezed
class NewFeatureDto with _$NewFeatureDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NewFeatureDto({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _NewFeatureDto;
  
  const NewFeatureDto._();
  
  factory NewFeatureDto.fromJson(Map<String, dynamic> json) =>
      _$NewFeatureDtoFromJson(json);
  
  /// Convert DTO to domain entity
  NewFeature toEntity() {
    return NewFeature(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
  
  /// Create DTO from domain entity
  factory NewFeatureDto.fromEntity(NewFeature entity) {
    return NewFeatureDto(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
```

#### Step 2: Create Hive Model (for offline storage)

```dart
// lib/features/new_feature/data/models/new_feature_hive_model.dart
import 'package:hive_ce/hive.dart';

part 'new_feature_hive_model.g.dart';

@HiveType(typeId: 10) // Choose unique typeId
class NewFeatureHiveModel extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final String description;
  
  @HiveField(3)
  final DateTime createdAt;
  
  @HiveField(4)
  final DateTime? updatedAt;
  
  NewFeatureHiveModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.updatedAt,
  });
  
  /// Convert to DTO
  NewFeatureDto toDto() {
    return NewFeatureDto(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
  
  /// Create from DTO
  factory NewFeatureHiveModel.fromDto(NewFeatureDto dto) {
    return NewFeatureHiveModel(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
```

#### Step 3: Create API Client

```dart
// lib/features/new_feature/data/api/new_feature_api.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/new_feature_dto.dart';

part 'new_feature_api.g.dart';

@RestApi()
abstract class NewFeatureApi {
  factory NewFeatureApi(Dio dio, {String baseUrl}) = _NewFeatureApi;
  
  @GET('/features')
  Future<List<NewFeatureDto>> getFeatures();
  
  @GET('/features/{id}')
  Future<NewFeatureDto> getFeatureById(@Path('id') String id);
  
  @POST('/features')
  Future<NewFeatureDto> createFeature(@Body() NewFeatureDto feature);
  
  @PUT('/features/{id}')
  Future<NewFeatureDto> updateFeature(
    @Path('id') String id,
    @Body() NewFeatureDto feature,
  );
  
  @DELETE('/features/{id}')
  Future<void> deleteFeature(@Path('id') String id);
}
```

#### Step 4: Create Data Sources

```dart
// lib/features/new_feature/data/datasources/new_feature_remote_datasource.dart
import 'package:injectable/injectable.dart';
import '../api/new_feature_api.dart';
import '../models/new_feature_dto.dart';

abstract class NewFeatureRemoteDataSource {
  Future<List<NewFeatureDto>> getFeatures();
  Future<NewFeatureDto> getFeatureById(String id);
  Future<NewFeatureDto> createFeature(NewFeatureDto feature);
  Future<NewFeatureDto> updateFeature(String id, NewFeatureDto feature);
  Future<void> deleteFeature(String id);
}

@LazySingleton(as: NewFeatureRemoteDataSource)
class NewFeatureRemoteDataSourceImpl implements NewFeatureRemoteDataSource {
  final NewFeatureApi api;
  
  NewFeatureRemoteDataSourceImpl(this.api);
  
  @override
  Future<List<NewFeatureDto>> getFeatures() async {
    return await api.getFeatures();
  }
  
  @override
  Future<NewFeatureDto> getFeatureById(String id) async {
    return await api.getFeatureById(id);
  }
  
  @override
  Future<NewFeatureDto> createFeature(NewFeatureDto feature) async {
    return await api.createFeature(feature);
  }
  
  @override
  Future<NewFeatureDto> updateFeature(String id, NewFeatureDto feature) async {
    return await api.updateFeature(id, feature);
  }
  
  @override
  Future<void> deleteFeature(String id) async {
    await api.deleteFeature(id);
  }
}

// lib/features/new_feature/data/datasources/new_feature_local_datasource.dart
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import '../models/new_feature_hive_model.dart';
import '../models/new_feature_dto.dart';

abstract class NewFeatureLocalDataSource {
  Future<List<NewFeatureDto>> getCachedFeatures();
  Future<NewFeatureDto?> getCachedFeatureById(String id);
  Future<void> cacheFeatures(List<NewFeatureDto> features);
  Future<void> cacheFeature(NewFeatureDto feature);
  Future<void> deleteFeature(String id);
  Future<void> clearCache();
}

@LazySingleton(as: NewFeatureLocalDataSource)
class NewFeatureLocalDataSourceImpl implements NewFeatureLocalDataSource {
  final Box<NewFeatureHiveModel> box;
  
  NewFeatureLocalDataSourceImpl(@Named(HiveBoxes.newFeatures) this.box);
  
  @override
  Future<List<NewFeatureDto>> getCachedFeatures() async {
    return box.values.map((model) => model.toDto()).toList();
  }
  
  @override
  Future<NewFeatureDto?> getCachedFeatureById(String id) async {
    final model = box.get(id);
    return model?.toDto();
  }
  
  @override
  Future<void> cacheFeatures(List<NewFeatureDto> features) async {
    final models = features.map((dto) => NewFeatureHiveModel.fromDto(dto));
    await box.clear();
    for (final model in models) {
      await box.put(model.id, model);
    }
  }
  
  @override
  Future<void> cacheFeature(NewFeatureDto feature) async {
    final model = NewFeatureHiveModel.fromDto(feature);
    await box.put(model.id, model);
  }
  
  @override
  Future<void> deleteFeature(String id) async {
    await box.delete(id);
  }
  
  @override
  Future<void> clearCache() async {
    await box.clear();
  }
}
```

#### Step 5: Implement Repository

```dart
// lib/features/new_feature/data/repositories/new_feature_repository_impl.dart
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/new_feature.dart';
import '../../domain/repositories/i_new_feature_repository.dart';
import '../datasources/new_feature_local_datasource.dart';
import '../datasources/new_feature_remote_datasource.dart';
import '../models/new_feature_dto.dart';
import 'package:fsm/core/error/failures.dart';
import 'package:fsm/core/network/network_info.dart';

@LazySingleton(as: INewFeatureRepository)
class NewFeatureRepositoryImpl implements INewFeatureRepository {
  final NewFeatureRemoteDataSource remoteDataSource;
  final NewFeatureLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  NewFeatureRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.networkInfo,
  );
  
  @override
  Future<Either<Failure, List<NewFeature>>> getFeatures() async {
    if (await networkInfo.isConnected) {
      try {
        final dtos = await remoteDataSource.getFeatures();
        final entities = dtos.map((dto) => dto.toEntity()).toList();
        
        // Cache for offline access
        await localDataSource.cacheFeatures(dtos);
        
        return Right(entities);
      } catch (e) {
        // If remote fails, try local cache
        return _getFromCache();
      }
    } else {
      // No network, use cache
      return _getFromCache();
    }
  }
  
  Future<Either<Failure, List<NewFeature>>> _getFromCache() async {
    try {
      final dtos = await localDataSource.getCachedFeatures();
      final entities = dtos.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to load from cache'));
    }
  }
  
  @override
  Future<Either<Failure, NewFeature>> getFeatureById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final dto = await remoteDataSource.getFeatureById(id);
        await localDataSource.cacheFeature(dto);
        return Right(dto.toEntity());
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      try {
        final dto = await localDataSource.getCachedFeatureById(id);
        if (dto == null) {
          return Left(CacheFailure('Feature not found in cache'));
        }
        return Right(dto.toEntity());
      } catch (e) {
        return Left(CacheFailure(e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, NewFeature>> createFeature(NewFeature feature) async {
    try {
      final dto = NewFeatureDto.fromEntity(feature);
      final createdDto = await remoteDataSource.createFeature(dto);
      await localDataSource.cacheFeature(createdDto);
      return Right(createdDto.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, NewFeature>> updateFeature(NewFeature feature) async {
    try {
      final dto = NewFeatureDto.fromEntity(feature);
      final updatedDto = await remoteDataSource.updateFeature(feature.id, dto);
      await localDataSource.cacheFeature(updatedDto);
      return Right(updatedDto.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteFeature(String id) async {
    try {
      await remoteDataSource.deleteFeature(id);
      await localDataSource.deleteFeature(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> syncFeatures() async {
    try {
      final dtos = await remoteDataSource.getFeatures();
      await localDataSource.cacheFeatures(dtos);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

### Phase 4: Presentation Layer Implementation

#### Step 1: Create BLoC Events

```dart
// lib/features/new_feature/presentation/blocs/new_feature_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/new_feature.dart';

part 'new_feature_event.freezed.dart';

@freezed
class NewFeatureEvent with _$NewFeatureEvent {
  const factory NewFeatureEvent.loadFeatures() = _LoadFeatures;
  const factory NewFeatureEvent.loadFeatureById(String id) = _LoadFeatureById;
  const factory NewFeatureEvent.createFeature(NewFeature feature) = _CreateFeature;
  const factory NewFeatureEvent.updateFeature(NewFeature feature) = _UpdateFeature;
  const factory NewFeatureEvent.deleteFeature(String id) = _DeleteFeature;
  const factory NewFeatureEvent.syncFeatures() = _SyncFeatures;
}
```

#### Step 2: Create BLoC States

```dart
// lib/features/new_feature/presentation/blocs/new_feature_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/new_feature.dart';

part 'new_feature_state.freezed.dart';

@freezed
class NewFeatureState with _$NewFeatureState {
  const factory NewFeatureState.initial() = _Initial;
  const factory NewFeatureState.loading() = _Loading;
  const factory NewFeatureState.loaded(List<NewFeature> features) = _Loaded;
  const factory NewFeatureState.featureLoaded(NewFeature feature) = _FeatureLoaded;
  const factory NewFeatureState.created(NewFeature feature) = _Created;
  const factory NewFeatureState.updated(NewFeature feature) = _Updated;
  const factory NewFeatureState.deleted() = _Deleted;
  const factory NewFeatureState.syncing() = _Syncing;
  const factory NewFeatureState.synced() = _Synced;
  const factory NewFeatureState.error(String message) = _Error;
}
```

#### Step 3: Implement BLoC

```dart
// lib/features/new_feature/presentation/blocs/new_feature_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_features.dart';
import '../../domain/usecases/create_feature.dart';
import 'new_feature_event.dart';
import 'new_feature_state.dart';

@injectable
class NewFeatureBloc extends Bloc<NewFeatureEvent, NewFeatureState> {
  final GetFeatures getFeatures;
  final CreateFeature createFeature;
  // Add other use cases
  
  NewFeatureBloc(
    this.getFeatures,
    this.createFeature,
  ) : super(const NewFeatureState.initial()) {
    on<_LoadFeatures>(_onLoadFeatures);
    on<_CreateFeature>(_onCreateFeature);
    // Register other handlers
  }
  
  Future<void> _onLoadFeatures(
    _LoadFeatures event,
    Emitter<NewFeatureState> emit,
  ) async {
    emit(const NewFeatureState.loading());
    
    final result = await getFeatures();
    
    result.fold(
      (failure) => emit(NewFeatureState.error(failure.message)),
      (features) => emit(NewFeatureState.loaded(features)),
    );
  }
  
  Future<void> _onCreateFeature(
    _CreateFeature event,
    Emitter<NewFeatureState> emit,
  ) async {
    emit(const NewFeatureState.loading());
    
    final result = await createFeature(event.feature);
    
    result.fold(
      (failure) => emit(NewFeatureState.error(failure.message)),
      (feature) => emit(NewFeatureState.created(feature)),
    );
  }
}
```

#### Step 4: Create Pages

```dart
// lib/features/new_feature/presentation/pages/new_feature_list_page.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm/core/di/injection.dart';
import 'package:fsm/core/theme/theme.dart';
import '../blocs/new_feature_bloc.dart';
import '../blocs/new_feature_event.dart';
import '../blocs/new_feature_state.dart';
import '../widgets/new_feature_card.dart';

@RoutePage()
class NewFeatureListPage extends StatelessWidget {
  const NewFeatureListPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewFeatureBloc>()
        ..add(const NewFeatureEvent.loadFeatures()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Features'),
          actions: [
            IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {
                context.read<NewFeatureBloc>()
                    .add(const NewFeatureEvent.syncFeatures());
              },
            ),
          ],
        ),
        body: BlocBuilder<NewFeatureBloc, NewFeatureState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (features) => ListView.builder(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return NewFeatureCard(feature: features[index]);
                },
              ),
              featureLoaded: (_) => const SizedBox(),
              created: (_) => const SizedBox(),
              updated: (_) => const SizedBox(),
              deleted: () => const SizedBox(),
              syncing: () => const Center(child: CircularProgressIndicator()),
              synced: () => const SizedBox(),
              error: (message) => Center(
                child: Text(
                  message,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to create page
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

### Phase 5: Register Dependencies

```dart
// lib/features/new_feature/di/new_feature_module.dart
import 'package:dio/dio.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:fsm/core/constants/hive_boxes.dart';
import '../data/api/new_feature_api.dart';
import '../data/models/new_feature_hive_model.dart';

@module
abstract class NewFeatureModule {
  @lazySingleton
  NewFeatureApi provideNewFeatureApi(Dio dio) {
    return NewFeatureApi(dio);
  }
  
  @preResolve
  @lazySingleton
  @Named(HiveBoxes.newFeatures)
  Future<Box<NewFeatureHiveModel>> provideNewFeatureBox() async {
    return await Hive.openBox<NewFeatureHiveModel>(HiveBoxes.newFeatures);
  }
}
```

### Phase 6: Add Routes

```dart
// In lib/core/router/app_router.dart
@override
List<AutoRoute> get routes => [
  // ... existing routes
  AutoRoute(
    page: NewFeatureListRoute.page,
    path: '/features',
  ),
  AutoRoute(
    page: NewFeatureDetailRoute.page,
    path: '/features/:id',
  ),
];
```

### Phase 7: Generate Code

```bash
# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Or in watch mode
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Phase 8: Testing

```dart
// test/features/new_feature/domain/usecases/get_features_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewFeatureRepository extends Mock implements INewFeatureRepository {}

void main() {
  late GetFeatures useCase;
  late MockNewFeatureRepository mockRepository;
  
  setUp(() {
    mockRepository = MockNewFeatureRepository();
    useCase = GetFeatures(mockRepository);
  });
  
  group('GetFeatures', () {
    final testFeatures = [
      NewFeature(
        id: '1',
        title: 'Test',
        description: 'Test desc',
        createdAt: DateTime.now(),
      ),
    ];
    
    test('should return list of features from repository', () async {
      // Arrange
      when(() => mockRepository.getFeatures())
          .thenAnswer((_) async => Right(testFeatures));
      
      // Act
      final result = await useCase();
      
      // Assert
      expect(result, Right(testFeatures));
      verify(() => mockRepository.getFeatures()).called(1);
    });
  });
}
```

## Common Tasks

### Adding a New API Endpoint

1. Add method to API interface
2. Run code generation
3. Add method to remote data source
4. Update repository if needed

### Adding Offline Support

1. Create Hive model with unique `typeId`
2. Create local data source
3. Register adapter in `HiveService`
4. Update repository to use local cache

### Adding a New Form

1. Create form class with `reactive_forms`
2. Define validators
3. Add form widget
4. Connect to BLoC

### Adding Navigation

1. Add `@RoutePage()` to page
2. Define route in `app_router.dart`
3. Run code generation
4. Navigate using `context.router`

## Checklist

- [ ] Domain entities created
- [ ] Repository interface defined
- [ ] Use cases implemented
- [ ] DTOs with serialization
- [ ] Hive models for offline
- [ ] API client created
- [ ] Data sources implemented
- [ ] Repository implemented
- [ ] BLoC events defined
- [ ] BLoC states defined
- [ ] BLoC implemented
- [ ] Pages created with @RoutePage()
- [ ] Widgets extracted
- [ ] Routes added
- [ ] Dependencies registered
- [ ] Code generated
- [ ] Tests written
- [ ] Documentation updated
