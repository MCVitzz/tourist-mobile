import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/services/providers/data_provider.dart';
import 'package:tourist/session.dart';

class StaticProvider extends DataProvider {
  String getString(url) {
    if (url == 'Testes') {
      return 'blue';
    } else if (url == 'Economia') {
      return 'red';
    } else {
      return 'amber';
    }
  }

  Future<PointOfInterest> getPOI(poi) async {
    return PointOfInterest.carnaxide;
  }

  Future<User> login(username) async {
    return username == 'vp' ? User.vasco : null;
  }

  Future<User> register(Map<String, dynamic> user) async {
    return User.bia;
  }

  void userScanned(User user) {
    user.scans++;
  }
}
