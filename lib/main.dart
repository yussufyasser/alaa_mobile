import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student/Home.dart';
import 'package:student/firebase_options.dart';
import 'package:student/sign_in.dart';
import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {

      print('sss');
      

      runApp(MyApp());
    } else {

      print('fffff');

      Main.student_email=user.email!;
     

      runApp(SignInApp());
    }
  });
  
}

class Main{
  static String student_email='';
  static void Alert(String tittle, String message,BuildContext context){

    showDialog(
      context: context, 
      builder:(BuildContext builder){

        return SingleChildScrollView( child:  AlertDialog(

          title: Text(tittle),
          content: Text(message),
          actions: <Align>[

            Align( child:  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('ok')),
            alignment: Alignment.centerLeft),
          ],

        ));
      }

      );
  }
}



class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/home': (context) => Home(), 
        '/sign_in':(context) => SignIn(_changeLanguage)},
      title: 'Student learning App',
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const AppLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('ar', ''), // Arabic
      ],
      home: SignIn(_changeLanguage),

    );
  }
}




class SignInApp extends StatefulWidget {
  @override
  State<SignInApp> createState() => SignInAppState();
}

class SignInAppState extends State<SignInApp> {
  Locale _locale = const Locale('en', '');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/home': (context) => Home(), 
        '/sign_in':(context) => SignIn(_changeLanguage)},
      title: 'Student learning App',
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const AppLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('ar', ''), // Arabic
      ],
      home: Home(),

    );
  }
}

