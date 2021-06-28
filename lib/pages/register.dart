import 'package:flutter/material.dart';
import 'package:tourist/data/user.dart';
import 'package:tourist/layout/button.dart';
import 'package:tourist/layout/datepicker.dart';
import 'package:tourist/layout/text_box.dart';
import 'package:tourist/services/providers/provider.dart';
import 'package:tourist/theme.dart';
import 'package:tourist/utils.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _txtUsername = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtBirthDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: TouristTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(44),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  Container(
                    height: 25,
                  ),
                  TextBox(
                    controller: _txtUsername,
                    placeholder: 'Username',
                  ),
                  TextBox(
                    controller: _txtEmail,
                    placeholder: 'Email',
                  ),
                  DatePicker(
                      controller: _txtBirthDate, placeholder: 'Birthdate'),
                  Container(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Button(
                      text: 'Register',
                      background: TouristTheme.yellow,
                      color: Colors.black,
                      onPressed: _register,
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

  void _register() async {
    User newUser = await Provider.register({
      'name': _txtUsername.text,
      'email': _txtEmail.text,
      'birthdate': _txtBirthDate.text
    });
    if (newUser != null) {
      Utils.toast(context, 'User registred successfully.');
      Utils.popScreen(context);
    } else {
      Utils.toast(context, 'User already exists.');
    }
  }
}
