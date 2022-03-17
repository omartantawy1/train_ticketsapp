import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../ticket_booking_home_page.dart';
import 'forgot_passwordpage.dart';
import 'header_design.dart';
import 'registration_page.dart';
import 'theme_helper.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  double _headerHeight = 250;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
var email,password;
  signIn() async {
    var formdata = formstate.currentState;
if(formdata!.validate()){
  formdata.save();
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:email,
        password:password,
    );
    return UserCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      AwesomeDialog(
          context: context,
          title: "Error",
          body: Text("No user found for that email"))
        ..show();
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      AwesomeDialog(
          context: context,
          title: "Error",
          body: Text("Wrong Password"))
        ..show();
      print('Wrong password provided for that user.');
    }
  }

}else{
  print('not vaild');
}



  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.train_sharp),
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Sign in ',
                        style: TextStyle(color: Colors.black,fontSize: 25),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: formstate,
                          child: Column(
                            children: [
                              Container(

                                  child: TextFormField(
                                    onSaved: (val) {
                                      email  = val;
                                    },
                                    validator: (val) {
                                      if (val!.length > 100) {
                                        return "FirstName can't to be larger than 100 letter";
                                      }
                                      if (val.length < 2) {
                                        return "FirstName can't to be less than 2 letter";
                                      }
                                      return null;
                                    },
                                    decoration: ThemeHelper().textInputDecoration(
                                        'User Name', 'Enter your user name'),
                                  ),

                                decoration: ThemeHelper()
                                    .inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  onSaved: (val) {
                                    password = val;
                                  },
                                  validator: (val) {
                                    if (val!.length > 100) {
                                      return "FirstName can't to be larger than 100 letter";
                                    }
                                    if (val.length < 2) {
                                      return "FirstName can't to be less than 2 letter";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                ),
                                decoration: ThemeHelper()
                                    .inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                           forgotpasswordpage()),);
                                  },
                                  child: Text("Forgot your password?",
                                    style: TextStyle(color: Colors.grey,),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(
                                    context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: InkWell(
                                      onTap: ()async{
                          var user=await signIn();
                               if(user!=null){
                          Navigator.push(
                          context,
                         MaterialPageRoute(
                          builder: (context) => ticketbookinghomepage()));

                }
                            },
                                      child: Text('Sign In'.toUpperCase(),
                                        style: TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),),
                                    ),
                                  ),
                                  onPressed: () {

                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Don\'t have an account? "),
                                          TextSpan(
                                            text: 'Create',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            registrationpage()));
                                              },
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme
                                                    .of(context)
                                                    .accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
