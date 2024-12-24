import 'package:flutter/material.dart';
import 'package:student/MyTextfield.dart';
import 'package:student/SignAppbar.dart';
import 'package:student/main.dart';
import 'package:student/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget{

  late Function(Locale) _setlocale;

  SignIn(Function(Locale) _setlocale){
    this._setlocale=_setlocale;
  }

  @override
  State<StatefulWidget> createState() {

    return _SignInState(this._setlocale);
  }
  
}

class _SignInState extends State {
  late Function(Locale) _setlocale;
  _SignInState(Function(Locale) _setlocale){
    this._setlocale=_setlocale;
  }

  MyTextfield email=MyTextfield('Email'),password=MyTextfield('Password',show_hide: true,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignMyAppbar.theappbar(context),
      body: Stack(
        children: [

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/logo.jpg'),
                    ),
                    SizedBox(height: 20),
                    Text('Sign In',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white,),),
                    SizedBox(height: 20),
                    email,
                    SizedBox(height: 15),
                    password,
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {

                        String email_str=email.get_data(),password_str=password.get_data();
                        if(email_str.isEmpty || password_str.isEmpty)
                        Main.Alert('Please','fill the whole requirments', context);
                        else{
                          try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email_str,
                              password: password_str
                            );
                            Main.student_email=email_str;
                             Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false); 
                            
                          } on FirebaseAuthException catch (e) {

                            Main.Alert('sorry', 'there issue in signing in', context);
                          }
                      }

                        
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));

                      },
                      child: Text(
                        'dont have account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

                    