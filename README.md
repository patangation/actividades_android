# Actividad Android

Welcome to the Actividad Android project! This document provides instructions for setting up the development environment and running the app.

## Table of Contents

- Prerequisites
- Getting Started
- Running the App
- Troubleshooting
- Contributing

## Prerequisites

Before you can run the app, make sure you have the following installed:

1. **Flutter SDK**
   - Follow the official Flutter installation guide for your operating system: https://flutter.dev/docs/get-started/install

2. **Android Studio**
   - Install Android Studio for managing SDKs and emulators.
   - Make sure to install the Flutter and Dart plugins.

3. **Java Development Kit (JDK)**
   - Install JDK 11 or JDK 17. Ensure it’s correctly configured in your system's environment variables.

## Getting Started

1. **Clone the Repository**

   Open a terminal or command prompt and run the following command to clone the repository:

   ```bash
   git clone https://github.com/patangation/actividades_android.git
   ```

2. **Navigate to the Project Directory**

   ```bash
   cd actividades_android
   ```

3. **Install Dependencies**

   Run the following command to install the necessary Flutter packages:

   ```bash
   flutter pub get
   ```

## Running the App

1. **Set Up an Emulator or Connect a Device**

   - **Emulator:** Open Android Studio and create an AVD (Android Virtual Device) from `Tools > Device Manager`.
   - **Physical Device:** Connect your Android device via USB and ensure USB debugging is enabled.

2. **Run the App**

   Use the following command to run the app:

   ```bash
   flutter run
   ```

   Alternatively, you can use Android Studio:
   - Open the project in Android Studio.
   - Select the target device or emulator from the device dropdown.
   - Click the green play button to run the app.

## Troubleshooting

- **SDK Location Issues:** Ensure the Android SDK is installed and correctly configured in Android Studio (`File > Project Structure > SDK Location`).
- **Emulator Problems:** Make sure you have hardware acceleration enabled and sufficient disk space.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. **Fork the Repository:** Click the "Fork" button on GitHub.
2. **Create a Branch:** `git checkout -b feature/your-feature-name`
3. **Make Changes:** Implement your changes and test them.
4. **Commit and Push:**
   ```bash
   git add .
   git commit -m "Add your message here"
   git push origin feature/your-feature-name
   ```
5. **Create a Pull Request:** Open a pull request on GitHub.
