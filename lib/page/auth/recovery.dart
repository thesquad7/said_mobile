import 'package:flutter/material.dart';
import 'package:said/page/auth/login.dart';
import 'package:said/page/auth/recovery.dart';


class RegisterUI extends StatelessWidget {
  const RegisterUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: const MyRegister(),
      ),
    );
  }
}
class MyRegister extends StatelessWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   
        Column(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                    "SAID",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.lightBlue,
                    ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Bantuan Perbaikan Akun",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue,
                      ),
                    ),
                     const SizedBox(
                      height: 170,
                    ),
                    Container(
                      child:
                        CircleAvatar(
                          foregroundColor: Colors.red,
                          child:
                         Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 24.0,
                          ),
                        ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Silahkan masukkan informasi akun yang di butuhkan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue,
                      ),
                    ),
                     const SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Username Terdaftar",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Email/No-Hp Terdaftar",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.start,
                      children: [
                        TextButton(onPressed: (){}, child: const Text(
                          "Lupa Kata Sandi?"
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // background
                      onPrimary: Colors.white, // foreground
                      ),
                      onPressed: (){Navigator.of(context).push(MaterialPageRoute<void>(
                     builder: (BuildContext context) => MyRegister()),);},
                      child: Text('Kirim'),
                      ),
                       const SizedBox(
                      height: 30,
                      ),
                      ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: Colors.yellow, // background
                      onPrimary: Colors.white, // foreground
                      ),
                      
                      onPressed: (){Navigator.pop(context);},
                      child: Text('Kembali'),
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