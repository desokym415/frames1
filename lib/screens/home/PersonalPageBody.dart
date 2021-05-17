import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frames/models/user.dart';
import 'package:frames/screens/home/ImagePosition.dart';
import 'package:frames/services/database.dart';
import 'package:frames/shared/loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class PersonalPageBody extends StatefulWidget {
  @override
  _PersonalPageBodyState createState() => _PersonalPageBodyState();
}
class _PersonalPageBodyState extends State<PersonalPageBody> {
  File _image;
  void _showToast(){
    Fluttertoast.showToast(msg: "Data has been updated",
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIos: 10,
        gravity: ToastGravity.CENTER);
  }
  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print("image path $_image");
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserChannel>(
      stream: DatabaseService(uid: user.uid).channelData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserChannel channelData = snapshot.data;
          String _name = channelData.channelName;
          String _desciption = channelData.channelDescription;
          String _userId = user.uid;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10.0,),
                    Stack(
                      children: <Widget>[
                        ImagePosition(_image),
                          Positioned(
                            top: 80,
                            left: 80,
                            child: IconButton(
                              onPressed: () {
                                getImage();
                              },
                              icon: Icon(
                                Icons.add_a_photo,
                                size: 30.0,
                                //color: Colors.grey[800],
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.mode_edit,
                      color: Color.fromRGBO(244, 47, 66, 1),
                      size: 25.0,
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(244, 47, 66, 1),
                          ),
                        ),
                      ),
                      width: 180,
                      height: 20,
                      child: TextFormField(
                        onChanged: (val){
                          _name = val;
                        },
                        initialValue: '$_name',
                        //initialValue: "mohamed",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(17),
                        ],
                        style: TextStyle(fontSize: 17,fontFamily: "newfont1",color: Colors.black),
                        cursorColor: Color.fromRGBO(244, 47, 66, 1),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10.0,),
                    Text("Description :", style: TextStyle(fontFamily: "newfont", fontSize: 20),),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 340,
                  height: 160,
                  margin: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]),
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 160,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      reverse: true,
                      child: SizedBox(
                        height: 150,
                        child: TextFormField(
                          initialValue: "$_desciption",
                          onChanged: (val){
                            _desciption = val;
                          },
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //hintText: "a7a",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  width: 350.0,
                  height: 58.0,
                  child: RaisedButton(
                    onPressed: () async {
                      try{
                        String fileName = basename(_image.path);
                        //StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
                        //StorageUploadTask uploadTask = firebaseStorageRef.child('images/').putFile(_image);
                        //StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
                        await DatabaseService(uid: user.uid).updateChannelData(
                          _name ?? channelData.channelName
                          , _desciption ?? channelData.channelDescription);
                          _showToast();}
                      catch(e){
                        print(e.toString());
                        print("a7aa");
                      }
                      },
                    color: Color.fromRGBO(244, 47, 66, 1),
                    child: Text("Save", style: TextStyle(letterSpacing: 3.0, fontSize: 40.0,fontFamily: 'newfont1'),),
                  ),
                ),
              ],
            ),
          );
        }
        else{
          return Loading();
        }
      }
    );
  }
}

