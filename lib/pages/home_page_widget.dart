import 'package:flutter/material.dart';
import 'package:ipad_v1/components/color.dart';
import 'package:ipad_v1/components/texts.dart';

import 'login.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 900.0) {
          return Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(flex: 1, child: landscape()),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0),
                        activityTitle(),
                        SizedBox(height: 20),
                        Expanded(flex: 1, child: getListView()),
                      ],
                    ))
              ],
            ),
          );
        } else {
          return portrait();
        }
      },
    );
  }

//  list view widget
  Widget getListView() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                print('1st Activity');
              },
              child: ListTile(
                leading: Icon(
                  Icons.format_list_numbered,
                  color: Colors.blueAccent,
                ),
                title: Text(
                    'This is recently created intervention form is created'),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_numbered,
                color: Colors.blueAccent,
              ),
              title: Text('This is recently created intervention form'),
            ),
          ],
        ),
      ),
    );
  }

// activity title
  Widget activityTitle() {
    return Container(
      color: Colors.white,
      child: Text(
        'Recently Created',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32.0,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  // home title
  Widget homeTitle() {
    return Text(
      'Home',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 34.0,
      ),
//      textAlign: TextAlign.left,
    );
  }

//  widget container 1
  Widget container1() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Container 1',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          )),
        ],
      ),
    );
  }

  //  widget container 2
  Widget container2() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Create manage and review your interventions',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Container(
                width: 250.0,
                height: 55.0,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  onPressed: () {
                    print('home first btn pressed!');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  color: whiteBtnColor,
                  child: Text(
                    Strings.btnText,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

//  portrait home
  Widget portrait() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              homeTitle(),
              SizedBox(height: 20.0),
              Expanded(flex: 1, child: container1()),
              SizedBox(height: 30.0),
              Expanded(flex: 2, child: container2()),
              SizedBox(height: 25.0),
              activityTitle(),
              SizedBox(height: 20.0),
              Expanded(flex: 2, child: getListView()),
            ],
          ),
        ),
      ),
    );
  }

  //  portrait home
  Widget landscape() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeTitle(),
            SizedBox(height: 10.0),
            Expanded(flex: 2, child: container1()),
            SizedBox(height: 20.0),
            Expanded(flex: 4, child: container2()),
          ],
        ),
      ),
    );
  }

////  landscape grid view
  Widget _gridLandscape() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        activityTitle(),
        SizedBox(height: 30.0),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: getListView(),
            )),
      ],
    );
  }

//  Widget assignChildren
  Widget assignChildren() {
    return Container(
      color: Colors.greenAccent,
      child: Text('Assigned children Page'),
    );
  }
}
