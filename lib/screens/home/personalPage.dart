import 'package:flutter/material.dart';
import 'package:frames/models/channel.dart';
import 'package:frames/services/database.dart';
import 'package:provider/provider.dart';
import 'package:frames/screens/home/PersonalPageBody.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    //final channels = Provider.of<List<Channel>>(context) ?? [];
    //print(channels.documents);
    return StreamProvider<List<Channel>>.value(
      value: DatabaseService().channels,
      child: Scaffold(
        body: PersonalPageBody(),
      ),
    );
  }
}
