# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-15 23:10:42 | Branch: `main`

> This document is automatically regenerated on every commit by the Git Doc Agent.

---

## Overview
A Dart/Flutter Field Service Management application that manages service engineers, work orders, and machine details.

## Description
* **Core Product:** Manages field service operations for a company.
* **Problem Solved:** Eliminates inefficiencies in scheduling, dispatching, and tracking of service engineers.
* **Key Features:** connectivity management, error handling, sync functionality, performance monitoring.
* **Entry Point:** `lib/main.dart`

## What the Codebase Does
* **Entry Point:** The application initializes with `lib/main.dart`, which sets up the app's configuration and routing.
* **Core Feature – Connectivity Management:** The app uses a connectivity bloc to manage network connections and errors, as seen in `lib/core/blocs/connectivity/connectivity_bloc.dart`.
* **User Flow:** Users can navigate through different screens, including a dashboard, work orders list, and service engineer details, using the routing system defined in `lib/core/router/app_router.gr.dart`.
* **Data Layer:** The app stores data locally using Hive, as implemented in `lib/core/storage/hive_service.dart`, and syncs it with a remote server using the sync bloc, defined in `lib/core/blocs/sync/sync_bloc.dart`.
* **Output:** The app displays various screens and widgets to users, including a launch screen, main screen, and work orders list, as seen in `ios/Runner/Base.lproj/LaunchScreen.storyboard` and `android/app/src/main/res/layout/activity_main.xml`.

## System Overview
* **`lib/`** — Contains the core logic of the app, including routing, connectivity management, and data storage.
* **`core/`** — Houses the core features and functionality of the app, including error handling, sync functionality, and performance monitoring.
* **`features/`** — Includes feature-specific modules, such as work orders and service engineers.
* **`services/`** — Defines services used throughout the app, including authentication, location management, and logging.

## Codebase Structure
* **`lib/`** — Contains the main application logic and configuration.
* **`core/`** — Houses core features and functionality, including routing, connectivity management, and data storage.
* **`features/`** — Includes feature-specific modules, such as work orders and service engineers.
* **`services/`** — Defines services used throughout the app.

```mermaid
flowchart TD
    A([lib/main.dart]) --> B([lib/app.dart])
    B --> C([lib/core/])
    B --> D([lib/features/])
    C --> E([lib/core/services/])
    D --> F([lib/features/work_orders/])
```

The codebase is structured around a modular design, with each module responsible for a specific feature or functionality. The `lib` folder contains the main application logic and configuration, while the `core` folder houses core features and functionality. The `features` folder includes feature-specific modules, such as work orders and service engineers, and the `services` folder defines services used throughout the app.

---

## Architecture

## Architecture

### High-Level Design
* **Pattern:** Clean Architecture with a BLoC (Business Logic Component) pattern for state management.
* **Structure:** The project is structured into top-level folders like `lib/core`, `lib/core/blocs`, and `lib/core/services` that reflect the Clean Architecture principles, separating concerns by layer.
* **State Management:** The project uses the BLoC pattern for state management, with a clear separation of presentation logic from business logic.

### Key Components
* **`lib/core/config/`** — This folder contains configuration files and classes that manage app settings and environment-specific configurations.
* **`lib/core/blocs/`** — This folder houses the BLoC implementation, including event handlers, state management, and business logic for various features.
* **`lib/core/services/`** — This folder contains service classes that encapsulate data access, networking, and other external interactions.

### Component Interactions
* **Request Flow:** A user action flows from the UI (e.g., a button press) to the BLoC (e.g., `connectivity_bloc`) which then interacts with services (e.g., `network` service) to fetch or send data.
* **Data Direction:** Responses/data flow back through the services (e.g., `network` service) to the BLoC, and finally to the UI for rendering.
* **Shared Services:** The project has shared/core modules like `di/injection.config.dart`, which provides dependency injection capabilities across the app.

### Entry Points
* **Main Entry:** The main entry point is likely in `lib/main.dart` or a similar file that initializes the Flutter app framework/widget tree.
* **App Init:** The app initialization process might involve files like `lib/core/config/app_config_dev.dart`, which sets up environment-specific configurations.
* **Routing:** Navigation and routing are managed through the `app_router` module, possibly in `lib/core/router/app_router.dart`.

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

* **GET /calendar** — Retrieves the authenticated user's calendar events
* **POST /calendar** — Creates a new calendar event with provided details

### Chatbot

* **GET /chatbot** — Initiates a chat session with the chatbot
* **POST /chatbot** — Sends a message to the chatbot

### Developer Options

* **GET /developer-options** — Retrieves developer options for debugging purposes
* **POST /developer-options** — Updates developer options with new settings

---

## Data Flow

## Data Flow

### Data Models

* **`ChatSessionResponse`:** `success`, `sessionId`, `user`, `message`. Represents a response to starting a chat session.
* **`UserInfo`:** `id`, `email`, `role`, `firstName`, `lastName`. Stores user information.
* **`LocationInfo`:** `latitude`, `longitude`, `accuracy`, `altitude`, `bearing`, `speed`, `timestamp`, `address`. Represents location data.
* **`LoginRequest`:** `email`, `password`. Contains login credentials.

### Data Flow Description

1. **UI Layer:** The user initiates a chat session by clicking a button or navigating to the chat page, triggering a BLoC event to start a new chat session.
2. **State/Logic Layer:** The `ChatSessionBloc` handles the event and sends a request to the service layer to create a new chat session.
3. **Service Layer:** The `ChatSessionService` creates a new chat session and returns a `ChatSessionResponse` object, which includes a unique session ID and user information.
4. **API/Network Layer:** The API call is made to the `/chat/sessions` endpoint using the HTTP POST method.
5. **Repository Layer:** The response from the service layer is parsed into a `ChatSessionResponse` object, which is then returned to the BLoC event handler.
6. **State Update:** The UI is updated with the new chat session information, including the session ID and user details.

1. **UI Layer:** The user sends a message by typing in the chat input field and clicking the send button, triggering a BLoC event to send a message.
2. **State/Logic Layer:** The `ChatMessageBloc` handles the event and sends a request to the service layer to send a new message.
3. **Service Layer:** The `ChatMessageService` processes the request and returns a `ChatMessageResponse` object, which includes a success flag and any error messages.
4. **API/Network Layer:** The API call is made to the `/chat/messages` endpoint using the HTTP POST method.
5. **Repository Layer:** The response from the service layer is parsed into a `ChatMessageResponse` object, which is then returned to the BLoC event handler.
6. **State Update:** The UI is updated with the new message information, including any success or error messages.

1. **UI Layer:** The user requests location data by clicking a button or navigating to the location page, triggering a BLoC event to retrieve location information.
2. **State/Logic Layer:** The `LocationBloc` handles the event and sends a request to the service layer to retrieve location data.
3. **Service Layer:** The `LocationService` processes the request and returns a `LocationInfo` object, which includes location coordinates and other metadata.
4. **API/Network Layer:** The API call is made to the `/location/data` endpoint using the HTTP GET method.
5. **Repository Layer:** The response from the service layer is parsed into a `LocationInfo` object, which is then returned to the BLoC event handler.
6. **State Update:** The UI is updated with the new location information.

### Storage

* **`SharedPreferences`:** Stores user preferences and settings.
* **`SQLite Database`:** Stores chat session data, including messages and user information.
* **`REST API`:** Stores location data and other metadata.

---
