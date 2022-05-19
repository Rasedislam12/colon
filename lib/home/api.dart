import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:http/http.dart';

class api extends StatefulWidget {
  const api({Key? key}) : super(key: key);

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  // List datalist = [];
  // Future getdata() async {
  //   final respons =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  //   if (respons.statusCode == 200) {
  //     datalist = await jsonDecode(respons.body);
  //     print(respons.statusCode);
  //   }
  // }
  List datalist = [];
  Future getdata() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      print(datalist);
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //     child: ListView.builder(
        //   itemCount: datalist.length,
        //   itemBuilder: (context, index) => ListTile(
        //     title: Text(datalist[index]['name']),
        //     subtitle: Text(datalist[index]['username']),
        //     trailing: Container(
        //         height: 30, width: 150, child: Text(datalist[index]['email'])),
        //   ),
        // )

        child: ListView.builder(
          itemCount: datalist.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(datalist[index]['name']),
            subtitle: Text(datalist[index]['username']),
            trailing: Container(
              height: 30,
              width: 150,
              child: Text(datalist[index]['address']['suite']),
            ),
          ),
        ),
      ),
    );
  }
}
