import 'dart:io';
import 'package:flutter/material.dart';
//ignore: must_be_immutable
class ImagePosition extends StatelessWidget {
  File _image;
  ImagePosition(this._image);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60.0,
      backgroundColor: Colors.grey[600],
      child: ClipOval(
        child: SizedBox(
          height: 180,
          width: 180,
          child: (_image!=null)? Image.file(
            _image,
            fit: BoxFit.fill,
          ):Image(
            image: AssetImage("assets/iconfinder_letter_F_red_1553032.png"),
          )
        ),
      ),
    );
  }
}
