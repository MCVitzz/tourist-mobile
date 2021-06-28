import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/layout/button.dart';
import 'package:tourist/session.dart';
import 'package:tourist/utils.dart';

import '../theme.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();

  final User user = Session.currentUser;
}

class _ProfileViewState extends State<ProfileView> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/profile/user.png'),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              widget.user.name,
              style: TouristTheme.titleStyle,
            ),
            Text('${Utils.doubleToString(widget.user.scans)} Scans',
                style: TouristTheme.titleStyleColored)
          ]),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Button(
              text: 'Logout',
              onPressed: () => Session.logout(),
              color: Colors.black,
              background: TouristTheme.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
