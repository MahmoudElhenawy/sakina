# 🕌 Sakina – Islamic Companion App


**Sakina** is an Islamic mobile application built with Flutter to help users maintain their daily spiritual practices.
The app provides essential Islamic features such as Quran reading, Hadith, daily Azkar, prayer times, and Qibla direction in a clean and easy-to-use interface.

---

## 📖 Overview

Sakina aims to make everyday worship more accessible by bringing the most commonly used Islamic tools into a single mobile application.
The application focuses on simplicity, usability, and a calm interface for daily spiritual use.

---

## ✨ Key Features

* 📖 Quran reading
* 📜 Collection of Hadith
* 🌅 Daily Azkar (morning & evening)
* 🕰 Prayer times based on location
* 🧭 Qibla direction finder
* 📿 Electronic Tasbeeh counter
* 🌙 Clean and minimal user interface

---

## 🛠 Tech Stack

### 📱 Mobile Application

* Flutter
* Dart

### 🧩 Architecture

* MVVM (Model – View – ViewModel)

### 🌐 Services

* Prayer Times API
* Location services for Qibla direction

---

## 🏗 Project Structure

```
lib/
 ├── core
 │   ├── constants
 │   └── utilities
 │
 ├── models
 │
 ├── views
 │   ├── quran
 │   ├── hadith
 │   ├── azkar
 │   ├── prayer_times
 │   ├── qibla
 │   └── tasbeeh
 │
 ├── viewmodels
 │
 ├── services
 │
 └── main.dart
```

---

## ⚙️ Installation

Clone the repository

```bash
git clone https://github.com/username/sakina.git
```

Navigate to the project folder

```bash
cd sakina
```

Install dependencies

```bash
flutter pub get
```

Run the application

```bash
flutter run
```

---

## 🚀 Future Improvements

* Quran audio recitation
* Notifications for prayer times
* Additional Azkar collections
* Multiple language support
