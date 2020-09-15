import 'package:flutter/material.dart';

import 'package:ipad_v1/components/color.dart';
import 'package:ipad_v1/components/texts.dart';
import 'package:ipad_v1/provider/provider_model.dart';
import 'package:provider/provider.dart';

import 'intervention_slider.dart';

Widget val;

class HomePageWidget2 extends StatefulWidget {
  const HomePageWidget2({Key key}) : super(key: key);
  @override
  _HomePageWidget2State createState() => _HomePageWidget2State();
}

class _HomePageWidget2State extends State<HomePageWidget2> {
  @override
  Widget build(BuildContext context) {
    var newWidget = Provider.of<ProviderModel>(context, listen: false);
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return ChangeNotifierProvider(
        create: (context) => ProviderModel(),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(flex: 1, child: landscape()),
              // Expanded(
              //     flex: 1,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SizedBox(height: 10.0),
              //         activityTitle(),
              //         SizedBox(height: 20),
              //         Expanded(flex: 1, child: getListView()),
              //       ],
              //     ))
            ],
          ),
        ),
      );
    } else {
      return portrait();
    }
  }

// child widget
  Widget child() {
    var newWidget = Provider.of<ProviderModel>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    // onPressed: () {
                      // newWidget.changeWidget(val = null);
                      // newWidget.passedWidget;
                       onPressed: () => context.read<ProviderModel>().changeWidget(val = null),

                      // setState(() {
                      //   return val = null;
                      // });
                    // }
                    ),
              ],
            ),
            // SizedBox(height: 10.0),
            Text(
              'Child Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Container(
              height: MediaQuery.of(context).size.width * (383 / 2048),
              width: MediaQuery.of(context).size.height * (383 / 2732),
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('assets/pp.jpg'),
              ),
            ),
            SizedBox(height: 20.0),
            Text('Dave Johnson',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            SizedBox(height: 30.0),
            Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(55.0)),
                width: MediaQuery.of(context).size.width * (1500 / 2048),
                height: MediaQuery.of(context).size.height * (1900 / 2732),
                // top: true,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: DefaultTabController(
                      length: 3,
                      child: Builder(builder: (BuildContext context) {
                        return Scaffold(
                          backgroundColor: Colors.white,
                          appBar: AppBar(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            automaticallyImplyLeading: false,
                            backgroundColor: Colors.grey[300],
                            flexibleSpace: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TabBar(
                                tabs: [
                                  Container(
                                    child: Tab(
                                      child: Text(
                                        'Challenges',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Tab(
                                      child: Text('Interventions',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0)),
                                    ),
                                  ),
                                  Container(
                                    child: Tab(
                                      child: Text('Dialy Logs',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0)),
                                    ),
                                  ),
                                ],
                                indicator: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ),
                          ),
                          body: Container(
                            // width:
                            //     MediaQuery.of(context).size.width * (1252 / 2048),
                            // height: MediaQuery.of(context).size.height *
                            //     (1700 / 2732),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: TabBarView(
                                children: [
                                  // _challenges(),
                                  // _interventions(),
                                  // _dailyLogs(),
                                  _buildList(
                                      key: 'key1',
                                      string:
                                          'This is recently created intervention form: '),
                                  // _buildList(key: 'key2', string: 'List 2: '),
                                  // _buildList(key: 'key3', string: 'List 3: '),
                                  _interventions(),
                                  _dailyLogs(),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// build list for tab scroll view
  Widget _buildList({String key, String string}) {
    return ListView.builder(
      key: PageStorageKey(key),
      itemBuilder: (_, i) => ListTile(title: Text('$string $i')),
    );
  }

  // challenges
  Widget _interventions() {
    var newWidget = Provider.of<ProviderModel>(context, listen: false);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Intervention List',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Container(
            width: 300,
            height: 50.0,
            child: RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.grey[300],
               onPressed: () => context.read<ProviderModel>().changeWidget(val = _formBody()),
              // onPressed: () {
              //   newWidget.changeWidget(val = _formBody());
              //   newWidget.passedWidget;
              //   // setState(() {
              //   //   val = _formBody();
              //   // });
              // },
              child: Text(
                'Create New Intervention',
                style: TextStyle(
                    fontSize: 18.0, color: Colors.black, letterSpacing: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

// form widget
  Widget _formBody() {
    var newWidget = Provider.of<ProviderModel>(context, listen: false);
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                         onPressed: () => context.read<ProviderModel>().changeWidget(val = child()),
                        // onPressed: () {
                        //   newWidget.changeWidget(val = child());
                        //   newWidget.passedWidget;
                        //   // setState(() {
                        //   //   val = child();
                        //   // });
                        // },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('Create new intervention',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  SizedBox(height: 30),
                  Text('Create new intervention form',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          letterSpacing: 1.0)),
                  SizedBox(height: 40.0),
                  Container(
                    width: 600,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
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
                    child: Center(
                      child: Text('The action or process of intervention',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ),
                  ),
                  SizedBox(height: 80),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildTextField('Name of the activity', null),
                          SizedBox(height: 30.0),
                          buildTextField('Description', null),
                          SizedBox(height: 40.0),
                          buildTextField('Instructions', null),
                          SizedBox(height: 30.0),
                          buildTextField('Video Urls (if any)', null),
                          SizedBox(height: 40.0),
                          buildTextField('Area of focus', null),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * (438 / 2048),
                      height: MediaQuery.of(context).size.height * (100 / 2732),
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          newWidget.changeWidget(val = interventionForm2());
                          newWidget.passedWidget;
                          // setState(() {
                          //   val = interventionForm2();
                          // });
                        },
                        color: greenBtnColor,
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // challenges
  Widget _dailyLogs() {
    return Container(
      color: Colors.white,
      child: Text('Challenges'),
    );
  }

  //  list view widget
  Widget getListView() {
    var newWidget = Provider.of<ProviderModel>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {
                  newWidget.changeWidget(val = child());
                  newWidget.passedWidget;
                  // newWidget.passedWidget;
                  // setState(() {
                  // val = child();
                  // });
                },
                // onPressed: () => Get.to(ChildScreen())
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 80,
              ),
              title: Text('Henry Cavil'),
              trailing: RaisedButton(
                color: Colors.grey[300],
                child: Text('Assign Form'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

// activity title
  Widget activityTitle() {
    return Container(
      key: UniqueKey(),
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

//  widget container 1
  Widget container1() {
    return Container(
      key: UniqueKey(),
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
      key: UniqueKey(),
      decoration: BoxDecoration(
        color: Color.fromRGBO(97, 128, 175, 1),
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
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: whiteTextColor),
              ),
              Container(
                width: 250.0,
                height: 55.0,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  onPressed: () {},
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
    var newWidget = Provider.of<ProviderModel>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => ProviderModel(),
      child: Container(
        color: Colors.white,
        child: Builder(
          builder: (context) {
            if (val == null) {
              return Container(
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
            } else {
              return newWidget.passedWidget;
            }
          },
        ),
      ),
    );
  }

  //  landscape home
  Widget landscape() {
    var newWidget = Provider.of<ProviderModel>(context, listen: false);
    return Container(
      color: Colors.white,
      child: Builder(
        builder: (context) {
          if (val == null) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
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
          } else {
            return newWidget.passedWidget;
          }
        },
      ),
    );
  }

  // intervention form 2
  Widget interventionForm2() {
    var newWidget = Provider.of<ProviderModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            newWidget.changeWidget(val = _formBody());
            newWidget.passedWidget;
            // setState(() {
            //   val = _formBody();
            // });
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: TabControllerWidget(),
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
    );
  }
}

//  widget for text field creation
Widget buildTextField(String labelText, IconData icon) {
  return Container(
    width: 500.0,
    height: 60.0,
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
