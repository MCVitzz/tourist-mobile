import 'package:tourist/data/point_of_interest.dart';
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
    var data = await Api.get('/pois/$poi');
    print(data);
    if (data['success'] == true) {
      var poiData = Map<String, dynamic>.from(data['data']);
      return PointOfInterest.fromJson(poiData);
    } else {
      return null;
    }
  }
}
