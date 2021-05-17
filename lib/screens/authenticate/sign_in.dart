import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frames/services/auth.dart';
import 'package:frames/shared/loading.dart';
import 'package:frames/ui/base_widget.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return loading ? Loading() : Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 70,),
                Container(
                  //alignment: Alignment.centerLeft,
                  height: 120,
                  width: 200,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        //margin: EdgeInsets.only(left: 50.0),
                        height: 120,
                        width: 120,
                        child: Image(
                          image: AssetImage('assets/iconfinder_letter_F_red_1553032.png'),
                        ),
                      ),
                          Positioned(
                            top: 60.0,
                            left: 60.0,
                            child: Text("rames", style: TextStyle(fontSize: 50.0,
                              color: Colors.grey[800]),),
                          ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("Watch and Enjoy",style: TextStyle(fontSize: 30.0, fontFamily:'newfont',),),
                SizedBox(height: 50,),
                Center(
                  child: Container(
                    height: 60.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? "Enter an email" : null,
                        onChanged: (val){
                          setState(() {
                            email = val ;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              10.0, 0.0, 0.0, 0.0),
                          hintText: 'User Name',
                          hintStyle: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 350.0,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Center(
                    child: TextFormField(
                      validator: (val){
                        bool _contain = false ;
                        if(val.isEmpty){
                          return "Enter a Password";
                        }
                        else if (val.length < 6 || val.length > 20 ){
                          return "Password must be between 6 and 10 characters";
                        }
                        else if(val.contains(RegExp(r'[A-Z]')) || val.contains(RegExp(r'[a-z]'))){
                          _contain = true;
                        }
                        if(_contain == false){
                          return "Password must have characters";
                        }
                        return null;
                      },
                      obscureText: true,
                      onChanged: (val){
                        setState(() {
                          password = val;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350.0,
                  height: 58.0,
                  child: RaisedButton(
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        setState(() {
                          loading = true ;
                        });
                        dynamic result = await _auth.signInWithEmailandPassword(email, password) ;
                        if(result == null){
                          setState(() {
                            error = "problem in email or password";
                            loading = false;
                          });
                        }
                      }
                    },
                    color: Color.fromRGBO(244, 47, 66, 1),
                    child: Text("Sign In", style: TextStyle(letterSpacing: 3.0, fontSize: 40.0,fontFamily: 'newfont1'),),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                      widget.toggleView();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, left: 185.0),
                    child: Text(
                      "create new account !",
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
