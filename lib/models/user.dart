
class User{
  final uid;
  User({ this.uid });
}

class UserChannel{
  final String uid;
  final String channelName;
  String channelImageName;
  String channelDescription;
  UserChannel({this.uid, this.channelName, this.channelImageName, this.channelDescription});
}