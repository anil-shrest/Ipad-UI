import 'package:flutter/material.dart';
import 'package:ipad_v1/components/color.dart';
import 'package:ipad_v1/components/texts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Center(
        child: Container(
          width: 1276 / 2,
          height: 968 / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.grey[400],
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: _contents(),
              )
            ],
          ),
        ),
      ),
    );
  }

  //  text textField and button
  Widget _contents() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Text(
            Strings.forgotPasswordTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
          ),
          SizedBox(height: 10.0),
          Text(
            Strings.forgotPasswordSubTitle,
//            style: TextStyle(),
          ),
          SizedBox(height: 40.0),
          TextFormField(
            decoration: InputDecoration(
              labelStyle: TextStyle(color: blackTextColor),
              labelText: Strings.emailPlaceholder,
            ),
          ),
          SizedBox(height: 60.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * (462 / 2048),
              height: MediaQuery.of(context).size.height * (104 / 2732),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0)),
                child: Text('Send link'),
                onPressed: () {},
                color: greenBtnColor,
                textColor: whiteTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
