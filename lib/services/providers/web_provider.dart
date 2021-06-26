import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/services/providers/data_provider.dart';

import '../api.dart';

class WebProvider extends DataProvider {
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
    var data = await Api.get('/poi/$poi');
    var poiData = Map<String, dynamic>.from(data);
    return PointOfInterest.fromJson(poiData);
  }

  Future<User> login(username) async {
    var data = await Api.get('/user/login/$username');
    var poiData = Map<String, dynamic>.from(data);
    return User.fromJson(poiData);
  }

  Future<User> register(user) async {
    var data = await Api.post('/user/register', user);
    if (data['error'] != null) return null;
    return User.fromJson(data);
  }

  void userScanned(User user) async {
    await Api.put('/user/incrementScans/${user.name}', null);
  }
}
