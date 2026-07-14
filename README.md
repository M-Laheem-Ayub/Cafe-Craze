# ☕ Cafe Craze

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)

**Cafe Craze** is a premium cross-platform coffee shop application built with Flutter. It provides coffee lovers with a seamless and intuitive interface to explore, customize, and order their favorite coffee blends and premium beans.

---

## ✨ Features

- **🏠 Interactive Home Screen:** Browse through various coffee categories and premium beans.
- **🔍 Smart Search & Categorization:** Easily find your desired brew using the built-in search box and category selector.
- **📖 Detailed Product Pages:** In-depth views of coffees and beans, including descriptions, sizes, and pricing.
- **🛒 Shopping Cart System:** Add items to your cart, adjust quantities, and manage your order seamlessly.
- **❤️ Favorites:** Save your most loved coffee items to your favorites list for quick access later.
- **📜 Order History:** Keep track of all your past purchases and orders in one dedicated place.
- **🎨 Custom UI/UX:** Beautifully crafted custom app bars, bottom navigation, and side drawers for a premium user experience.

---

## 📸 Screenshots

| Splash Screen | Home Page | Details Page | Cart Page |
| :---: | :---: | :---: | :---: |
| <img src="assets/images/splash-screen.jpg?v=2" width="200"/> | <img src="assets/images/home-screen.jpg?v=2" width="200"/> | <img src="assets/images/detail-screen.jpg?v=2" width="200"/> | <img src="assets/images/cart-screen.jpg?v=2" width="200"/> |

---

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **Design Pattern:** Modular UI Components
- **Asset Management:** Custom icons and high-quality images

---

## 📁 Project Structure

```text
lib/
 ┣ data/                    # Mock data for coffee, beans, cart, favorites, and history
 ┣ BeansList.dart           # UI for listing premium beans
 ┣ CartPage.dart            # Shopping cart management screen
 ┣ CategorySelector.dart    # Horizontal category filtering component
 ┣ CoffeeList.dart          # UI for listing coffee items
 ┣ DetailsPage.dart         # Detailed view for individual products
 ┣ FavoritesPage.dart       # Screen for managing liked items
 ┣ HomePage.dart            # Main landing screen
 ┣ MyAppbar.dart            # Custom top app bar widget
 ┣ MyBottomNavbar.dart      # Custom bottom navigation widget
 ┣ MyDrawer.dart            # Custom side menu widget
 ┣ MyText.dart              # Reusable custom typography widget
 ┣ OrderHistoryPage.dart    # Screen showing past orders
 ┣ SearchBox.dart           # Search input component
 ┣ SplashScreen.dart        # Initial app launch screen
 ┗ main.dart                # App entry point
```

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version 3.7.2 or higher)
- Android Studio / VS Code
- Android SDK or Xcode (for iOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/M-Laheem-Ayub/Caf-Craze.git
   ```

2. **Navigate to the project directory**
   ```bash
   cd Caf-Craze
   ```

3. **Get dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🏗️ Build Release APK

To generate a production-ready APK for Android, run the following command:

```bash
flutter build apk --release
```
The APK will be available at `build/app/outputs/flutter-apk/app-release.apk`.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/M-Laheem-Ayub/Caf-Craze/issues).

---

Made with ❤️ using Flutter.
