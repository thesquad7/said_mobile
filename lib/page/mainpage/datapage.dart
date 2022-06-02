import 'package:flutter/material.dart';

import '../../config/dummyAPI.dart';

class page_1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
          children: rule().data.map((data) {
            List hobby = data["penambah"];
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.indigo.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      children: [
                        Container(
                          height: 150,
                          width: 75,
                          color: Colors.blueAccent,
                          child: Text("Foto",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children:  [
                            Text("Tipe: ${data['Tipe']}"),
                            Text("Biaya: USD. ${data['Biaya']}"),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: hobby.map((color){
                              return Container(
                                color: Colors.grey,
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 8,
                                ),
                                padding: EdgeInsets.all(10), 
                                child: Text(color),
                              );
                            }).toList(),
                          ),
                        ),
                  ],
                ),
              ),
            );
          }).toList(),
      ),
    );
  }
}
class page_2 extends StatelessWidget{
  set penambah(Map<String, dynamic> penambah) {}
  @override
  Widget build(BuildContext context){
    return ListView(
          children: rule().data.map((data) {
            List hobby = data["penambah"];
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.indigo.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children: [
                            Text("Tipe: ${data['Tipe']}"),
                            Text("Biaya: USD. ${data['Biaya']}"),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: hobby.map((color){
                              return Container(
                                color: Colors.grey,
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 8,
                                ),
                                padding: EdgeInsets.all(10), 
                                child: Text(color),
                              );
                            }).toList(),
                          ),
                        ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
  }      
}
class page_3 extends StatelessWidget{
  bool showPassword = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Nama Lengkap", "Filemon Sitanggang", false),
              buildTextField("E-mail", "filemon17th@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Alamat", "IMY, Indonesia", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("Batal",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}