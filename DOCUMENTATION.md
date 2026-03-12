# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-12 10:12:13 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart/Flutter application that implements a Field Service Management (FSM) system for managing service engineers, work orders, and machine details.

## Description
* **Core Product:** The app provides a comprehensive FSM solution for managing field service operations, including scheduling, dispatching, and tracking of service engineers.
* **Problem Solved:** It addresses the challenges of managing complex field service operations by providing real-time visibility into service engineer locations, work order status, and machine details.
* **Key Features:** The app includes features such as automated scheduling, GPS tracking, and mobile access to work orders and machine information.
* **Target Users:** Service engineers, dispatchers, and managers who need to manage field service operations efficiently.

## What the Codebase Does
* **Entry Point:** The entry point of the application is located in `lib/app.dart`, which sets up the main app configuration and initializes the Flutter engine.
* **Core Feature [name]:** The core feature of the app is implemented in `lib/core/blocs/blocs.dart`, which manages the business logic for service engineers, work orders, and machine details.
* **User Flow:** When a user logs in, the app navigates to the dashboard (`lib/core/router/app_router.gr.dart`), which displays a list of available work orders and allows users to select one to view or update.
* **Data Layer:** The data layer is implemented using Hive storage (`lib/core/storage/hive_service.dart`) for storing service engineer and machine details, as well as a Dio client (`lib/core/network/dio_client.dart`) for making API requests to the backend.
* **Output:** The app outputs a list of work orders with relevant information, including status, location, and assigned service engineers.

## System Overview
* **`android/`** — contains Android-specific code, including the `AndroidManifest.xml` file that defines the app's metadata and permissions.
* **`ios/`** — contains iOS-specific code, including the `Info.plist` file that defines the app's metadata and settings.
* **`lib/core/`** — contains the core business logic for the app, including the `blocs.dart` file that manages service engineer and work order data.
* **`lib/services/`** — contains services that interact with the backend API, including the `location_service.dart` file that provides location-based services.

```mermaid
flowchart TD
    lib(app) -->| imports | lib/core/blocs/blocs.dart
    lib(core) -->| imports | lib/core/storage/hive_service.dart
    lib(network) -->| imports | lib/core/network/dio_client.dart
    android(Manifest.xml) -->| defines metadata and permissions |
    ios(Info.plist) -->| defines metadata and settings |
    lib/services(location_service.dart) -->| provides location-based services |
```

The codebase is structured with a clear separation of concerns between the core business logic, data storage, and network interactions. The `lib/core/` folder contains the core business logic for managing service engineers and work orders, while the `lib/services/` folder contains services that interact with the backend API.

---

## Architecture

## Architecture

### High-Level Design
The system design pattern used in this codebase is a variation of Clean Architecture, with a focus on separating concerns between the Presentation Layer, Business Logic/Services, Data/Repository, and External APIs/Storage. Key features include:

* **Presentation Layer:** Implemented in `lib/core/widgets` folder, responsible for rendering UI components.
* **Business Logic/Services:** Located in `lib/core/services` folder, encapsulates business logic and provides interfaces to interact with the repository layer.
* **Data/Repository:** Stored in `lib/core/storage` folder, manages data access and persistence using Hive storage.
* **External APIs/Storage:** Implemented in `lib/core/network` folder, handles communication with external services and storage.

### Key Components
Here are the major modules/folders in this codebase:

* **`lib/core/services`** — Provides business logic and interfaces for interacting with the repository layer.
* **`lib/core/storage`** — Manages data access and persistence using Hive storage.
* **`lib/core/network`** — Handles communication with external services and storage.
* **`lib/core/widgets`** — Responsible for rendering UI components in the Presentation Layer.

### Component Interactions
Here's an overview of how components interact with each other:

* **UI Layer:** The `lib/core/widgets` folder receives input from the user and sends requests to the Service Layer for processing.
* **Service Layer:** The `lib/core/services` folder processes requests, interacts with the Repository Layer, and returns results to the UI Layer.
* **Repository Layer:** The `lib/core/storage` folder manages data access and persistence using Hive storage, providing data to the Service Layer as needed.
* **External APIs/Storage:** The `lib/core/network` folder handles communication with external services and storage, providing data to the Repository Layer.

