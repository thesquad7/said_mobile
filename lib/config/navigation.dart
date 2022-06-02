import 'package:flutter/material.dart';
import 'package:said/page/auth/recovery.dart';
import '../page/auth/login.dart';

class UX extends  StatefulWidget{
  @override
  _ux createState() => _ux();
}

class _ux extends State<UX>{
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: LoginUI(),
      initialRoute: '/login',
      routes:{
        '/login': (context) => LoginUI(),
        '/ui': (context) => MyRegister(),
      },
    );
  }

}