import 'package:flutter/material.dart';
import 'package:frames/screens/authenticate/sign_in.dart';
import 'package:frames/screens/home/Settings.dart';
import 'package:frames/screens/home/help.dart';
import 'package:frames/screens/home/home.dart';
import 'package:frames/screens/home/personalPage.dart';
import 'package:frames/services/auth.dart';
//import 'package:hidden_drawer_menu/hidden_drawer_menu.dart' ;
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> items = new List();
  bool _viewAppBar = false ;
  AuthService _auth = AuthService();
  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Home",
          baseStyle: TextStyle( color: Colors.white,
              fontSize: 28.0, fontFamily: "newfont" ),
          colorLineSelected: Color.fromRGBO(244, 47, 66, 1),
        ),
        Home()));
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Profile",
          baseStyle: TextStyle( color: Colors.white, fontSize: 28.0, fontFamily: "newfont" ),
          colorLineSelected: Color.fromRGBO(244, 47, 66, 1),
        ),
        PersonalPage()));
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Help",
          baseStyle: TextStyle( color: Colors.white, fontSize: 28.0, fontFamily: "newfont" ),
          colorLineSelected: Color.fromRGBO(244, 47, 66, 1),
        ),
        Help()));
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Settings",
          baseStyle: TextStyle( color: Colors.white, fontSize: 28.0, fontFamily: "newfont" ),
          colorLineSelected: Color.fromRGBO(244, 47, 66, 1),
        ),
        Settings()));
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          onTap: () async {
            await _auth.signOut();
            setState(() {
              _viewAppBar = true ;
            });
          },
          name: "Log Out",
          baseStyle: TextStyle( color: Colors.white, fontSize: 28.0, fontFamily: "newfont" ),
          colorLineSelected: Color.fromRGBO(244, 47, 66, 1),
        ),
        SignIn()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        backgroundColorMenu: Colors.grey[800],
        backgroundColorAppBar: Colors.grey[700],
        screens: items,
        typeOpen: TypeOpen.FROM_RIGHT,
        disableAppBarDefault: _viewAppBar,
        //enableScaleAnimin: true,
        //enableCornerAnimin: true,
        slidePercent: 70.0,
        //verticalScalePercent: 80.0,
        //contentCornerRadius: 10.0,
        // ignore: dead_code
        isTitleCentered: true,
        //iconMenuAppBar: Icon(Icons.menu),
        //backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //whithAutoTittleName: true,
        //styleAutoTittleName: TextStyle(color: Colors.red),
        // actionsAppBar: <Widget>[
        //backgroundColorContent: Colors.blue,
        //elevationAppBar: 10,
        //tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        //enableShadowItensMenu: true,
        //backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      );
  }
}
