<div align="center">

# Flutter Clean Architecture Codebase

**A Flutter starter codebase built on Clean Architecture principles for maintainable, scalable, and flexible apps.**

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-0175C2?style=for-the-badge&logo=flutter&logoColor=white)

</div>

---

## Overview

This repository is a reference codebase for structuring Flutter apps with **Clean Architecture**. Each feature is split into data, domain, and presentation layers, with Riverpod for dependency injection and state, auto_route for navigation, and Dio for networking. Working auth, posts, and users features show the pattern end to end.

## Features

- **Feature-first Clean Architecture:** data (DTOs, data sources, repositories), domain (entities, interfaces, use cases), and presentation (screens).
- **Example features:** login (auth), posts, and users.
- **Riverpod providers** for dependency injection and state management.
- **Typed routing** with auto_route code generation.
- **Networking layer** with Dio and HTTP client providers and a central API config.

## Tech Stack

| Area | Technology |
| --- | --- |
| Framework | Flutter, Dart 3 |
| State management | Riverpod |
| Navigation | auto_route |
| Networking | Dio, http |
| Fonts | Google Fonts |

## Getting Started

### Prerequisites

- Flutter SDK (Dart 3.11 or newer)

### Installation

```bash
git clone https://github.com/RithyBondeth/Flutter-CleanArchitecture-Codebase.git
cd Flutter-CleanArchitecture-Codebase
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Project Structure

```text
Flutter-CleanArchitecture-Codebase/
└── lib/
    ├── cores/
    │   ├── config/          # API configuration
    │   └── network/         # Dio and HTTP client providers
    ├── features/
    │   ├── auth/            # data / domain / presentation / providers
    │   ├── posts/
    │   └── users/
    ├── routes/              # auto_route router
    └── main.dart
```

## Author

**Rithy Bondeth** — Full Stack Developer & AI Engineer

[![Portfolio](https://img.shields.io/badge/Portfolio-0A0A0A?style=for-the-badge&logo=vercel&logoColor=white)](https://bondeth.dev)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/RithyBondeth)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rithy-bondeth-484073282/)
