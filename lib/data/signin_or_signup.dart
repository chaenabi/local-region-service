import 'package:flutter/foundation.dart';

class SignInOrSignUp extends ChangeNotifier {
  static bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners();
  }
}