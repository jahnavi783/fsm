# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-15 18:08:50 | Branch: `main`

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
* **Core Feature – Connectivity Management:** The app uses a connectivity bloc (`lib/core/blocs/connectivity/connectivity_bloc.dart`) to manage network connections and handle errors.
* **User Flow:** Users can navigate through various screens, including a dashboard, work order list, and service engineer details, using the `app_router` (`lib/core/router/app_router.dart`).
* **Data Layer:** The app uses Hive for local storage (`lib/core/storage/hive_service.dart`) to store data such as work orders, service engineers, and machine details.
* **Output:** The app displays a list of work orders, each with its status and assigned engineer, on the dashboard screen.

## System Overview
* `android/` — Manages Android-specific configurations and builds for the application.
* `ios/` — Manages iOS-specific configurations and builds for the application.
* `lib/core/` — Contains core components such as connectivity management, error handling, sync functionality, performance monitoring, memory management.
* `lib/services/` — Provides services for chatbot interactions, location tracking, logging, and more.

```mermaid
flowchart TD
    lib/app.dart -->|initializes|> lib/core/blocs/connectivity/connectivity_bloc.dart
    lib/core/blocs/connectivity/connectivity_bloc.dart -->|manages connectivity|> lib/core/network/auth_interceptor.dart
    lib/core/router/app_router.dart -->|navigates screens|> lib/services/chatbot_services.dart
    lib/storage/hive_service.dart -->|stores data|> lib/models/chat_models.dart
    android/ -->|android-specific configs|> ios/
```

The codebase is structured with a clear separation of concerns between core components, services, and platform-specific configurations. The `lib/core` module contains the core functionality, while the `lib/services` module provides additional services for various features.

---

## Architecture

## Architecture

### High-Level Design
* **Pattern:** Clean Architecture with a BLoC (Business Logic Component) pattern for state management.
* **Structure:** The project is structured into top-level folders like `lib/core`, `lib/core/blocs`, and `lib/core/services`, which reflect the Clean Architecture pattern.
* **State Management:** The project uses BLoC for state management, with a separate folder (`lib/core/blocs`) containing the BLoC classes.

### Key Components
* **`lib/core/config/`** — Contains configuration files for different environments (e.g., `app_config_dev.dart`, `app_config_prod.dart`).
* **`lib/core/services/`** — Houses various services like authentication, location, and logging.
* **`lib/core/blocs/`** — Contains the BLoC classes responsible for managing state.
* **`lib/core/theme/`** — Defines the app's visual theme.

### Component Interactions
* **Request Flow:** A user action flows from the UI to a BLoC, which then interacts with services and APIs as needed (e.g., `connectivity_bloc.dart`).
* **Data Direction:** Responses/data flow back to the UI through the same BLoC, updating the app's state accordingly.
* **Shared Services:** The project has shared/core modules like `network.dart`, `storage.dart`, and `logging_service.dart` that multiple features depend on.

### Entry Points
* **Main Entry:** The first file executed at startup is `lib/main.dart`.
* **App Init:** The file responsible for initialising the app framework/widget tree is `lib/main.dart`.
* **Routing:** The file or module responsible for navigation/routing is `lib/core/router/app_router.dart`.

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

## API Endpoints

### Work Orders
* **GET /work-orders** — Retrieves a list of work orders.
* **POST /work-orders** — Creates a new work order.

### Engineers
* **GET /engineers** — Retrieves a list of engineers.
* **POST /engineers** — Creates a new engineer.

### Parts
* **GET /parts** — Retrieves a list of parts.
* **POST /parts** — Creates a new part.

### Documents
* **GET /documents** — Retrieves a list of documents.
* **POST /documents** — Creates a new document.

### Authentication
* **POST /login** — Authenticates a user and returns an authentication token.
* **POST /logout** — Logs out the current user.

### Error Handling
* **Error handling is handled internally by the application.**

## Public Function Signatures

### AuthGuard
* **`AuthGuard(AuthLocalDataSource, AuthBloc)`** — Initializes the authentication guard with a local data source and an auth bloc.
* **`onNavigated()`** — Called when navigation occurs.

### AppRouteObserver
* **`AppRouteObserver(LoggingService)`** — Initializes the app route observer with a logging service.
* **`didChangeCurrentConfiguration()`** — Called when the current configuration changes.
* **`didPopRoute()`** — Called when a route is popped from the stack.

---

## Data Flow

## Data Flow

### Data Models

* **`ChatSessionResponse`:** `success`, `sessionId`, `user`, `message`. Represents a response when starting a chat session.
* **`UserInfo`:** `id`, `email`, `role`, `firstName`, `lastName`. Holds user information.
* **`LocationInfo`:** `latitude`, `longitude`, `accuracy`, `altitude`, `bearing`, `speed`, `timestamp`, `address`. Represents location data.
* **`LoginRequest`:** `email`, `password`. Used for login requests.

### Data Flow Description

1. **UI Layer:** The user initiates a chat session or sends a message through the UI, triggering a BLoC event to start a new chat session or send a message.
2. **State/Logic Layer:** The BLoC controller handles the event and calls the corresponding service (e.g., `ChatService` for starting a chat session).
3. **Service Layer:** The `ChatService` processes the request, making an API call to start a new chat session or send a message.
4. **API/Network Layer:** The API endpoint `/chat/session` is called with the necessary parameters (e.g., user ID) to start a new chat session.
5. **Repository Layer:** The response from the API is parsed and returned as a `ChatSessionResponse` object, which includes the session ID, success status, and any error messages.
6. **State Update:** The UI is updated with the new data, displaying the chat session ID and any error messages.

For sending a message:

1. **UI Layer:** The user sends a message through the UI, triggering a BLoC event to send a message.
2. **State/Logic Layer:** The BLoC controller handles the event and calls the corresponding service (e.g., `ChatService` for sending a message).
3. **Service Layer:** The `ChatService` processes the request, making an API call to send a message.
4. **API/Network Layer:** The API endpoint `/chat/message` is called with the necessary parameters (e.g., user ID, message text) to send a message.
5. **Repository Layer:** The response from the API is parsed and returned as a `ChatMessageResponse` object, which includes the success status and any error messages.
6. **State Update:** The UI is updated with the new data, displaying any error messages.

### Storage

* **`SharedPreferences`:** Stores user preferences (e.g., theme settings).
* **`SQLite`:** Stores chat session data (e.g., session IDs, message history).
* **`PostgreSQL`:** Stores user information and location data.
* **`REST API`:** Used for external services (e.g., authentication, messaging).

---
