import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/services/providers/web_provider.dart';

import 'data_provider.dart';

class Provider {
  static DataProvider _provider = WebProvider();

  static String getQR(url) {
    return _provider.getString(url);
  }

  static Future<PointOfInterest> getPOI(poi) async {
    return await _provider.getPOI(poi);
  }

  static Future<User> login(username) async {
    return await _provider.login(username);
  }

  static Future<User> register(user) async {
    return await _provider.register(user);
  }

  static void userScanned(User user) async {
    _provider.userScanned(user);
  }
}
