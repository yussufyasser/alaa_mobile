import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget{

  late String tittle;
  late bool show_hide;
  TextEditingController _controller=TextEditingController();

  MyTextfield(String tittle,{bool show_hide=false}){

    this.tittle=tittle;
    this.show_hide=show_hide;
  }

  String get_data(){
    return this._controller.text;
  }

  @override
  Widget build(BuildContext context) {


  return  TextFormField(
    obscureText: this.show_hide,
    controller: this._controller,
      decoration: InputDecoration(
        labelText: this.tittle,
        labelStyle: TextStyle(color: Colors.white),
        fillColor: Colors.white.withOpacity(0.7),
        filled: true,
        border: OutlineInputBorder(),
      ));
    /********************************************* *

    return Column(

      

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[

        Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Text( this.tittle,style: TextStyle(fontWeight: FontWeight.bold,),),),
        SizedBox(height: 20),
        TextField(obscureText: this.show_hide, controller: _controller, 
        decoration: InputDecoration(hintText: this.hint,prefixIcon: Icon(Icons.email),
        filled: true,fillColor: Colors.white.withOpacity(0.8),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),),), )

      ],
    );
****************************************/
  }

  
}