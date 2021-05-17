import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:frames/models/user.dart';
import 'package:frames/screens/wrapper.dart';
import 'package:frames/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(/*DevicePreview(child:*/MyApp());//);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        home: Wrapper(),
      ),
    );
  }
}
