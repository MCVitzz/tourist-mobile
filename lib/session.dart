import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/services/providers/provider.dart';

class Session {
  static final Session _session = Session.internal();

  static User currentUser;

  factory Session() {
    return _session;
  }

  static Function onLogin;

  Session.internal();

  static Future<bool> isLoggedIn() async {
    return await FlutterKeychain.get(key: 'username') != null;
  }

  static void login(User user) async {
    await FlutterKeychain.put(key: 'username', value: user.name);
    currentUser = user;
    onLogin();
  }

  static Future<String> getUser() async {
    return await FlutterKeychain.get(key: 'username');
  }

  static void logout() async {
    await FlutterKeychain.remove(key: 'username');
    onLogin();
  }
}
