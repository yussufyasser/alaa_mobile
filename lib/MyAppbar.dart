import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student/Help.dart';
import 'package:student/main.dart';


class MyAppbar{

static AppBar theappbar(BuildContext context){

    PopupMenuButton menu=PopupMenuButton(

      itemBuilder: ((context) {


        return <PopupMenuEntry>[

          PopupMenuItem(child: ListTile(
            title:Text(Main.student_email), 
            )),

          PopupMenuItem(child: ListTile(

            title: TextButton(onPressed: (){},
            child: Text('Arabc',)),
          )),

          PopupMenuItem(child: ListTile(

            title: TextButton(onPressed: (){},
            child: Text('English')),
          )),
          
          PopupMenuItem(child: ListTile(
            
            title: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Help()));
               }, 
            child: Text('help')),
          )),


          PopupMenuItem(child: ListTile(

            title: TextButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
              },
            child: Text('signout',)),
          )),
    
        ];
      }),

    );


    return AppBar(

      backgroundColor: const Color.fromARGB(255, 174, 130, 127),

      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),

      actions: [menu],
    );
   }
}