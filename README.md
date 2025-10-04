# VoteFlow

A Swift SDK for feature voting and user feedback, powered by [FeatureFlow](https://github.com/BNE003/FeatureFlowGit).

## Features

- Feature voting system with upvote functionality
- User comments and discussions on feature requests
- Submit new feature proposals
- Native SwiftUI implementation for iOS and macOS
- Real-time updates via Supabase backend
- Cross-platform support (iOS 16+, macOS 13+)

## Installation

### Swift Package Manager

In Xcode:
1. File → Add Package Dependencies
2. Enter URL: `https://github.com/BNE003/VoteFlow`
3. Select version

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/BNE003/VoteFlow", from: "1.0.0")
]
```

## Quick Start

### 1. Supabase Setup

Create a Supabase project and set up the FeatureFlow database schema (see [FeatureFlow Setup](https://github.com/BNE003/FeatureFlowGit)).

### 2. Integration

```swift
import SwiftUI
import VoteFlow

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            FeatureFlowView(appId: "your-app-id")
        }
    }
}
```

This provides a complete feature voting interface including:
- List of all feature requests
- Voting functionality
- Detail view with comments
- Form for submitting new features

### 3. Custom Integration

For more control, you can use individual views separately:

```swift
import SwiftUI
import VoteFlow

struct ContentView: View {
    @StateObject private var client = SupabaseClient()

    var body: some View {
        TabView {
            FeatureListView(client: client, appId: "your-app-id")
                .tabItem {
                    Label("Features", systemImage: "star")
                }

            // Your other views
        }
    }
}
```

## Usage

### App ID

Each app requires a unique `appId` to organize features:

```swift
FeatureFlowView(appId: "my-awesome-app")
```

### User Identifier

VoteFlow automatically uses a device-specific identifier to track votes. Users can vote once per feature.

## Requirements

- iOS 16.0+ / macOS 13.0+
- Swift 5.7+
- Xcode 14.0+

## Dependencies

- [FeatureFlow](https://github.com/BNE003/FeatureFlowGit) - Core SDK for feature management

## License

MIT License

## Support

For questions or issues, please open an issue on GitHub.
