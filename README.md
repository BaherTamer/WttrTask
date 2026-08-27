# 🌤️ WttrTask
`Xcode: 27.0+` `iOS: 27.0+` `Swift: 6.4`

A clean architecture modular iOS weather app built with SwiftUI and powered by Swift Concurrency.

The app is deliberately small in scope but fully modularized: five Swift packages behind one thin app target, with each layer isolated behind protocols.

It serves as an assessment task demonstrating modularization, Clean Architecture, and dependency injection applied to a real-world use case.

<br>

## 🖼️ Screenshots
| **Initial** | **Loading** | **Loaded** | **City Not Found** | **No Connection** |
| ----------- | ----------- | ---------- | ------------------ | ----------------- |
| ![Initial State](README%20Content/Screenshots/Initial-State.png) | ![Loading State](README%20Content/Screenshots/Loading-State.png) | ![Loaded State](README%20Content/Screenshots/Loaded-State.png) | ![Error State](README%20Content/Screenshots/Error-State.png) | ![Network State](README%20Content/Screenshots/Network-State.png) |

<br>

## 🌟 Features
* Searching for any city and fetching its current weather conditions
* Persisting the last searched city and restoring it automatically on launch
* Handling all view states: initial, loading, loaded, and error
* Mapping transport errors into typed, user-facing messages (no internet, city not found, service unavailable)
* Retrying a failed request directly from the error view
* Performing async networking with `URLSession` and HTTP status validation
* Abstracting requests behind a reusable `Endpoint` protocol with headers and query parameters
* Mapping API responses into domain entities through a shared `Domainable` protocol
* Resolving dependencies per module through a shared DI container
* Injecting the base domain from an `.xcconfig` file instead of hardcoding it

<br>

## 🧩 Diagrams

> These diagrams were generated using Claude AI.

#### 🔻 High-Level Diagram
How the packages depend on each other.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="README%20Content/Diagrams/High-Level-Diagram-dark.png">
  <img alt="High-Level Diagram" src="README%20Content/Diagrams/High-Level-Diagram-light.png">
</picture>

#### 🔻 Clean Architecture Diagram
How the layers are arranged inside a feature module.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="README%20Content/Diagrams/Clean-Architecture-Diagram-dark.png">
  <img alt="Clean Architecture Diagram" src="README%20Content/Diagrams/Clean-Architecture-Diagram-light.png">
</picture>

#### 🔻 Request Flow Diagram
The flow at runtime during a single city search, and what type the value carries in between.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="README%20Content/Diagrams/Request-Flow-Diagram-dark.png">
  <img alt="Request Flow Diagram" src="README%20Content/Diagrams/Request-Flow-Diagram-light.png">
</picture>

<br>

## 🗂️ Modules
**`CoreModule:`**
Responsible for containing shared abstractions and utilities used across multiple modules, such as the DI resolver, base view model and view state contracts, the `Domainable` mapping protocol, and Foundation extensions.

**`NetworkModule:`**
Responsible for handling all networking operations, such as building URL requests from endpoints, sending them, validating responses, and mapping transport failures into typed errors.

**`WttrShared:`**
Responsible for hosting generic views and design constants that are shared between feature modules, such as the reusable error screen, spacing, and sizing values.

**`Feature Modules:`**
Each module represents a distinct feature in the app and follows a consistent structure based on Clean Architecture principles:
  * Divided into Data, Domain, and Presentation layers.
  * Implements the MVVM (Model-View-ViewModel) design pattern.
  * Registers its own dependencies into the shared DI container.
  * Built to be self-contained and modular for scalability and testability.

<br>

## 📦 Dependencies
This project uses SPM (Swift Package Manager) as dependency manager.
* **[Factory](https://github.com/hmlongco/Factory):** Responsible for dependency injection and service resolving

<br>

## ☁️ API
This project uses the [wttr.in](https://github.com/chubin/wttr.in) weather service, consuming its JSON output format.

```
GET https://wttr.in/{city}?format=j1
```

The base domain is not hardcoded, it is defined in `Config.xcconfig`, exposed through `Info.plist`, and read at runtime by the network layer.

<br>

## 🛠️ Tech Stack
* Swift 6
* SwiftUI
* SPM (Swift Package Manager)
* Swift Concurrency
* Observation Framework
* Dependency Injection
* Modularization
* Clean Architecture
* MVVM (Model-View-ViewModel) Design Pattern
* Protocol-Oriented Programming
* URLSession
* UserDefaults
* XCConfig-Based Configuration
