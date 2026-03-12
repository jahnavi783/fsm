# Documentation — fsm

> Auto-generated | Last updated: 2026-03-12 16:05:57 | Commit: `4014a8d` on `main` by jahnavis

---

## Overview
A Dart/Flutter Field Service Management application that manages work orders for service engineers.

## Description
* **Core Product:** The FSM app is designed to manage work orders, track service history, and provide real-time updates to service engineers in the field.
* **Problem Solved:** It solves the problem of inefficient work order management, enabling companies to optimize their service delivery and improve customer satisfaction.
* **Key Features:** The app includes features such as work order assignment, tracking, and completion, as well as a map view for visualizing service engineer locations and routes.
* **Extensibility:** The codebase is designed to be extensible, allowing for easy integration of new features and modules.

## What the Codebase Does
* **Entry Point:** The entry point of the application is located in `lib/app.dart`, which initializes the app and sets up the routing system.
* **Core Feature [name]:** The core feature of the app is the work order management system, implemented in `lib/core/blocs/work_order_bloc.dart`.
* **User Flow:** The user flow begins with the login screen, which authenticates the user and grants access to the main dashboard. From there, users can view assigned work orders, track their progress, and complete tasks.
* **Data:** The app stores data locally using Hive, a lightweight NoSQL database, and synchronizes it with a remote server using a custom networking library.
* **Output:** The output of the app is a list of completed work orders, which are displayed on the dashboard for easy tracking and review.

## System Overview
* **`lib/`** — This folder contains the core logic of the application, including business logic, data models, and networking code.
* **`android/`** — This folder contains the Android-specific implementation of the app, including the build.gradle files and AndroidManifest.xml.
* **`ios/`** — This folder contains the iOS-specific implementation of the app, including the Podfile and Info.plist.
* **`assets/`** — This folder contains static assets used by the app, such as images and fonts.

```mermaid
flowchart TD
    lib[lib/] -->|contains core logic|> business_logic
    lib[lib/] -->|contains data models|> data_models
    lib[lib/] -->|contains networking code|> networking_code
    android[android/] -->|contains Android-specific implementation|> build_gradle_files
    android[android/] -->|contains Android-specific implementation|> AndroidManifest.xml
    ios[ios/] -->|contains iOS-specific implementation|> Podfile
    ios[ios/] -->|contains iOS-specific implementation|> Info.plist
    assets[assets/] -->|contains static assets|> images
    assets[assets/] -->|contains static assets|> fonts
```

The codebase is structured around a modular architecture, with each module responsible for a specific aspect of the application. The `lib/` folder contains the core logic of the app, while the `android/` and `ios/` folders contain platform-specific implementations. The `assets/` folder contains static assets used by the app.

The components in this codebase are designed to be loosely coupled, allowing for easy modification and extension of individual modules without affecting the rest of the application.

---

## Tools & Tech Stack

**Languages:** Dart  93.9%, XML  1.7%, JSON  1.4%, Swift  0.9%, C++  0.6%, YAML  0.5%, Shell  0.5%, CMake  0.3%, Kotlin  0.2%, HTML  0.2%


**Infrastructure:** GitHub Actions


**Repository Type:** `FLUTTER`


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

## Impact Analysis

| Area Impacted | Type of Impact | Severity | Description | Action Required |
| --- | --- | --- | --- | --- |
| Chat Feature | UI | Low | Updated error message for authentication expired. | None |
| Work Orders Dashboard | Functional | Medium | Removed refresh functionality, potential impact on data synchronization. | Review and refactor code to ensure correct behavior.

---

## Commit Change Details

| File Changed | Change Type | Description | Lines Added | Lines Removed | Risk Level |
| --- | --- | --- | --- | --- | --- |
| lib/features/chat/presentation/pages/chatbot_page.dart | Modified | Corrected login error message in ChatbotPageState | 0 | 1 | Low<br> |
| lib/features/work_orders/presentation/pages/dashboard_page.dart | Modified | Removed _handleRefresh method from DashboardPageState | 0 | 11 | Low<br>

---
