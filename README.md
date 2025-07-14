# gowagr_assessment

📘 Project Overview

🧱 Architecture & Folder Structure

This project uses a simplified Clean Architecture to maintain separation of concerns while staying pragmatic and scalable.

Folder Structure
lib/
├── core/                         # Global utilities, constants, services
│   ├── constants/
│   ├── utils/
│   └── services/
├── features/
│   └── dashboard/
│       ├── data/                # API models and data sources (Hive, remote)
│       │   ├── models/
│       │   └── datasource/
│       ├── domain/              # State logic and providers
│       │   ├── notifiers/       # Riverpod StateNotifiers
│       │   └── provider/        # Split Riverpod providers by concern
│       ├── repository/          # Concrete repositories (no interfaces)
│       └── presentation/        # UI layer (widgets, pages)
│           ├── pages/
│           └── widgets/
└── main.dart
🧠 State Management

Uses Riverpod for managing application state.
StateNotifier classes handle business logic and live inside domain/notifiers/.
Providers are broken down into modular files inside domain/provider/ for better structure and easier scalability.
UI interacts with state through ref.watch() and Consumer.
💾 Caching Implementation

Hive is used as the local storage solution.
Inside DashboardNotifiers, the gowagr() method handles:
Checking connectivity via InternetConnectionChecker.
On success: fetching data from the API and saving it to Hive.
On failure (offline): loading from cached Hive data (gowagrBox).
Cached data is parsed back into model classes for rendering in the UI.
⚖️ Decisions & Trade-offs

❌ No entities, usecases, mappers, or abstract interfaces — kept architecture lean and focused.
✅ Split provider/ folder improves maintainability and modularity without over-engineering.
✅ Clean separation between layers (data, domain, presentation), without deep nesting.
❌ Repositories are implemented directly without abstraction for quicker development and fewer indirections.
✅ Designed to scale progressively — complexity can be introduced later if needed.
