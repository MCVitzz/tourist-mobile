class Comment {
  int id;
  int poi;
  String comment;
  int likes;
  int author;

  Comment({this.id, this.poi, this.comment, this.likes, this.author});

  factory Comment.fromJson(Map<String, dynamic> data) {
    return Comment(
        id: data['id'],
        poi: data['poi'],
        comment: data['comment'],
        likes: data['likes'],
        author: data['author']);
  }
}
