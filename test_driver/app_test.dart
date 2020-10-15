import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_login/models/keys.dart';
import 'package:test/test.dart';

void main() {
  Future<void> delay([int seconds = 1]) async {
    await Future<void>.delayed(Duration(seconds: seconds));
  }

  group('Login App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test(
      'Check sing in was success then show home with user id',
      () async {
        await driver.clearTimeline();
        // find widgets
        final usernameInput =
            find.byValueKey(Keys.loginForm_usernameInput_textField);
        final passwordInput =
            find.byValueKey(Keys.loginForm_passwordInput_textField);
        final continueButton =
            find.byValueKey(Keys.loginForm_continue_raisedButton);

        await driver.waitFor(usernameInput);
        await driver.tap(usernameInput); // acquire focus
        await driver.enterText('Raul'); // enter text
        await driver.waitFor(find.text('Raul')); // verify text appears on UI
        print('entered username');
        await delay();
        await driver.waitFor(passwordInput);
        await driver.tap(passwordInput); // acquire focus
        await driver.enterText('123456Bb'); // enter text
        await driver
            .waitFor(find.text('123456Bb')); // verify text appears on UI
        print('entered password');
        await delay();
        await driver.waitFor(continueButton);
        await driver.tap(continueButton);
      },
    );
  });
}
