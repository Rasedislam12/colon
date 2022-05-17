import 'package:dev2/home/page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class testpage extends StatefulWidget {
  const testpage({Key? key}) : super(key: key);

  @override
  State<testpage> createState() => _testpageState();
}

class _testpageState extends State<testpage> {
  TextEditingController emaileditingcontroller = TextEditingController();
  TextEditingController passwordediting = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emaileditingcontroller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                obscureText: true,
                controller: passwordediting,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Pasword',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emaileditingcontroller.text,
                            password: passwordediting.text);

                    if (userCredential.user!.email != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => page1()));
                    }
                  } catch (e) {}
                },
                child: Text('Login'))
          ],
        ),
      )),
    );
  }
}
