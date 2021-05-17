import 'package:flutter/material.dart';
import 'package:frames/screens/authenticate/authenticate.dart';
import 'package:frames/screens/home/hiddenDrawer.dart';
import 'package:provider/provider.dart';
import 'package:frames/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user != null){
      return HiddenDrawer();
    }
    else{
      return Authenticate();
    }
  }
}
