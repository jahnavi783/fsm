# FSM App (Flutter Application)

This FSM Application is built with Flutter using **Clean Architecture** and **BLoC** state management solution. The project aims to provide a clear separation of concerns, maintainable code, and scalable design.

## Table of Contents

- [Architecture](#architecture)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Folder Structure](#folder-structure)
- [State Management (BLoC)](#state-management-bloc)

## Architecture

The project is based on **Clean Architecture**, ensuring a well-structured, testable, and maintainable codebase. The architecture consists of the following layers:

1. **Domain Layer**: Contains the business logic and use cases.
2. **Data Layer**: Handles data operations, such as API calls and local database management.
3. **Presentation Layer**: Deals with the UI components, using BLoC for state management.

### Layers and Responsibilities:

- **Entities**: Represent the core objects in the app.
- **Use Cases**: Define the business logic and actions to be performed on the data.
- **Repositories**: Abstract data sources and act as a bridge between the data layer and domain layer.
- **BLoC (Business Logic Component)**: Manages the state and business logic in the presentation layer.
- **UI**: Flutter widgets that are only concerned with presenting the data to the user.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Flutter (SDK): [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart (SDK): [Install Dart](https://dart.dev/get-dart)
- A code editor (VS Code or Android Studio is recommended)

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/CreativeDT/fsm-app-fe-flutter.git
   cd fsm-app-fe-flutter
   dart run build_runner watch --delete-conflicting-outputs
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app on an emulator or connected device:
   ```bash
   flutter run
   ```

## Folder Structure

The project follows a typical Clean Architecture folder structure:

```
lib/
├── core/
│   └── utils/             # Utility classes and helper functions
├── data/
│   ├── models/            # Data models
│   ├── repositories/      # Repository implementations
│   └── sources/           # Data sources (API, DB, etc.)
├── domain/
│   ├── entities/          # Core business entities
│   ├── repositories/      # Repository interfaces
│   └── usecases/          # Business logic use cases
├── presentation/
│   ├── bloc/              # BLoC files (states and events)
│   ├── pages/             # Screens and UI components
│   └── widgets/           # Reusable UI components
└── main.dart              # Entry point of the application
```

## State Management (BLoC)

The project uses **BLoC** for managing state and ensuring a clear flow of data between the UI and the business logic layer. Key components of the BLoC architecture:

- **Events**: User interactions or triggers that initiate changes in the app.
- **States**: Represent the state of the UI at any given moment.
- **BLoC**: The core component that takes events, processes them, and outputs new states.
