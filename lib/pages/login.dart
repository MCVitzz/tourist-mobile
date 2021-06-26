import 'package:flutter/material.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/layout/button.dart';
import 'package:tourist/layout/text_box.dart';
import 'package:tourist/pages/register.dart';
import 'package:tourist/services/providers/provider.dart';
import 'package:tourist/session.dart';
import 'package:tourist/theme.dart';
import 'package:tourist/utils.dart';

class Login extends StatefulWidget {
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _txtUser = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TouristTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(44),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              Column(
                children: [
                  TextBox(
                    controller: _txtUser,
                    placeholder: 'Username',
                  ),
                  Container(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Button(
                      text: 'Login',
                      background: TouristTheme.yellow,
                      color: Colors.black,
                      onPressed: () => _login(_txtUser.text),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Button(
                      text: 'Register',
                      background: TouristTheme.yellow,
                      color: Colors.black,
                      onPressed: () => _register(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(username) async {
    User user = await Provider.login(username);
    if (user != null) {
      Session.login(user);
    } else {
      Utils.toast(context, 'Invalid Username.');
    }
  }

  void _register() {
    Utils.pushScreen(context, Register());
  }
}
