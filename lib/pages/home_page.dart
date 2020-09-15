import 'package:flutter/material.dart';
import 'package:ipad_v1/components/color.dart';
import '../responsive_util.dart';
import '../model/model_data.dart';
import '../model/model.dart';
import 'home_page_widget2.dart';
import 'home_page_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget val;
  Widget widgets;

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (getScreenSize(MediaQuery.of(context).size.width)) {
      case ScreenSize.small:
        widget = homePageSmall();
        if (widgets == null) {
          widgets = homePageSmall();
        }
        return widgets;
        break;
      case ScreenSize.medium:
        if (widgets == null) {
          widgets = homePageMedium();
        }
        return widgets;
        break;
      case ScreenSize.large:
        if (widgets == null) {
          widgets = homePageLarge1();
        }
        return widgets;
        break;
    }
    return widget;
  }

// home page small widget
  Widget homePageSmall() {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: drawerBody(),
      ),
      body: HomePageWidget(),
    );
  }

// home page medium widget
  Widget homePageMedium() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 2, child: drawerBody()),
            Expanded(flex: 5, child: HomePageWidget()),
          ],
        ),
      ),
    );
  }

//home page large widget
  Widget homePageLarge1() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 1, child: drawerBody()),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Expanded(flex: 1, child: HomePageWidget()),
                    //                  Expanded(flex: 2, child: PlaceDetails(place: selectedPlace))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //home page large widget for second btn
  Widget homePageLarge2() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 1, child: drawerBody()),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Expanded(flex: 1, child: HomePageWidget2()),
//                  Expanded(flex: 2, child: PlaceDetails(place: selectedPlace))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//  Widget assignChildren
  Widget assignChildren() {
    return Column(
      children: [
        HomePageWidget2(),
      ],
    );
  }

// drawer widget
  Widget drawerBody() {
    final menuItems = Models().getMenuItems();
    return SafeArea(
      child: Container(
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
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: menuItems.length + 1,
          itemBuilder: (context, index) {
            if (index == 1 || index == 2) {
              return ListTile(
                title: Container(
                  height: 45.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: whiteBtnColor,
                    textColor: blackTxtBtnColor,
                    onPressed: () {
                      if (index == 1) {
                        print('Index 1');
                        setState(() {
                          widgets = homePageLarge1();
                        });
                      } else if (index == 2) {
                        print('Index 2');
                        setState(() {
                          widgets = homePageLarge2();
                        });
                      } else {
                        print('Index last');
                      }
                    },
                    child: Text(menuItems[index - 1]),
                  ),
                ),
                selected: index == 3 ? true : false,
              );
            }
            return ListTile();
          },
        ),
      ),
    );
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }
}
