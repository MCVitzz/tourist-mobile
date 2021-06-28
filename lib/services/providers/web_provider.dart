import 'package:tourist/data/comment.dart';
import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/services/providers/data_provider.dart';
import 'package:tourist/session.dart';

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

  Future<List<Comment>> getComments(PointOfInterest poi) async {
    var data = await Api.get('/comment/getByPoi/${poi.id}');
    List<Comment> comments = [];
    for (var item in data) {
      comments.add(Comment.fromJson(item));
    }
    return comments;
  }

  Future<Comment> addComment(Map<String, dynamic> comment) async {
    Map<String, dynamic> toAdd = {
      'poi': comment['poi'],
      'comment': comment['comment'],
      'author': Session.currentUser.id
    };
    var data = await Api.post('/comment', toAdd);
    if (data['error'] != null) return null;
    return Comment.fromJson(data);
  }

  Future<bool> hasLike(Comment comment) async {
    var data = await Api.get(
        '/comment/hasLike/${Session.currentUser.id}/${comment.id}');
    return data;
  }

  Future<User> getUser(int id) async {
    var data = await Api.get('/user/$id');
    var poiData = Map<String, dynamic>.from(data);
    return User.fromJson(poiData);
  }

  void like(int commentId) async {
    await Api.put('/comment/like/$commentId/${Session.currentUser.id}', null);
  }

  void dislike(int commentId) async {
    await Api.put(
        '/comment/dislike/$commentId/${Session.currentUser.id}', null);
  }
}
