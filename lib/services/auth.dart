import 'package:firebase_auth/firebase_auth.dart';
import 'package:frames/models/user.dart';
import 'package:frames/services/database.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user based on firebase user
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }
  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser((user)));
  }
  //sign in anonymous
  Future signInAnonymous() async{
    try{
      AuthResult result = await  _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }


  }
  //register with email and password
  Future registerWithEmailandPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create new document for the channel
      await DatabaseService(uid: user.uid).updateChannelData("ChannelName","ChannelDescription");
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password
  Future signInWithEmailandPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}
}