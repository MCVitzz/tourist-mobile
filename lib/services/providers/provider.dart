import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/services/providers/web_provider.dart';

import 'data_provider.dart';

class Provider {
  static DataProvider provider = WebProvider();

  static String getQR(url) {
    return provider.getString(url);
  }

  static Future<PointOfInterest> getPOI(poi) {
    return provider.getPOI(poi);
  }
}
