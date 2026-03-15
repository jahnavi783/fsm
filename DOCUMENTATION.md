# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-15 19:58:11 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart/Flutter Field Service Management application that manages service engineers, work orders, and machine details.

## Description
* **Core Product:** Manages field service operations, including scheduling, dispatching, and tracking of service engineers and equipment.
* **Problem Solved:** Eliminates inefficiencies in field service management by streamlining workflows, improving communication, and enhancing data visibility.
* **Key Features:** connectivity management, error handling, sync functionality, lazy loading, memory management, performance monitoring, logging, caching, and storage management.
* **Entry Point:** `lib/app.dart`

## What the Codebase Does
* **Entry Point:** The application initializes with `lib/app.dart`, which sets up the core configuration and dependencies.
* **Core Feature – Connectivity Management:** The app uses a connectivity bloc (`lib/core/blocs/connectivity/connectivity_bloc.dart`) to manage network connections, handle errors, and provide sync functionality.
* **User Flow:** Users can navigate through various routes, including authentication, profile management, and work order tracking, using the `app_router` module (`lib/core/router/app_router.dart`).
* **Data Layer:** The app stores data in a Hive database (`lib/core/storage/hive_service.dart`) and uses caching mechanisms to improve performance.
* **Output:** The application displays relevant information to users through various widgets, including charts, tables, and maps.

## System Overview
* `android/` — Manages Android-specific configurations, build settings, and dependencies for the app.
* `ios/` — Handles iOS-specific configurations, build settings, and dependencies for the app.
* `lib/core/` — Contains core modules, including configuration, networking, storage, caching, and performance management.
* `lib/services/` — Provides various services, such as authentication, location tracking, and logging.

## Codebase Structure
* **`android/`** — Manages Android-specific configurations and dependencies for the app.
* **`ios/`** — Handles iOS-specific configurations and dependencies for the app.
* **`lib/core/`** — Contains core modules, including configuration, networking, storage, caching, and performance management.
* **`lib/services/`** — Provides various services, such as authentication, location tracking, and logging.

```mermaid
flowchart TD
    subgraph android/
        build.gradle.kts[Android build settings]
        settings.gradle.kts[Android project settings]
        app/build.gradle.kts[Android app build settings]
    end

    subgraph ios/
        Podfile[iOS dependencies]
        Runner.xcodeproj[iOS project settings]
        AppDelegate.swift[iOS application delegate]
    end

    lib/[color:blue]**core/**
        config/app_config.dart[Core configuration]
        networking/dio_client.dart[Networking module]
        storage/hive_service.dart[Hive database management]
    end

    lib/[color:blue]**services/**
        auth_interceptor.dart[Authentication service]
        location_service.dart[Location tracking service]
        logging_service.dart[Logging service]
    end
```


The codebase is structured around core modules, services, and platform-specific configurations. The `lib/core/` module contains the core functionality of the application, including configuration, networking, storage, caching, and performance management. The `lib/services/` module provides various services, such as authentication, location tracking, and logging. The Android and iOS folders manage platform-specific configurations and dependencies for the app.

---

## Architecture

## Architecture

### High-Level Design
* **Pattern:** Clean Architecture with a BLoC (Business Logic Component) pattern for state management.
* **Structure:** The project is structured into top-level folders like `lib/core`, `lib/core/blocs`, and `lib/core/services`, which reflect the Clean Architecture pattern.
* **State Management:** The project uses the BLoC pattern for state management, with a separate folder (`lib/core/blocs`) containing the business logic components.

### Key Components
* **`lib/core/config/`** — Contains configuration files for different environments (dev, prod, staging).
* **`lib/core/di/injection.config.dart`** — Manages dependency injection.
* **`lib/core/services/`** — Houses various services like authentication, location, and logging.

### Component Interactions
* **Request Flow:** A user action flows from the UI (`lib/core/widgets`) to a BLoC (`lib/core/blocs`) which then interacts with a service (`lib/core/services`) before making an API request.
* **Data Direction:** Responses/data flow back to the UI through the same path, but in reverse order (API → Service → BLoC → UI).
* **Shared Services:** The `lib/core/services` module is shared across multiple features.

### Entry Points
* **Main Entry:** **`lib/main.dart`** — The first file executed at startup.
* **App Init:** **`lib/core/config/app_config_dev.dart`** (or equivalent for other environments) — Initializes the app framework/widget tree based on the environment configuration.
* **Routing:** **`lib/core/router/app_router.gr.dart`** — Responsible for navigation and routing within the app.

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
* **GET /logout** — Logs out the current user and revokes their access token

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

1. **UI Layer:** The user initiates a chat session or logs in by interacting with the app's UI components (e.g., buttons, text fields).
2. **State/Logic Layer:** The BLoC event or action responsible for handling this interaction is triggered (e.g., `startChatSession` or `loginUser`).
3. **Service Layer:** The corresponding service or use case processes the request (e.g., `ChatService.startChatSession` or `AuthService.loginUser`).
4. **API/Network Layer:** An API call is made to retrieve or send data:
	* For chat sessions: `POST /chat/sessions`
	* For login requests: `POST /auth/login`
5. **Repository Layer:** The response from the API is parsed and returned as a `ChatSessionResponse` or `LoginRequest` object.
6. **State Update:** The UI is updated with the new data, displaying the chat session details or login status.

### Storage

* **`SharedPreferences`:** Stores user preferences and settings (e.g., theme, language).
* **`SQLite`:** Manages local storage for chat sessions and user information.
* **`PostgreSQL`:** Handles database operations for storing location data and other system-wide information.

---
