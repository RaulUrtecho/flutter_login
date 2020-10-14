import 'package:flutter_login/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/repositories/repositories.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
