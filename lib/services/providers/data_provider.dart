import 'package:tourist/data/comment.dart';
import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/data/user.dart';

abstract class DataProvider {
  String getString(url);
  Future<PointOfInterest> getPOI(poi);
  Future<User> login(username);
  Future<User> register(Map<String, dynamic> user);
  void userScanned(User user);
  Future<List<Comment>> getComments(PointOfInterest poi);
  Future<Comment> addComment(Map<String, dynamic> comment);
  Future<bool> hasLike(Comment comment);
  Future<User> getUser(int id);
  void like(int commentId);
  void dislike(int commentId);
}
