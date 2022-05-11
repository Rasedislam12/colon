import 'package:dev2/loginfo/Regpage.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Image.network(
            "https://blog.gyt.is/wp-content/uploads/2019/06/login_2019_logo_black-800x268.png"),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
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
      Container(
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
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Regpage()));
                },
                child: Text('Sign Up!'))
          ],
        ),
      )
    ])));
  }
}
