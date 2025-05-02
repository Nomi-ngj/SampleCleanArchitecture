
# 📦 SampleCleanArchitecture

This is a modular and scalable iOS application built with **Clean Architecture**, **SOLID principles**, and **modern Swift concurrency**. The project demonstrates how to organize your app using feature-based modules (`User`), separating business logic, data handling, and presentation.

---

## 👨‍💻 About This Project

This project was created to help iOS developers structure real-world apps in a way that is testable, maintainable, and scalable. Whether you're working on a startup MVP or an enterprise-grade product, this example provides a clean and modular foundation.

---

## 🧱 Architecture Highlights

- SwiftUI-based MVVM Presentation Layer
- Clean Architecture (Domain, Data, Presentation)
- Async/Await for networking
- Shared reusable APIService
- Decoupled Use Cases and Repositories
- Fully testable components

---

## 📂 Folder Structure

```│ Project Root
├── Modules
│   ├── User
│   │   ├── Data
│   │   │   └── Remote
│   │   │       └── UserRemoteDataSource.swift
│   │   ├── Domain
│   │   │   ├── Entities
│   │   │   │   └── User.swift
│   │   │   ├── Repositories
│   │   │   │   └── UserRepository.swift
│   │   │   └── UseCases
│   │   │       └── GetUsersUseCase.swift
│   │   └── Presentation
│   │       ├── ViewModels
│   │       │   └── UserListViewModel.swift
│   │       ├── Views (SwiftUI)
│   │       │   └── UserListViewModel.swift
│   │       └── ViewControllers (UIKit)
│   │           └── UserListViewController.swift
│   ├── New Module
├── Shared
│   └── Networking
│       └── APIService.swift
└── Tests
    ├── DomainTests
    │   └── GetUsersUseCaseTests.swift
    └── DataTests
        └── APIServiceTests.swift

```

---

## 🚀 How It Works

1. `UserListView` displays a table view of users  
2. `UserListViewModel` uses `GetUsersUseCase`  
3. `GetUsersUseCase` uses `UserRepository`  
4. `UserRemoteDataSource` (conforming to UserRepository) fetches users via `DefaultAPIService`  
5. Results or errors are passed back up to the view model and UI

---

## 🧪 Testing

This project includes unit tests for:
- Use Cases (e.g. `GetUsersUseCase`)
- APIService decoding using live endpoints

Run tests via:
```bash
⌘ + U (in Xcode)
```

---

## 📡 API Reference

- Users API: https://jsonplaceholder.typicode.com/users

---

## 📥 Setup

1. Clone this repo  
2. Open `SampleCleanArchitecture.xcodeproj` in Xcode  
3. Run on simulator or device

---

## 📌 Requirements

- Xcode 14+
- iOS 15+
- Swift 5.7+

---

## 📄 License

Copyright (c) 2025 Nouman Gul


---

## 🔄 Shared ViewModel Across SwiftUI & UIKit

This project demonstrates how to reuse the same `UserListViewModel` across **SwiftUI** and **UIKit**, allowing consistent business logic while maintaining separate UI layers.

### ✨ SwiftUI Usage

```swift
let repo = UserRemoteDataSource()
let useCase = GetUsersUseCase(repository: repo)
let viewModel = UserListViewModel(getUsersUseCase: useCase)

UserListView(viewModel: viewModel)
```

### ✨ UIKit Usage

```swift
let repo = UserRemoteDataSource()
let useCase = GetUsersUseCase(repository: repo)
let viewModel = UserListViewModel(getUsersUseCase: useCase)

let userListVC = UserListViewController(viewModel: viewModel)
```

### ✅ Benefits

- Promotes **code reuse** between UIKit and SwiftUI
- Keeps your **business logic decoupled** from the UI
- Ideal for **gradual SwiftUI adoption** or testing UI strategies side-by-side

