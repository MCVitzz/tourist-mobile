import 'package:tourist/data/comment.dart';
import 'package:tourist/data/commentLike.dart';
import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/services/providers/data_provider.dart';
import 'package:tourist/session.dart';

class StaticProvider extends DataProvider {
  List<Comment> comments = [];
  List<CommentLike> likes = [];

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

  Future<List<Comment>> getComments(PointOfInterest poi) async {
    return comments;
  }

  Future<Comment> addComment(Map<String, dynamic> comment) async {
    int newId = 1;
    if (comments != null && comments.isNotEmpty) {
      newId = comments.fold<int>(0, (max, e) => e.id > max ? e.id : max);
    }

    Comment toAdd = Comment(
        id: newId,
        author: Session.currentUser.id,
        comment: comment['comment'],
        likes: 0,
        poi: comment['poi']);

    comments.add(toAdd);
    return toAdd;
  }

  Future<bool> hasLike(Comment comment) async {
    for (CommentLike like in likes) {
      if (like.comment == comment.id && like.user == Session.currentUser.id)
        return true;
    }
    return false;
  }

  Future<User> getUser(int id) async {
    return User.vasco;
  }

  void like(int commentId) async {
    int newId = 1;
    if (likes != null && likes.isNotEmpty) {
      newId = likes.fold<int>(0, (max, e) => e.id > max ? e.id : max);
    }
    likes.add(CommentLike(
        id: newId, comment: commentId, user: Session.currentUser.id));
  }

  void dislike(commentId) async {
    CommentLike toRemove;
    for (CommentLike like in likes) {
      if (like.comment == commentId && like.user == Session.currentUser.id)
        toRemove = like;
    }
    if (toRemove != null) likes.remove(toRemove);
  }
}
