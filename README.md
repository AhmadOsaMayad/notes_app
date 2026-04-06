# 📝 Notes App

A sleek, offline-first Flutter notes application for capturing ideas quickly, organizing them with colors, and editing them with a smooth, minimal UI.

![Flutter](https://img.shields.io/badge/Flutter-SDK-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-SDK-0175C2?logo=dart)
![State Management](https://img.shields.io/badge/State_Management-BLoC%2FCubit-6C2DC7)
![Storage](https://img.shields.io/badge/Storage-Hive-F4B400)

---

## ✨ Features

- Create notes with title + content
- Edit existing notes with unsaved-changes protection
- Delete notes with confirmation
- Pick from a rich built-in color palette
- Notes sorted by newest first
- Offline local persistence with Hive
- Arabic/English-aware text direction support
- Clean dark theme with custom typography

---

## 🧱 Tech Stack

- **Flutter** (cross-platform UI)
- **Dart** (language)
- **flutter_bloc / Cubit** (state management)
- **Hive + hive_flutter** (local NoSQL storage)
- **intl** (date formatting)
- **font_awesome_flutter** (icons)
- **modal_progress_hud_nsn** (loading overlay)

---

## 🗂️ Project Structure

```text
lib/
├── cubit/
│   ├── add_note_cubit/
│   └── notes_cubit/
├── helpers/
├── models/
├── views/
└── widgets/
```

- `main.dart` initializes Hive, registers adapters, opens the notes box, and boots the app.
- `models/note_model.dart` defines the persisted note entity.
- `cubit/` contains app state logic for adding and listing notes.
- `views/` and `widgets/` implement UI screens and reusable components.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK (included with Flutter)

### Installation

```bash
git clone https://github.com/AhmadOsaMayad/notes_app.git
cd notes_app
flutter pub get
```

### Run the app

```bash
flutter run
```

---

## 🧪 Development Commands

```bash
# Static analysis
flutter analyze

# Run tests
flutter test

# Generate Hive adapters (if model changes)
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 💾 Data Layer

- Notes are stored locally in Hive box: `notes_box`
- `NoteModel` stores:
  - note title (`title`)
  - note body/content text (currently persisted as `subtitle` in the model for legacy compatibility from the initial implementation)
  - note date (`date`)
  - note color (`color`)
  - Arabic language flags for title/content direction handling

---

## 📱 Platform Support

This project includes Flutter platform folders for:

- Android
- iOS
- Web
- Windows
- Linux
- macOS

---

## 👨‍💻 Author

Built by **Ahmad Osa Mayad**.

If you like the project, consider starring ⭐ the repository.