### Architecture Flow Diagram
```mermaid
flowchart TD
    subgraph PRES["Presentation Layer"]
        A[lib/core/widgets] -->|Input|> B[lib/core/services]
    end

    subgraph BUS["Business Logic/Services"]
        B[lib/core/services] -->|Request|> C[lib/core/storage]
    end

    subgraph DAT["Data/Repository"]
        C[lib/core/storage] -->|Data Access|> D[lib/core/network]
    end

    subgraph EXT["External APIs/Storage"]
        D[lib/core/network] -->|Communication|> E[External Services/Storage]
    end

    A -->|Output|> B
    B -->|Result|> C
    C -->|Data|> D
    D -->|Data|> E
```

### Entry Points
Here are the main entry files and startup sequence:

* **`lib/main.dart`** — Initializes the app and sets up the Presentation Layer.
* **`lib/core/services/injection.config.dart`** — Configures dependency injection for services.
* **`lib/core/storage/hive_service.dart`** — Initializes Hive storage and provides data access to the Repository Layer.

---

## Tools & Tech Stack

**Languages:** Dart  93.9%, XML  1.7%, JSON  1.4%, Swift  0.9%, C++  0.6%, YAML  0.5%, Shell  0.5%, CMake  0.3%, Kotlin  0.2%, HTML  0.2%


**Infrastructure:** GitHub Actions


---

## Code Quality Metrics

| Metric | Value | Status |
|---|---|---|
| Total Project Files | 760 | ℹ️ Info |
| Primary Language | Dart  98.3%  (619 files) | ✅ Good |
| Test Files | 53 | ✅ Good |
| Test / Lint / Build | test=N/A, lint=N/A, build=100% | ✅ Good |
| Dependencies | N/A | ℹ️ Info |
| Dockerfile Present | No | ⚠️ Average |

---

## API Endpoints

## API Information

### Overview
* **API Type:** Internal service calls (detected from the code)
* **Base Path:** N/A
* **Authentication:** None detected

### Endpoints

#### Auth
- **GET /login** — Handles login flow. Parameters: `None`
- **POST /auth/token** — Refreshes authentication token. Parameters: `token`

#### Work Orders
- **GET /work-orders** — Retrieves work orders list. Parameters: `None`
- **GET /work-orders/{id}** — Retrieves specific work order by ID. Parameters: `id`
- **POST /work-orders** — Creates new work order. Parameters: `data`

#### Parts
- **GET /parts** — Retrieves parts list. Parameters: `None`
- **GET /parts/{id}** — Retrieves specific part by ID. Parameters: `id`
- **POST /parts** — Creates new part. Parameters: `data`

### Public Interfaces

#### ErrorHandler
- **`handleException(dynamic exception)`** — Handles exceptions and returns a Failure object.
- **`_handleDioException(DioException exception)`** — Handles Dio-related exceptions.
- **`_handleHiveError(HiveError error)`** — Handles Hive CE errors.

### Error Handling

* Errors are handled by the ErrorHandler class, which maps exceptions to specific Failure types.
* The ErrorHandler class handles various types of exceptions, including DioException, HiveError, ServerException, NetworkException, CacheException, ValidationException, PermissionException, LocationException, AuthenticationException, and TimeoutException.
* Specific error messages are mapped to corresponding Failure types for better error handling and logging.

---

## Data Flow

## Data Flow

### Data Models

* **`ChatSessionResponse`** — contains `success`, `sessionId`, `user`, and `message`.
* **`UserInfo`** — contains `id`, `email`, `role`, `firstName`, and `lastName`.
* **`LocationInfo`** — contains `latitude`, `longitude`, `accuracy`, `altitude`, `bearing`, `speed`, and `timestamp`.
* **`LoginRequest`** — contains `email` and `password`.

### Data Flow Description

* **Input:** User requests a chat session or sends a message through the app.
* **Validation:** The request is validated by checking for required fields and formatting.
* **Processing:** The data is processed by services such as location services (for geolocation) and authentication services (for login).
* **Storage:** Data is stored in databases, local storage, or external services such as Firebase Firestore.
* **Output:** The processed data is returned to the app as a response, which can include chat session IDs, user information, and message contents.

### Storage

* **`Firebase Firestore`** — stores user information, chat sessions, and messages.
* **`Local storage`** — stores cached data such as user preferences and authentication tokens.
* **`Databases`** — stores location data and other system-wide settings.

### State Management

* - State is managed locally within components/widgets using the `Provider` package.
* The app uses a centralized state management solution to manage global state, including user authentication and chat session information.

---
