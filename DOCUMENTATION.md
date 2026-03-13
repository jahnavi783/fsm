# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-13 16:09:00 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart/Flutter Field Service Management application that manages work orders for service engineers.

## Description
* **Core Product:** The FSM app is designed to manage work orders, track service engineer locations, and provide real-time updates on job status.
* **Problem Solved:** It solves the problem of inefficient field service management by providing a centralized platform for dispatchers to assign jobs, track progress, and communicate with engineers in real-time.
* **Key Features:**
	+ Work order management
	+ Service engineer location tracking
	+ Real-time updates on job status
	+ Centralized platform for dispatchers to manage jobs
* **Extensibility:** The app is designed to be extensible, allowing developers to easily add new features and integrate with existing systems.

## What the Codebase Does
* **Entry Point:** The entry point of the application is `lib/app.dart`, which sets up the main widget and initializes the app.
* **Core Feature [name]:** The core feature of the app is the work order management system, implemented in `lib/core/blocs/work_order_bloc.dart`.
* **User Flow:** The user flow starts with the login screen, where users enter their credentials to access the app. Once logged in, they can view assigned jobs, track progress, and communicate with dispatchers.
* **Data:** The app stores data locally using Hive, a lightweight NoSQL database, and synchronizes it with the server using a custom networking library.
* **Output:** The output of the app is a real-time dashboard displaying job status, engineer locations, and other relevant information.

## System Overview
* **`lib/`** — contains core business logic, including work order management, service engineer location tracking, and real-time updates on job status.
* **`android/`** — contains Android-specific code for the app, including the main activity and layout files.
* **`ios/`** — contains iOS-specific code for the app, including the main view controller and storyboard files.
* **`lib/core/blocs/`** — contains business logic for work order management, service engineer location tracking, and real-time updates on job status.
* **`lib/core/services/`** — contains services for networking, storage, and other core functionality.

```mermaid
flowchart TD
    lib[Core Business Logic]
    android[Android-Specific Code]
    ios[iOS-Specific Code]
    lib/core/blocs[Work Order Management]
    lib/core/services[Networking & Storage Services]

    lib -->|contains|> lib/core/blocs
    lib -->|contains|> lib/core/services

    android -->|contains|> android/app/build.gradle.kts
    ios -->|contains|> ios/Runner.xcodeproj/project.pbxproj

    lib/core/blocs -->|depends on|> lib/core/services
```

The codebase is structured around a modular architecture, with each module responsible for a specific aspect of the app's functionality. The `lib` folder contains core business logic, while the `android` and `ios` folders contain platform-specific code. The `lib/core/blocs` and `lib/core/services` folders contain business logic and services that are shared across both platforms.

---

## Architecture

## Architecture

### High-Level Design

The FSM application follows a Model-View-Bloc (MVB) architecture pattern, which is an extension of the traditional Model-View-Controller (MVC) pattern. This design allows for a clear separation of concerns between business logic, presentation layer, and data storage.

### Key Components

* **Business Logic**: The core of the application's logic resides in the `lib/core/blocs` folder, which contains various blocs that handle different aspects of the app, such as connectivity, error handling, and synchronization.
* **Presentation Layer**: The UI components are located in the `lib/core/widgets` folder, where you'll find various widgets for displaying data, handling user interactions, and providing feedback to the user.
* **Data Storage**: The application uses Hive for local storage, with the relevant code residing in the `lib/core/storage` folder.
* **Networking**: The networking layer is implemented using Dio Client, located in the `lib/core/network` folder.

### Component Interactions

The components interact with each other through a combination of events and streams. For example:

* The `connectivity_bloc` emits events to notify the UI about changes in network connectivity.
* The `error_handler` bloc receives error events from various parts of the app and handles them accordingly.
* The `sync_bloc` synchronizes data between the local storage and remote servers.

Data flows between layers through a combination of streams, events, and callbacks. For instance:

* The UI widgets emit events to notify the corresponding blocs about user interactions.
* The blocs process these events and update the relevant data in the storage or send requests to the server.

### Entry Points

The main entry points for the application are located in the `lib/app.dart` file, which sets up the root widget and initializes the necessary dependencies. The startup sequence involves:

1. Initializing the Hive storage.
2. Setting up the networking layer.
3. Creating instances of the various blocs.
4. Starting the app's main widget.

Note that this is a high-level overview of the architecture, and there may be additional details or nuances not covered here.

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

### Network and Connectivity

- **GET /connectivity** — Checks if the device has a stable internet connection
- **Stream GET /onConnectivityChanged** — Listens for changes in network connectivity

### Authentication

- **POST /login** — Authenticates user with provided credentials
- **GET /auth/refresh-token** — Refreshes access token when it expires
- **DELETE /auth/logout** — Logs out the current user and clears authentication data

### Work Orders

- **GET /work-orders** — Retrieves a list of work orders for the authenticated user
- **POST /work-orders** — Creates a new work order for the authenticated user
- **GET /work-orders/{id}** — Retrieves details of a specific work order
- **PUT /work-orders/{id}** — Updates an existing work order
- **DELETE /work-orders/{id}** — Deletes a work order

### Documents

- **GET /documents** — Retrieves a list of documents for the authenticated user
- **POST /documents** — Uploads a new document for the authenticated user
- **GET /documents/{id}** — Retrieves details of a specific document
- **PUT /documents/{id}** — Updates an existing document

### Parts

- **GET /parts** — Retrieves a list of parts for the authenticated user
- **POST /parts** — Creates a new part for the authenticated user
- **GET /parts/{id}** — Retrieves details of a specific part
- **PUT /parts/{id}** — Updates an existing part

### Calendar

- **GET /calendar** — Retrieves a list of events in the calendar for the authenticated user
- **POST /calendar** — Creates a new event in the calendar for the authenticated user
- **GET /calendar/{id}** — Retrieves details of a specific event in the calendar

### Settings

- **GET /settings** — Retrieves settings for the authenticated user
- **PUT /settings** — Updates settings for the authenticated user

### Public Routes (no authentication required)

- **GET /** — Redirects to the splash page
- **GET /login** — Displays the login page

---

## Data Flow

## Data Flow

### Data Models

* `ChatSessionResponse`:
	+ `success`
	+ `sessionId`
	+ `user`: `UserInfo`
	+ `message`
* `UserInfo`:
	+ `id`
	+ `email`
	+ `role`
	+ `firstName`
	+ `lastName`
* `LocationInfo`:
	+ `latitude`
	+ `longitude`
	+ `accuracy`
	+ `altitude`
	+ `bearing`
	+ `speed`
	+ `timestamp`
	+ `address`
* `LoginRequest`:
	+ `email`
	+ `password`

### Data Flow Description

Data flows through the system as follows:

1. **Input**: The user interacts with the app, sending a request to start a chat session or login.
2. **Processing**: The app processes the input data and generates relevant models (e.g., `ChatSessionResponse` for chat sessions).
3. **Storage**: Data is stored in various databases and files:
	* Chat session data: likely stored in a database, but specific details not provided.
	* User information: possibly stored in a user management system or database.
	* Location data: potentially stored in a geolocation service or database.
4. **Output**: The app displays the processed data to the user, using widgets such as `PriorityIndicator` and `StatusBadge`.

### Storage

Data is stored in various locations:

* Databases (not specified which ones)
* Files (not specified which files)

Note that this analysis only covers the provided code snippets and does not include any external services or databases that may be used by the app.

---
