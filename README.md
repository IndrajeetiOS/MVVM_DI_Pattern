# MVVM + DI Pattern (SwiftUI)

A sample SwiftUI project demonstrating the MVVM architecture with protocol-driven dependency injection, Swift Concurrency (async/await), and best practices for actor isolation.

## Features
- MVVM structure with clear separation of concerns
- Protocol-oriented dependency injection for services
- Swift Concurrency for async data loading
- ObservableObject view models with @Published state
- Error handling and loading state management

## Project Structure
- App/
- View/
- ViewModel/
- Model/
- Services/
- Utilities/

Your structure may vary slightly, but the guiding principle is to keep UI, state, and side effects separated and testable.

## Architecture
- View: SwiftUI views that render UI based on observable state.
- ViewModel: `ObservableObject` types exposing `@Published` properties and orchestrating use cases.
- Service Layer: Protocol-based abstractions (e.g., `CommentsServiceProtocol`) with concrete implementations (e.g., `CommentsService`).

### Dependency Injection
View models depend on protocols, allowing you to inject different implementations (e.g., mock vs. live). Example:

```swift code 
protocol CommentsServiceProtocol {
    func fetchComments() async throws -> [Comment]
}

struct CommentsService: CommentsServiceProtocol {
    func fetchComments() async throws -> [Comment] { /* ... */ }
}
