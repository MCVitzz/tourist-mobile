import 'package:flutter/material.dart';
import 'package:tourist/data/comment.dart';
import 'package:tourist/data/point_of_interest.dart';
import 'package:tourist/layout/comment_card.dart';
import 'package:tourist/layout/text_with_button.dart';
import 'package:tourist/services/providers/provider.dart';
import 'package:tourist/theme.dart';

class CommentsPage extends StatefulWidget {
  final PointOfInterest poi;

  CommentsPage({this.poi});

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  TextEditingController _txtComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.none &&
                snap.hasData == null) return Container();
            if (snap.data == null || snap.data.length == 0)
              return _noComments();
            return Column(
              children: _createCards(snap.data),
            );
          },
          future: Provider.getComments(widget.poi),
        ));
  }

  void _sendComment() async {
    Map<String, dynamic> comment = {
      'comment': _txtComment.text,
      'poi': widget.poi.id
    };

    _txtComment.text = '';

    await Provider.addComment(comment);

    setState(() {});
  }

  List<Widget> _createCards(List<Comment> comments) {
    List<Widget> cards = [];
    for (Comment comment in comments) {
      cards.add(CommentCard(
        comment: comment,
        refresh: () {
          setState(() {});
        },
      ));
    }
    cards.add(TextWithButton(
        controller: _txtComment,
        placeholder: 'Type comment...',
        onClick: _sendComment));
    return cards;
  }

  Widget _noComments() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'No Comments',
          style: TextStyle(color: TouristTheme.white),
        ),
        TextWithButton(
            controller: _txtComment,
            placeholder: 'Be the first!',
            onClick: _sendComment),
      ],
    ));
  }
}
