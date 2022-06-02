import 'package:flutter/material.dart';

import '../../config/dummyAPI.dart';
import 'datapage.dart';

class UI extends StatefulWidget{
  @override
  _UI_Core createState() => _UI_Core();
}

class _UI_Core extends State<UI>{
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final screen = [
      page_1(),
      page_2(),
      page_3(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(judul().judult[_page]),
        actions:<Widget>[
          CircleAvatar(
          ),
          Container(
            width: 50,
            alignment: Alignment.center,
            child: Text("UserX"),
          ),
        ]
      ),
      extendBody: true,
        bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child:BottomNavigationBar(
          key: _bottomNavigationKey,
         items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: 'Informasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Adminstrasi',
          ),
          ],
          currentIndex: _page,
          selectedItemColor: Colors.red[800],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        ),
        body: screen[_page],
    );
  }
}