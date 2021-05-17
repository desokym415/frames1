import 'package:flutter/material.dart';
import 'package:frames/enums/device_screen_type.dart';

class SizingInformation{
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final screenSize;
  final Size localWidgetSize;

  SizingInformation(
     {this.orientation,
      this.deviceScreenType,
      this.screenSize,
      this.localWidgetSize});

  @override
  String toString(){
    return 'orientation:$orientation deviceScreenType:$deviceScreenType screenSize:$screenSize localWidgetSize:$localWidgetSize';

}

}