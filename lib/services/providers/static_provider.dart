import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/services/providers/data_provider.dart';

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
}
