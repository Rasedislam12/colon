import 'package:flutter/material.dart';

class Regpage extends StatefulWidget {
  const Regpage({Key? key}) : super(key: key);

  @override
  State<Regpage> createState() => _RegpageState();
}

class _RegpageState extends State<Regpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Image.network(
                "https://st2.depositphotos.com/3837271/8402/i/450/depositphotos_84020488-stock-photo-hand-with-marker-writing-text.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
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
                "SignUp",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ])));
  }
}
