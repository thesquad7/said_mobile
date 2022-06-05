import 'package:flutter/material.dart';
import 'package:said/page/auth/recovery.dart';
import 'package:said/page/mainpage/home.dart';


class LoginUI extends StatelessWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Said",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: const MyLogin(),
      ),
    );
  }
}
class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

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
                      "Selamat Datang",
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
                          foregroundColor: Colors.teal,
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
                      "Silahkan Login",
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
                        labelText: "Username Anda",
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
                        labelText: "Kata Sandi Anda",
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
                     builder: (BuildContext context) => UI()),);},
                      child: Text('Masuk'),
                      ),
                    const SizedBox(
                      height: 14,
                    ),
                        const Text(
                      "Untuk melakukan pendaftaran akun silahkan hubungin Aparatur Desa",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue,
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