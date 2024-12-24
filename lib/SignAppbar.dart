import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student/Help.dart';

class SignMyAppbar{

static AppBar theappbar(BuildContext context){

    PopupMenuButton menu=PopupMenuButton(

      itemBuilder: ((context) {


        return <PopupMenuEntry>[

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