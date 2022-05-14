import 'package:dev2/home/homepage.dart';
import 'package:dev2/home/page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Regpage extends StatefulWidget {
  const Regpage({Key? key}) : super(key: key);

  @override
  State<Regpage> createState() => _RegpageState();
}

class _RegpageState extends State<Regpage> {
  TextEditingController emialeditingcontrolller = TextEditingController();
  TextEditingController passwordeditingcontoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Image.network(
                  "https://st2.depositphotos.com/3837271/8402/i/450/depositphotos_84020488-stock-photo-hand-with-marker-writing-text.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: emialeditingcontrolller,
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.orange,
                      hintText: 'Email',
                      filled: true,
                      // focusColor: Colors.grey,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: passwordeditingcontoller,
                  style: TextStyle(color: Colors.blue),
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye),
                      suffixIconColor: Colors.orange,
                      hintText: 'Password',
                      filled: true,

                      // focusColor: Colors.grey,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
            ),
            InkWell(
              onTap: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emialeditingcontrolller.text,
                          password: passwordeditingcontoller.text);
                  if (userCredential.user!.email != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => page1()));
                  }
                } catch (e) {}
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ]),
        )));
  }
}
