# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-12 10:14:58 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart/Flutter Field Service Management application that manages work orders for service engineers.

## Description
* **Core Product:** The app is designed to manage field service operations, including scheduling, assigning tasks, and tracking progress.
* **Problem Solved:** It solves the problem of inefficient field service management by providing a centralized platform for managing work orders, resources, and customer information.
* **Key Features:** Key features include user authentication, role-based access control, work order creation and assignment, real-time tracking, and reporting.
* **Target Users:** The target users are field service managers, engineers, and customers who need to track progress and receive updates on their work orders.

## What the Codebase Does
* **Entry Point:** The entry point of the application is the `lib/app.dart` file, which sets up the app's configuration and initializes the main widget.
* **Core Feature [name]:** The core feature of the app is the work order management system, implemented in the `lib/core/blocs/work_order_bloc.dart` file.
* **User Flow:** When a user logs in, they are redirected to the dashboard, where they can view their assigned work orders and track progress. They can also create new work orders and assign tasks to engineers.
* **Data Layer:** The data layer is implemented using Hive, a lightweight NoSQL database, which stores user data, work order information, and other relevant details in the `lib/core/storage/hive_service.dart` file.
* **Output:** The app outputs real-time updates on work order status, including completion percentages, task assignments, and engineer availability.

## System Overview
* **`android/`** — contains Android-specific code for building and deploying the app on Android devices.
* **`ios/`** — contains iOS-specific code for building and deploying the app on iOS devices.
* **`lib/`** — contains the core logic of the application, including business logic, data models, and services.
* **`assets/`** — stores static assets such as images, fonts, and icons used in the app.

```mermaid
flowchart TD
    A[android/] -->|contains Android-specific code|> B[lib/]
    C[ios/] -->|contains iOS-specific code|> D[lib/]
    E[assets/] -->|stores static assets|> F[lib/]
    G[.gitignore] -->|configuration file|> H[android/]
    I[settings.local.json] -->|local settings|> J[android/]
```

The module structure is organized into top-level folders, each containing specific functionality and logic. The `lib` folder contains the core business logic, data models, and services, while the `android` and `ios` folders contain platform-specific code for building and deploying the app on different devices.

---

## Architecture

## Architecture

### High-Level Design
The system design pattern used in this codebase is a variation of Clean Architecture, with a focus on separating concerns between the Presentation Layer, Business Logic/Services, Data/Repository, and External APIs/Storage. The key features of this design are:

* **Separation of Concerns**: Each layer has its own responsibilities, making it easier to maintain and modify individual components without affecting others.
* **Testability**: The Business Logic/Services layer is designed to be testable, allowing for unit testing and integration testing.
* **Dependency Injection**: The system uses dependency injection to decouple components and make them more modular.

The Presentation Layer is implemented in the `lib/core/widgets` folder, while the Business Logic/Services layer is located in the `lib/core/services` folder. The Data/Repository layer is found in the `lib/core/storage` folder, and the External APIs/Storage are handled by the `lib/core/network` folder.

### Key Components
Here are the major modules/folders in this codebase:

* **`lib/core/widgets`** — Presentation Layer: handles user interface and layout.
* **`lib/core/services`** — Business Logic/Services layer: contains services that interact with the Data/Repository layer.
* **`lib/core/storage`** — Data/Repository layer: manages data storage and retrieval.
* **`lib/core/network`** — External APIs/Storage: handles communication with external APIs and storage systems.

### Component Interactions
Here's an overview of how components call each other and the data flow between layers:

* **UI Layer:** The Presentation Layer ( `lib/core/widgets` ) receives user input and sends requests to the Business Logic/Services layer ( `lib/core/services` ).
* **Service Layer:** The Business Logic/Services layer processes the request, interacts with the Data/Repository layer ( `lib/core/storage` ), and returns a response to the Presentation Layer.
* **Repository Layer:** The Data/Repository layer manages data storage and retrieval, interacting with the External APIs/Storage ( `lib/core/network` ) as needed.
* **External APIs:** The External APIs/Storage ( `lib/core/network` ) handle communication with external APIs and storage systems.

### Architecture Flow Diagram
```mermaid
flowchart TD
    subgraph PRES["Presentation Layer"]
        A[lib/core/widgets] -->|Request|> B[lib/core/services]
    end

    subgraph BUS["Business Logic/Services layer"]
        B -->|Process Request|> C[lib/core/storage]
    end

    subgraph DAT["Data/Repository layer"]
        C -->|Retrieve Data|> D[lib/core/network]
    end

    subgraph EXT["External APIs/Storage"]
        D -->|Send Request|> E[External API]
    end

    A -->|Response|> B
    B -->|Return Response|> A
    C -->|Return Data|> B
    D -->|Return Data|> C
    E -->|Return Response|> D
```

### Entry Points
Here are the main entry files and startup sequence:

* **`lib/main.dart`** — initializes the Presentation Layer and starts the app.
* **`lib/core/services/injection.config.dart`** — sets up dependency injection for the Business Logic/Services layer.
* **`lib/core/storage/hive_service.dart`** — initializes the Data/Repository layer using Hive storage.

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
- **GET /login** — Handles login flow. Parameters: `None`.
- **POST /auth/refresh-token** — Refreshes authentication token. Parameters: `token`.

#### Work Orders
- **GET /work-orders** — Retrieves work orders list. Parameters: `None`.
- **GET /work-orders/{id}** — Retrieves specific work order by ID. Parameters: `id`.
- **POST /work-orders** — Creates new work order. Parameters: `data`.

### Public Interfaces

#### ErrorHandler
- **`handleException(dynamic exception)`** — Handles exceptions and returns a Failure object.
- **`_handleDioException(DioException exception)`** — Handles Dio-related exceptions.
- **`_handleHiveError(HiveError error)`** — Handles Hive CE errors.

### Error Handling

* Errors are handled using the ErrorHandler class, which maps exceptions to specific Failure types.
* The ErrorHandler class handles various types of exceptions, including Dio, Hive, Server, Network, Cache, Validation, Permission, Location, and Authentication exceptions.
* Specific error messages are mapped to corresponding Failure types for better error handling and logging.

---

## Data Flow

## Data Flow

### Data Models

* **`ChatSessionResponse`** — contains `success`, `sessionId`, `user` (with `id`, `email`, `role`, and optional `firstName` and `lastName`), and `message`.
* **`UserInfo`** — contains `id`, `email`, `role`, and optional `firstName` and `lastName`.
* **`LocationInfo`** — contains `latitude`, `longitude`, `accuracy`, `altitude`, `bearing`, `speed`, `timestamp`, and optional `address`.

### Data Flow Description

* **Input:** User requests to start a chat session or send a message, which is handled by the `ChatService`.
* **Validation:** The request data is validated against the corresponding models (`ChatSessionRequest` or `SendMessageRequest`) using freezed annotations.
* **Processing:** The validated data is processed by the `ChatService`, which may involve interacting with external services (e.g., location services) to retrieve additional information.
* **Storage:** The processed data is stored in a database (e.g., Firestore) for later retrieval.
* **Output:** The chat session or message response is returned to the user, containing relevant information such as the session ID, user details, and any messages.

### Storage

* **`Firestore`** — stores chat sessions, user information, and location data. Configuration can be found in `lib/core/services/firebase.dart`.
* **`SharedPreferences`** — stores user preferences and settings. Configuration can be found in `lib/core/services/preferences.dart`.

### State Management

- State is managed locally within components/widgets using the Provider package.
- The `fsm_theme` extension provides a way to manage theme-related state across the app.
- The `LocationService` manages location-related state, including caching and updating user location.

---
