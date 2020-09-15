import 'package:flutter/material.dart';
import 'package:ipad_v1/components/color.dart';
import 'package:ipad_v1/components/size_config.dart';
import 'package:ipad_v1/components/styling.dart';
import 'package:ipad_v1/components/texts.dart';
import 'package:ipad_v1/components/typography.dart';
import 'package:ipad_v1/pages/forgot_password.dart';

import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginLayout(),
    );
  }

//  login form
  Widget _loginForm() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height / 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              SizedBox(height: 20.0),
              logo(),
              SizedBox(height: 60.0),
              Text(
                Strings.loginTitle,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80.0),
              buildTextField('Email Address', Icons.person),
              SizedBox(height: 30.0),
              buildTextField('Password', Icons.vpn_key),
              SizedBox(height: 40.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Text(Strings.forgotPassword,
                    style: TextStyle(
                        color: forgotPasswordTextColor, fontSize: 18.0)),
              ),
              SizedBox(height: 60.0),
              Container(
                width: MediaQuery.of(context).size.width * (462 / 2048),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 55.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  color: greenBtnColor,
                  child: Text(
                    Strings.login,
                    style: buttonTextStyle,
                  ),
                ),
              ),
              SizedBox(height: 150.0),
              Text(
                Strings.terms,
                style: TextStyle(color: termsColor, fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }

//  logo image widget
  Widget logo() {
    return Container(
      width: MediaQuery.of(context).size.width * (200 / 2048),
      height: MediaQuery.of(context).size.height * (200 / 2732),
      child: Image.asset('assets/logo.png'),
    );
  }

//  side bof for landscape mode
  Widget _sideBoxDisplay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(94, 91, 184, 1),
              Color.fromRGBO(104, 199, 160, 1)
            ],
            begin: const FractionalOffset(0.5, 0.0),
            end: const FractionalOffset(0.0, 0.8),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * (700 / 2732),
              height:  MediaQuery.of(context).size.height * (500 / 2048),
              child: Image.asset('assets/child.png')),
          Text(
            Strings.slogan,
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1),
          ),
        ],
      ),
    );
  }

//  widget for text field creation
  Widget buildTextField(String labelText, IconData icon) {
    return Container(
      width: MediaQuery.of(context).size.width * (902 / 2048),
      height: MediaQuery.of(context).size.height * (140 / 2732),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          style: TextStyle(color: blackTextColor, fontSize: 18.0),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              labelText: labelText,
              labelStyle: TextStyle(color: blackTextColor),
              icon: Icon(icon, color: Colors.black, size: 20.0)),
        ),
      ),
    );
  }

//  main widget for the layout of the login screen according to the orientation
  Widget _loginLayout() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loginForm(),
        ],
      );
    } else {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
//                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: _sideBoxDisplay())),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: _loginForm(),
//            child: _loginFormLandscape(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
