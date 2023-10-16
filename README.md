# InPostDelivery

InPostDelivery is a mobile application designed to provide users with a convenient overview of their packages. The app categorizes packages into two groups: "Ready" and "Other".
For each package, users can access package information, status updates, and details about the sender. 
All package data is persisted, and users have the option to archive packages by swiping the package view to the left.

## Features

- **Package List:** View and manage your packages.
- **Package Categories:** Packages are organized into "Ready" and "Other"
- **Package Details:** Access detailed information about each package, including status, sender details and delivery dates.
- **Archiving:** Archive packages for better organization and historical tracking.

## Technologies Used

- Written in Swift 5.
- Utilizes UIKit for the user interface.
- Employs Realm for local data persistence.
- Utilizes Combine for handling asynchronous and event-driven code.
- Retrieves package data from a custom JsonServe API.
- Requires a minimum iOS version of iOS 16.

## Getting Started

To get started with InPostDelivery, follow these steps:

1. Clone this repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on your iOS 16+ device or simulator.
4. Access your package list, manage packages, and enjoy the app's features.

## API Integration

InPostDelivery communicates with a JsonServe API to fetch package data.

## Data Persistence

Package data is stored and managed locally using Realm. The app ensures that package information is available offline, providing a seamless user experience.

## License

This project is licensed under the [MIT License](LICENSE).
