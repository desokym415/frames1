

import 'package:flutter/cupertino.dart';
import 'package:frames/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaquery){
  var orientation = mediaquery.orientation ;
  double deviceWidth = 0;
  if(orientation == Orientation.landscape){
    deviceWidth = mediaquery.size.height;
  }else{
    deviceWidth = mediaquery.size.width;
  }

  if(deviceWidth > 950){
    return DeviceScreenType.desktop;
  }
  if(deviceWidth > 600){
    return DeviceScreenType.tablet;
  }
  return DeviceScreenType.mobile;
}