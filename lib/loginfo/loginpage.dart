import 'package:dev2/home/homepage.dart';
import 'package:dev2/home/page.dart';
import 'package:dev2/loginfo/Regpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController usernameeidtingcontoller = TextEditingController();
  TextEditingController passwordeditingcontolloer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Image.network(
              "https://blog.gyt.is/wp-content/uploads/2019/06/login_2019_logo_black-800x268.png"),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
              controller: usernameeidtingcontoller,
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.orange,
                  hintText: 'Username',
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
              controller: passwordeditingcontolloer,
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
                  .signInWithEmailAndPassword(
                      email: usernameeidtingcontoller.text,
                      password: passwordeditingcontolloer.text);

              if (userCredential.user!.email != null) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page1()));
              }
            } catch (e) {}
          },
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account!"),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Regpage()));
                  },
                  child: Text(
                    'Sign Up?',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        )
      ]),
    )));
  }
}
