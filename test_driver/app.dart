import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_login/main.dart' as app;

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}

//run ----------- flutter drive --target=test_driver/app.dart
