import 'package:tourist/data/point_of_interest.dart';

abstract class DataProvider {
  String getString(url);
  Future<PointOfInterest> getPOI(poi);
}
