import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ipad_v1/components/color.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TabControllerWidget extends StatefulWidget {
  TabControllerWidget({Key key}) : super(key: key);

  @override
  _TabControllerWidgetState createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget> {
  int _selectedIndex = 0;
  double count = 1.0;
  int val = 1;
  int value = 1;
  int curIndex = 0;
  Widget sliderBar() {
    return Container(
        child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
                startAngle: 90.0,
                angleRange: 360.0,
                customWidths: CustomSliderWidths(progressBarWidth: 5)),
            min: 1,
            max: 5,
            initialValue: count,
            innerWidget: (percentage) => Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$val',
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold)),
                      Text(
                        ' of 5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    ],
                  ),
                )));
  }

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //  widget for text field creation
  Widget buildTextField(String labelText, IconData icon) {
    return Container(
      // width: MediaQuery.of(context).size.width * (1252 / 2048),
      // height: MediaQuery.of(context).size.height * (1700 / 2732),
      height: 70.0,
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

  // activity tab view
  Widget activityTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            alignment: Alignment.center,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTextField('Name of the activity', null),
                  SizedBox(height: 30.0),
                  buildTextField('Description', null),
                  SizedBox(height: 30.0),
                  buildTextField('Instructions', null),
                  SizedBox(height: 30.0),
                  buildTextField('Video Urls (if any)', null),
                  SizedBox(height: 30.0),
                  buildTextField('Area of focus', null),
                  SizedBox(height: 80.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120.0, vertical: 50.0),
                    child: nextBtn(2.0, 2, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // items tab view
  Widget itemsTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            midButton('Upload new photo'),
            SizedBox(
                height: MediaQuery.of(context).size.height * (1315 / 2732)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                previousBtn(1, 2.0, 2),
                SizedBox(width: 140.0),
                nextBtn(3.0, 3, 2),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // measures tab
  Widget measuresTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            buildTextField('Name of the activity', null),
            SizedBox(height: 30.0),
            buildTextField('Description', null),
          ],
        ),
        midButton('New measure'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            previousBtn(2, 3.0, 3),
            SizedBox(width: 140.0),
            nextBtn(4.0, 4, 3)
          ],
        ),
      ],
    );
  }

  // goals tab
  Widget goalsTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            previousBtn(3, 4.0, 4),
            SizedBox(width: 140.0),
            nextBtn(5.0, 5, 4)
          ],
        ),
      ],
    );
  }

  // preview tab
  Widget previewTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            previousBtn(4, 5.0, 5),
            SizedBox(width: 140.0),
          ],
        ),
      ],
    );
  }

  // tabs middle large buttons
  Widget midButton(String title) {
    return Container(
      // alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * (438 / 2048),
      height: MediaQuery.of(context).size.height * (100 / 2732),
      child: RaisedButton(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: () {},
        color: greenBtnColor,
        child: Text(
          '$title',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
    );
  }

  // next button
  Widget nextBtn(double counts, int value, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * (438 / 2048),
      height: MediaQuery.of(context).size.height * (100 / 2732),
      child: RaisedButton(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: () {
          onNextBtn(index);
          setState(() {
            count = counts;
            val = value;
          });
        },
        color: greenBtnColor,
        child: Text(
          'Next',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  void onNextBtn(int indexs) {
    _pageController.animateToPage(indexs,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  // previous button
  Widget previousBtn(int prevIndex, double counts, int value) {
    return Container(
      width: MediaQuery.of(context).size.width * (438 / 2048),
      height: MediaQuery.of(context).size.height * (100 / 2732),
      child: RaisedButton(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: () {
          onNextBtn(prevIndex - 1);
          setState(() {
            count = counts - 1.0;
            val = value - 1;
          });
        },
        color: Colors.grey[200],
        child: Text(
          'Previous',
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(
            'Create new intervention',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 30.0),
          Text(
            'Create new intervention form',
            style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
          Expanded(
            flex: 10,
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(100),
                    //     border: Border.all(width: 3, color: Colors.black)),
                    child: sliderBar(),
                  ),
                ),
                FlatButton(
                  // splashColor: Colors.blueAccent,
                  color: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      count = 1;
                      val = 1;
                    });
                    _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Activity",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                FlatButton(
                  // splashColor: Colors.blueAccent,
                  color: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      count = 2.0;
                      curIndex = 1;
                      val = 2;
                    });

                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Items",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                FlatButton(
                  // splashColor: Colors.blueAccent,
                  color: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      count = 3.0;
                      val = 3;
                    });
                    _pageController.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Measures",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                FlatButton(
                  // splashColor: Colors.blueAccent,
                  color: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      count = 4.0;
                      val = 4;
                    });
                    _pageController.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Goals",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                FlatButton(
                  // splashColor: Colors.blueAccent,
                  color: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      count = 5.0;
                      val = 5;
                    });
                    _pageController.animateToPage(4,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Preview",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 40,
            // child: PageView.builder(
            //   itemBuilder: (context, curIndex) {
            //     int crt = curIndex;
            //     if (crt == 0) {
            //       print(crt);
            //       return activityTab();
            //     } else if (crt == 1) {
            //       print(crt);
            //       return itemsTab();
            //     } else if (crt == 2) {
            //       print(crt);
            //       return itemsTab();
            //     } else if (crt == 3) {
            //       print(crt);
            //       return itemsTab();
            //     } else if (crt == 4) {
            //       print(crt);
            //       return itemsTab();
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                activityTab(),
                itemsTab(),
                measuresTab(),
                goalsTab(),
                previewTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
