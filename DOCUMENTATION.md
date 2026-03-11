# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-11 15:54:03 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart + Flutter Finance Management System application that provides a comprehensive platform for users to manage their finances.

## Description
- **Core Product:** A mobile app for personal finance management, including budgeting, expense tracking, and investment monitoring.
- **Problem Solved:** Helps users track and manage their expenses, income, and investments in one place, reducing financial stress and improving decision-making.
- **Key Features:** Budgeting, Expense Tracking, Investment Monitoring, Real-time Financial Updates, Customizable Dashboards.
- **Target Users:** Individuals seeking to manage their personal finances effectively.

## What the Codebase Does
- **Entry Point:** `lib/app.dart` serves as the main entry point for the application, initializing the app and setting up the core functionality.
- **Core Feature:** The app's core feature is its ability to track user expenses and income through a robust budgeting system, utilizing the `blocs` architecture in `lib/core/blocs/` to manage state changes. This is implemented using the `connectivity_bloc.dart` file.
- **User Flow:** A user interacts with the app by logging in, viewing their dashboard, adding transactions, and monitoring their financial progress over time. The app's navigation is managed through the `app_router.dart` file in `lib/core/router/`.
- **Data Storage:** The app stores data locally using Hive, a NoSQL database, as implemented in `lib/core/storage/hive_service.dart`. Data is also synced with remote servers for backup and accessibility.
- **Output:** The app produces real-time financial updates, customizable dashboards, and alerts to help users stay on top of their finances.

## Relevant Source Files
- `lib/app.dart`
- `lib/core/blocs/connectivity_bloc.dart`
- `lib/core/router/app_router.dart`
- `lib/core/storage/hive_service.dart`
- `android/app/src/main/AndroidManifest.xml`
- `ios/Runner/AppDelegate.swift`

## System Overview
- **`android/`** — Contains Android-specific project files and configurations for building the app on Android devices.
- **`ios/`** — Contains iOS-specific project files and configurations for building the app on iOS devices.
- **`lib/`** — The main directory for the Flutter application, containing core logic, features, and services.
- **`lib/core/`** — Houses the core functionality of the app, including business logic, data storage, and networking.
- **`lib/features/`** — Currently empty, but intended to hold feature-specific implementations.

---

## Architecture

## Architecture

### High-Level Design
- **Pattern:** Clean Architecture with BLoC (Business Logic Component) for state management and MVVM (Model-View-ViewModel) for presentation layer separation.
- **Layers:**
  - Presentation Layer (`lib/core/widgets/`)
  - Business Logic Layer (`lib/core/blocs/`, `lib/core/services/`)
  - Data Access Layer (`lib/core/storage/`, `lib/core/network/`)
  - Domain Layer (`lib/core/config/`, `lib/core/models/`)

### Relevant Source Files
- `lib/main.dart`
- `lib/core/blocs/connectivity_bloc.dart`
- `lib/core/services/hive_service.dart`
- `lib/core/storage/cache_manager.dart`
- `lib/core/network/dio_client.dart`
- `lib/core/config/app_config_dev.dart`
- `lib/core/models/chat_models.dart`
- `lib/core/widgets/fsm_app_bar.dart`

### Key Components
- **`lib/core/blocs/`** — Manages business logic and state for the app, using BLoC pattern.
- **`lib/core/services/`** — Provides data access and network functionality to the app.
- **`lib/core/storage/`** — Handles storage operations for the app, including caching and database management.
- **`lib/core/network/`** — Manages network requests and responses for the app.

### Component Interactions
- The presentation layer calls the business logic layer through BLoC events and states.
- The business logic layer interacts with the data access layer to retrieve or update data.
- Data flows between components using a combination of BLoC events, streams, and shared state management.
- The app uses Hive for local storage and caching.

### Entry Points
- **`lib/main.dart`** — This is the entry point of the app, responsible for initializing the Flutter engine and setting up the app's main widget.

---

## Tools & Tech Stack

**Languages:** Dart  93.9%, XML  1.7%, JSON  1.4%, Swift  0.9%, C++  0.6%, YAML  0.5%, Shell  0.5%, CMake  0.3%, Kotlin  0.2%, HTML  0.2%


**Infrastructure:** GitHub Actions


---

## Code Quality Metrics

| Metric | Value | Status |
|---|---|---|
| Total Project Files | 759 | ℹ️ Info |
| Primary Language | Dart  98.3%  (619 files) | ✅ Good |
| Test Files | 53 | ✅ Good |
| Test / Lint / Build | test=N/A, lint=N/A, build=100% | ✅ Good |
| Dependencies | N/A | ℹ️ Info |
| Dockerfile Present | No | ⚠️ Average |

---

## API Endpoints

## API Endpoints
### Error Handling Endpoints

* **GET /error** — Handles error exceptions and returns a Failure object.

### Authentication Endpoints

* **POST /login** — Authenticates user credentials and redirects to protected routes if successful.

### Route Navigation Endpoints

* **GET /** — Redirects to the splash page.
* **GET /app** — Redirects to the main navigation route, guarded by authentication.
* **GET /protected** — Protected route that requires authentication (not explicitly defined in the code, but implied by the AuthGuard usage).

### Route Observers Endpoints

* **None** (The AppRouteObserver is used for tracking navigation events and syncing state with NavigationBloc, but it does not provide any public API endpoints.)

Note: The provided code focuses on error handling, authentication, and route navigation using Auto Router. There are no explicit REST API endpoints defined in the code.

---

## Data Flow

## Data Flow

### Data Models

* `ChatSessionResponse`:
	+ `success`
	+ `sessionId`
	+ `user` (optional)
	+ `message` (optional)
* `UserInfo`:
	+ `id` (optional)
	+ `email`
	+ `role`
	+ `firstName` (optional)
	+ `lastName` (optional)
* `LocationInfo`:
	+ `latitude`
	+ `longitude`
	+ `accuracy` (optional)
	+ `altitude` (optional)
	+ `bearing` (optional)
	+ `speed` (optional)
	+ `timestamp`
	+ `address` (optional)
* `LoginRequest`:
	+ `email`
	+ `password`

### Data Flow Description

Data flows through the system as follows:

1. **Input**: The user interacts with the app, sending a request to start a chat session or login.
2. **Processing**: The app processes the input data using services and models (e.g., `ChatSessionResponse` is created from JSON data).
3. **Storage**: Data is stored in databases or files, such as:
	* Chat session data: stored in a database (not explicitly mentioned)
	* User information: stored in a database (not explicitly mentioned)
	* Location data: stored in a file or database (not explicitly mentioned)
	* Login request data: not explicitly stored
4. **Output**: The app displays the processed data to the user, such as:
	+ Chat session response: displayed to the user
	+ User information: displayed to the user
	+ Location data: not explicitly displayed

### Storage

Data is stored in:

* Databases (not explicitly mentioned)
* Files (e.g., location data)

Note that some storage locations are not explicitly mentioned, but can be inferred based on the context.

---
