# gowagr_assessment

📘 Project Overview

This project uses a simplified Clean Architecture to maintain separation of concerns while staying pragmatic and scalable.

 🧱 Architecture & Folder Structure

This app follows a **simplified Clean Architecture**, balancing structure and flexibility. It separates concerns into clearly defined layers: `data`, `domain`, `presentation`, and `repository`.

### Folder Structure

```text
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

Uses Riverpod for reactive and testable state management.
StateNotifier is used to control state logic inside domain/notifiers/.
All providers are modular and placed in domain/provider/, rather than one large provider.dart file.
UI components consume state using ref.watch() and Consumer.

💾 Caching Strategy

Caching is handled with Hive, a lightweight key-value database for local persistence.
The app checks for internet connectivity using InternetConnectionChecker:
If online: fetch from API → save result to Hive box (gowagrBox)
If offline: load previously cached JSON from Hive and parse it into model classes
This ensures a seamless offline-first experience for the user.

⚖️ Design Decisions & Trade-offs

✅ Clean Architecture-inspired, without over-complication:
Removed entities, usecases, interfaces, and mappers for simplicity.
Kept state logic and providers lightweight and grouped by feature.
✅ Used StateNotifier instead of Notifier or AsyncNotifier for finer control.
✅ Split providers into provider/ folder to allow scalable state injection.
❌ No abstract interfaces — repositories are concrete classes, injected directly.
✅ Prioritized developer experience and maintainability over academic structure.

🛠 Tech Stack
Flutter
Riverpod
Hive (for caching)
Dio (for HTTP requests)
InternetConnectionChecker
Clean architecture principles

