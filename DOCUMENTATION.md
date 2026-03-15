# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-15 16:10:02 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart/Flutter Field Service Management application that manages service engineers, work orders, and machine details.

## Description
* **Core Product:** Manages field service operations for a company.
* **Problem Solved:** Eliminates inefficiencies in scheduling, dispatching, and tracking of service engineers.
* **Key Features:** connectivity management, error handling, sync functionality, performance monitoring, memory management.
* **Entry Point:** `lib/app.dart`

## What the Codebase Does
* **Entry Point:** The application initializes with `lib/app.dart`, which sets up the core components and routes.
* **Core Feature – Connectivity Management:** The app uses a connectivity bloc (`lib/core/blocs/connectivity/connectivity_bloc.dart`) to manage network connections and errors.
* **User Flow:** Users can navigate through various screens, including a dashboard, work order list, and service engineer details, using the `app_router` (`lib/core/router/app_router.dart`).
* **Data Layer:** The app stores data in Hive boxes (`lib/core/storage/hive_service.dart`) and uses a cache manager (`lib/core/storage/cache_manager.dart`) to manage cached data.
* **Output:** The app displays various UI components, including lists, forms, and charts, using Flutter widgets.

## System Overview
* `android/` — Manages Android-specific configurations and builds for the application.
* `ios/` — Manages iOS-specific configurations and builds for the application.
* `lib/core/` — Contains core business logic, including connectivity management, error handling, and sync functionality.
* `lib/services/` — Provides various services, including authentication, location tracking, and logging.

```mermaid
flowchart TD
    lib[lib]
    lib -->|core|> lib/core/
    lib/core/ -->|blocs|> lib/core/blocs/
    lib/core/blocs/ -->|connectivity|> lib/core/blocs/connectivity_connectivity_bloc.dart
    lib/core/blocs/ -->|error|> lib/core/blocs/error_error_bloc.dart
    lib/services/ -->|auth|> lib/services/auth_interceptor.dart
    lib/services/ -->|location|> lib/services/location_service.dart
    android[android]
    ios[ios]
```

The codebase is structured with a clear separation of concerns between the core business logic, services, and platform-specific configurations. The `lib/core` module contains the core functionality, while the `lib/services` module provides various services used throughout the application.

---

## Architecture

## Architecture

### High-Level Design
* **Pattern:** Clean Architecture with a BLoC (Business Logic Component) pattern for state management.
* **Structure:** The project is structured into top-level folders like `lib/core`, `lib/core/blocs`, and `lib/core/services`, which reflect the Clean Architecture pattern.
* **State Management:** The BLoC pattern is used for state management, with a clear separation of concerns between presentation, business logic, and data storage.

### Key Components
* **`lib/core/config/`** — This folder contains configuration files for different environments (e.g., `app_config_dev.dart`, `app_config_prod.dart`) to manage app settings.
* **`lib/core/services/`** — This folder holds various services like authentication, location, and logging that can be used across the app.
* **`lib/core/blocs/`** — This folder contains BLoC classes for managing state in different parts of the app (e.g., `connectivity_bloc.dart`, `error_bloc.dart`).
* **`lib/core/theme/`** — This folder includes theme-related files like `app_colors.dart`, `app_dimensions.dart`, and `app_text_styles.dart`.

### Component Interactions
* **Request Flow:** A user action flows from the UI (e.g., a button press) to a BLoC class, which then interacts with a service or API to perform the desired action.
* **Data Direction:** Responses/data flow back to the UI through the same BLoC class, updating the app state accordingly.
* **Shared Services:** The `lib/core/services/` folder contains shared services like authentication and logging that multiple features depend on.

### Entry Points
* **Main Entry:** The first file executed at startup is `lib/main.dart`.
* **App Init:** The `lib/main.dart` file initializes the app framework/widget tree.
* **Routing:** The `lib/core/router/app_router.dart` file is responsible for navigation/routing in the app.

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

## FSM API Endpoints

### Work Orders

* **GET /work-orders** — Retrieves a list of work orders
* **POST /work-orders** — Creates a new work order
* **PUT /work-orders/{id}** — Updates an existing work order
* **DELETE /work-orders/{id}** — Deletes a work order by ID

### Engineers

* **GET /engineers** — Retrieves a list of engineers
* **POST /engineers** — Creates a new engineer
* **PUT /engineers/{id}** — Updates an existing engineer
* **DELETE /engineers/{id}** — Deletes an engineer by ID

### Parts

* **GET /parts** — Retrieves a list of parts
* **POST /parts** — Creates a new part
* **PUT /parts/{id}** — Updates an existing part
* **DELETE /parts/{id}** — Deletes a part by ID

### Documents

* **GET /documents** — Retrieves a list of documents
* **POST /documents** — Creates a new document
* **PUT /documents/{id}** — Updates an existing document
* **DELETE /documents/{id}** — Deletes a document by ID

### Authentication

* **POST /login** — Authenticates a user and returns an access token
* **GET /logout** — Logs out the current user and invalidates their session

### Error Handling

* **Error handling is handled internally through the ErrorHandler class**

Note: The above endpoints are based on the provided code snippets, which seem to be related to routing and authentication. If there's any additional information or context that I'm missing, please let me know!

---

## Data Flow

## Data Flow

### Data Models

* **`ChatSessionResponse`:** `success`, `sessionId`, `user`, `message`. Represents a response when starting a chat session.
* **`UserInfo`:** `id`, `email`, `role`, `firstName`, `lastName`. Stores user information.
* **`LocationInfo`:** `latitude`, `longitude`, `accuracy`, `altitude`, `bearing`, `speed`, `timestamp`, `address`. Represents location data.
* **`LoginRequest`:** `email`, `password`. Contains login credentials.

### Data Flow Description

1. **UI Layer:** The user initiates a chat session or sends a message through the UI, triggering a BLoC event to start a new chat session or send a message.
2. **State/Logic Layer:** The BLoC controller handles the event and calls the corresponding service (e.g., `ChatService` for starting a chat session).
3. **Service Layer:** The `ChatService` processes the request, making an API call to start a new chat session or send a message.
4. **API/Network Layer:** The API endpoint `/chat/session` is called with the necessary parameters (e.g., user ID) to initiate a chat session.
5. **Repository Layer:** The response from the API is parsed and returned as a `ChatSessionResponse` object, which includes the session ID, success status, and any error messages.
6. **State Update:** The UI is updated with the new data, displaying the chat session details or sending a message.

### Storage

* **`SharedPreferences`:** Stores user login credentials (email and password) for authentication purposes.
* **`SQLite`:** Stores location data (latitude, longitude, accuracy, etc.) for offline access.

---
