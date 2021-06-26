import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/data/user.dart';

abstract class DataProvider {
  String getString(url);
  Future<PointOfInterest> getPOI(poi);
  Future<User> login(username);
  Future<User> register(Map<String, dynamic> user);
  void userScanned(User user);
}
