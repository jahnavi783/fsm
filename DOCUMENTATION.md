# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-15 21:14:13 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart + Flutter Field Service Management application that manages work orders for service engineers.

## Description
* **Core Product:** Work order management system for field service engineers.
* **Problem Solved:** Eliminates inefficiencies in scheduling, dispatching, and tracking of service engineers' activities.
* **Key Features:** connectivity management, error handling, sync functionality, performance monitoring, memory management.
* **Entry Point:** `lib/main.dart`

## What the Codebase Does
* **Entry Point:** The application initializes with `lib/main.dart`, which sets up the app's configuration and routing.
* **Core Feature – Connectivity Management:** The `connectivity_bloc` manages network connectivity and updates the app accordingly.
* **User Flow:** When a user logs in, the `auth_guard` checks their credentials, and if valid, navigates to the main dashboard.
* **Data Layer:** The `hive_service` handles data storage and retrieval for work orders, service engineers' schedules, and other relevant information.
* **Output:** The app displays a list of assigned work orders for each service engineer, along with their status and location.

## System Overview
* **`lib/`** — Contains the main application logic, including routing, configuration, and core features.
* **`lib/core/services/`** — Houses services responsible for data storage, network connectivity, and error handling.
* **`lib/features/work_orders/`** — Manages work order-related functionality, including scheduling and tracking.
* **`lib/app.dart`** — Initializes the app's configuration and sets up routing.

## Codebase Structure
* **`lib/`** — Main application logic and core features.
* **`lib/core/`** — Core services and utilities for data storage, network connectivity, and error handling.
* **`lib/features/`** — Feature-specific modules, including work order management and scheduling.
* **`android/`** — Android-specific code for building the app on this platform.
* **`ios/`** — iOS-specific code for building the app on this platform.

```mermaid
flowchart TD
    A([lib/main.dart]) --> B([lib/app.dart])
    B --> C([lib/core/])
    B --> D([lib/features/])
    C --> E([lib/core/services/])
    D --> F([lib/features/work_orders/])
```

The codebase is structured around a modular architecture, with each module responsible for a specific aspect of the application. The `lib` folder contains the main application logic and core features, while the `core` and `features` folders house services and utilities for data storage, network connectivity, and error handling. The Android and iOS folders contain platform-specific code for building the app on these platforms.

---

## Architecture

## Architecture

### High-Level Design
* **Pattern:** Clean Architecture with a BLoC (Business Logic Component) pattern for state management.
* **Structure:** The project is structured into top-level folders like `lib/core`, `lib/core/blocs`, and `lib/core/services` that reflect the Clean Architecture principles, separating concerns by layers.
* **State Management:** Uses the BLoC pattern with Freezed for event and state serialization.

### Key Components
* **`lib/core/config/`** — Manages app configuration and environment settings.
* **`lib/core/di/injection.config.dart`** — Handles dependency injection setup.
* **`lib/core/services/`** — Houses various services like authentication, location, and logging.
* **`lib/core/blocs/`** — Contains BLoC implementations for different features.

### Component Interactions
* **Request Flow:** A user action flows from the UI (e.g., a button press) to the corresponding BLoC (e.g., `connectivity_bloc`) which then interacts with services (e.g., network service) and APIs.
* **Data Direction:** Responses/data flow back through the same layers, updating the state in the BLoCs and eventually reaching the UI.
* **Shared Services:** The `lib/core/services/` folder contains shared modules like authentication and logging that multiple features depend on.

### Entry Points
* **Main Entry:** **`lib/main.dart`** — The first file executed at startup.
* **App Init:** **`lib/core/config/app_config.dart`** — Initializes the app framework/widget tree based on the environment settings.
* **Routing:** **`lib/core/router/app_router.gr.dart`** — Handles navigation and routing between different screens.

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

### Authentication

* **POST /login** — Handles user login with authentication credentials
* **GET /logout** — Logs out the current user and clears session data

### Work Orders

* **GET /work-orders** — Retrieves a list of work orders for the authenticated user
* **GET /work-orders/{id}** — Retrieves a specific work order by ID
* **POST /work-orders** — Creates a new work order with provided details
* **PUT /work-orders/{id}** — Updates an existing work order with new details
* **DELETE /work-orders/{id}** — Deletes a work order by ID

### Engineers

* **GET /engineers** — Retrieves a list of engineers for the authenticated user
* **GET /engineers/{id}** — Retrieves a specific engineer by ID
* **POST /engineers** — Creates a new engineer with provided details
* **PUT /engineers/{id}** — Updates an existing engineer with new details
* **DELETE /engineers/{id}** — Deletes an engineer by ID

### Parts

* **GET /parts** — Retrieves a list of parts for the authenticated user
* **GET /parts/{id}** — Retrieves a specific part by ID
* **POST /parts** — Creates a new part with provided details
* **PUT /parts/{id}** — Updates an existing part with new details
* **DELETE /parts/{id}** — Deletes a part by ID

### Documents

* **GET /documents** — Retrieves a list of documents for the authenticated user
* **GET /documents/{id}** — Retrieves a specific document by ID
* **POST /documents** — Creates a new document with provided details
* **PUT /documents/{id}** — Updates an existing document with new details
* **DELETE /documents/{id}** — Deletes a document by ID

### Calendar

* **GET /calendar** — Retrieves the user's calendar events
* **POST /calendar** — Creates a new event on the user's calendar

### Chatbot

* **GET /chatbot** — Initiates a chat session with the chatbot
* **POST /chatbot** — Sends a message to the chatbot

### Profile

* **GET /profile** — Retrieves the authenticated user's profile information
* **PUT /profile** — Updates the authenticated user's profile information

---

## Data Flow

## Data Flow

### Data Models

* **`ChatSessionResponse`:** `success`, `sessionId`, `user`, `message`. Represents a response when starting a chat session.
* **`UserInfo`:** `id`, `email`, `role`, `firstName`, `lastName`. Stores user information.
* **`LocationInfo`:** `latitude`, `longitude`, `accuracy`, `altitude`, `bearing`, `speed`, `timestamp`, `address`. Represents location data.
* **`LoginRequest`:** `email`, `password`. Contains login credentials.

### Data Flow Description

1. **UI Layer:** The user initiates a chat session or logs in by interacting with the app's UI (e.g., clicking a button).
2. **State/Logic Layer:** The BLoC event or action responsible for handling this interaction is triggered, which might be `StartChatSession` or `Login`.
3. **Service Layer:** The `ChatService` or `AuthService` processes the request and makes an API call to start a chat session or authenticate the user.
4. **API/Network Layer:** The app sends a POST request to `/chat/session` or `/auth/login` with the required data (e.g., email, password).
5. **Repository Layer:** The response from the API is parsed into a `ChatSessionResponse` object or a `LoginRequest` object.
6. **State Update:** The UI is updated with the new data, displaying the chat session ID and user information.

### Storage

* **`SharedPreferences`:** Stores user login credentials (email, password) for future authentication.
* **`SQLite`:** Stores location data (`LocationInfo`) in a database for offline access.
* **`PostgreSQL`:** Stores user information (`UserInfo`) in a relational database.

---
