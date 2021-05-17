import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frames/models/channel.dart';
import 'package:frames/models/user.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  CollectionReference chanelCollection = Firestore.instance.collection("channel");
  Future updateChannelData(String channelName, String channelDescription) async{
    return await chanelCollection.document(uid).setData({
      'channelName' : channelName,
      'channelDescription' : channelDescription
    });
  }
  //channel data from snapshot
  UserChannel _userChannelFromSnapshot(DocumentSnapshot snapshot){
    return UserChannel(
      uid: uid,
      channelName: snapshot.data['channelName'],
      channelImageName : snapshot.data['channelImageName'],
      channelDescription: snapshot.data['channelDescription'],
    );
  }
  //channel list from snapshot
  List<Channel> _channelListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Channel(
        channelName: doc.data['channelName'] ?? '',
        channelImage: doc.data['channelImage'] ?? null,
        channelDescription: doc.data['channelDescription'] ?? '',
      );
    }).toList();
  }
  //get channel stream
  Stream<List<Channel>> get channels{
    return chanelCollection.snapshots().map(_channelListFromSnapshot);
  }
  Stream<UserChannel> get channelData{
    return chanelCollection.document(uid).snapshots()
    .map(_userChannelFromSnapshot);
  }
}