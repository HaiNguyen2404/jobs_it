import 'package:hive_flutter/hive_flutter.dart';

class HiveCredentialsStorage {
  static const String boxName = 'credentialsBox';
  static const String usernameKey = 'username';
  static const String passwordKey = 'password';

  Future<void> saveCredentials(String username, String password) async {
    var box = await Hive.openBox(boxName);
    await box.put(usernameKey, username);
    await box.put(passwordKey, password);
  }

  Future<Map<String, String>?> getCredentials() async {
    var box = await Hive.openBox(boxName);
    final username = box.get(usernameKey);
    final password = box.get(passwordKey);

    if (username != null && password != null) {
      return {
        'username': username,
        'password': password,
      };
    }
    return null;
  }

  Future<void> deleteCredentials() async {
    var box = await Hive.openBox(boxName);
    await box.delete(usernameKey);
    await box.delete(passwordKey);
  }
}
