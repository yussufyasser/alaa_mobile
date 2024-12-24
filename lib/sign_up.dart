import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student/SignAppbar.dart';
import 'package:student/main.dart';

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  TextEditingController _controlleremail=TextEditingController(),_controllerpassword=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: SignMyAppbar.theappbar(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 100),

                  Image.asset(
                    'assets/logo.jpg',
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 30),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        TextFormField(
                          controller: _controlleremail,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _controllerpassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            else if (!(value.length >= 8 && RegExp(r'\d').hasMatch(value)))
                            return 'please enter password that contains 8 characters\nat least one number\nat least one big character';

                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value != _controllerpassword.text) {
                              return 'Please confirm your password';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: _controlleremail.text,
                                password: _controllerpassword.text,
                              );
                              Main.student_email=_controlleremail.text;
                              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false); 
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'email-already-in-use') {
                                Main.Alert('sorry','this email is used', context);
                              }
                            } catch (e) {
                              print(e);
                            }


                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Signing up $name')),
                              );

                              
                            }
                          },
                          child: Text('Sign Up'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
