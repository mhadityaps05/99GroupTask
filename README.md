
# 99GroupTask

A mobile application built as an assignment project for property listings and details, following specific requirements including MVVM architecture, asynchronous data handling, and an interactive map feature.



## Table of Contents
- [Project Description](#project-description)
- [Features](#features)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Setup](#setup)
- [Usage](#usage)
- [Testing](#testing)

## Project Description
This project is a mobile application developed to display property listings with details and location mapping, adhering to the given requirements. The app is built using:
- **Swift** for iOS, following **MVVM architecture** for clean code organization.
- **UIKit** and **Storyboard** for the user interface design.
- **Async/Await** for smooth asynchronous data handling and network operations.

## Features
- **Property Listings**: Displays a list of available properties with key details.
- **Property Detail View**: Shows in-depth information about each property, including images, size, price, and more.
- **Map Integration**: An in-app map shows the location of each property with markers.
- **Dependency Injection** (optional): Used for injecting dependencies to improve testability.
- **Unit Testing**: Unit tests are added for core functionality to ensure reliability.

## Architecture
The app follows the **MVVM (Model-View-ViewModel)** pattern:
- **Model**: Contains data structures and handles data management.
- **ViewModel**: Manages data processing, format handling, and business logic.
- **View**: Displays data received from the ViewModel, ensuring a separation of concerns.

This architecture allows for modular and testable code, making it easier to maintain and expand.

## Requirements
- **Swift** and **Xcode** (for iOS)
- **Async/Await** for handling asynchronous tasks
- **MapKit** for map features
- JSON data files: `searchResults.json` and `listingDetail.json` are included for offline data loading.

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mhadityaps05/99GroupTask.git
   cd 99GroupTask
   ```

2. **Open the Project**: Open the project in Xcode:
   ```bash
   open 99GroupTask.xcodeproj
   ```

3. **Build and Run**: Build and run the project on an iOS simulator or device.

## Usage

- **Listing Screen**: View all properties.
- **Detail Screen**: Tap on a property to view detailed information.
- **Map View**: Tap the "Map" button to view the property location on a map.

## Testing
- **Unit Tests**: Unit tests are available for core components. These tests can be run directly in Xcode by selecting the test target.

## Demo Video

A demo video explaining the app’s features, architecture, and testing can be viewed [here](https://drive.google.com/file/d/15jxxU-Z0ZKGDx-bdMEXdWH7YJPxZTmCm/view?usp=share_link).


## License
This project is licensed under the MIT License.
