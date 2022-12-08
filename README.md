# kavall
Kavall delivery statistics

![kavall1](https://user-images.githubusercontent.com/15160049/206563970-bf35f7e8-9439-4997-b462-90b24b3fe5da.png)

### Environment
Dart 2.18.1

Flutter 3.3.2

### To build the app in release mode:
execute this command in the project direcory: `flutter build apk --release --dart-define="API_BASE_URL=https://europe-west3-getgaston-test.cloudfunctions.net/"`

### To run the app in Android Studio: 
add Additional run args: --dart-define="API_BASE_URL=https://europe-west3-getgaston-test.cloudfunctions.net/"

### To generate files:
execute in the project directory: `flutter packages pub run build_runner build --delete-conflicting-outputs`

### To run the demo on Android device:
Download the [app-release.apk][1] file and install it

[1]: https://github.com/karmazinkd/kavall/blob/main/app-release.apk
