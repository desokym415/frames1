import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      child: Center(
        child: SpinKitChasingDots(
          color: Color.fromRGBO(277, 47, 66, 1),
          size: 50,
        ),
      ),
    );
  }
}
