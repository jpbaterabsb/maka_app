# Maka App

Maka App is a mobile application built with Flutter that allows users to buy items.

## Getting Started

### Prerequisites

Before running the app, make sure you have the following installed:

- Flutter SDK
- Dart SDK
- Android Studio or Xcode (depending on the platform you want to run the app on)

### Installing

1. Clone this repository:
   
```shell
git clone https://github.com/your-username/maka-app.git
```


2. Navigate to the project directory:

```shell
cd maka-app
```


3. Install the dependencies:

```shell
flutter pub get
```


### Running

To run the app, connect a mobile device or start a simulator, then run the following command:


```shell
flutter run
```


### Note

If you want to run the app in physical device replace lib/main.dart

example:

IP: 192.168.1.8
baseUrl: 'http://192.168.1.8:3333'

```dart
     var baseUrl = isSimulator()// ignore: unused_local_variable
        ? (isIOS() ? 'http://localhost:3333' : 'http://10.0.2.2:3333')
        : 'http://192.168.1.8:3333'; // replace with your ip <=============
```


