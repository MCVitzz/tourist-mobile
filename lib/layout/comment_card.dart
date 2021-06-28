import 'package:flutter/material.dart';
import 'package:tourist/data/comment.dart';
import 'package:tourist/layout/button.dart';
import 'package:tourist/services/providers/provider.dart';
import 'package:tourist/theme.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;

  final Function refresh;

  CommentCard({this.comment, this.refresh});

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.data == null) return Container();
                  return Text(
                    snapshot.data.name,
                    style: TextStyle(
                        color: TouristTheme.yellow,
                        fontWeight: FontWeight.bold),
                  );
                },
                future: Provider.getUser(widget.comment.author),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .03,
              ),
              Text(
                widget.comment.comment,
                style: TextStyle(color: TouristTheme.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  return _likeButton(snapshot.data, widget.comment.id);
                },
                future: Provider.hasLike(widget.comment),
              ),
              Text(
                widget.comment.likes.toString(),
                style: TextStyle(color: TouristTheme.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _likeButton(bool hasLike, int id) {
    if (hasLike == null || !hasLike) {
      return Button(
        icon: Icons.favorite_border,
        size: 20,
        color: TouristTheme.white,
        onPressed: () => _like(id),
      );
    } else {
      return Button(
        icon: Icons.favorite,
        size: 20,
        color: TouristTheme.red,
        onPressed: () => _dislike(id),
      );
    }
  }

  void _like(int id) async {
    await Provider.like(id);
    await widget.refresh();
    setState(() {});
  }

  void _dislike(int id) async {
    await Provider.dislike(id);
    await widget.refresh();
    setState(() {});
  }
}
