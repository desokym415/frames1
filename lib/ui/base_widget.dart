import 'package:flutter/material.dart';
import 'package:frames/ui/sizing_information.dart';
import 'package:frames/utils/ui_utils.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({Key key, this.builder}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxConstrains)
    {
      var sizingInformation = SizingInformation(
        orientation: mediaquery.orientation,
        deviceScreenType: getDeviceType(mediaquery),
        screenSize: mediaquery.size,
        localWidgetSize: Size(boxConstrains.maxWidth, boxConstrains.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
