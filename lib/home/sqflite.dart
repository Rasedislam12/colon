import 'package:dev2/logicfile/database_model.dart';
import 'package:dev2/logicfile/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class sqflite extends StatefulWidget {
  const sqflite({Key? key}) : super(key: key);

  @override
  State<sqflite> createState() => _sqfliteState();
}

class _sqfliteState extends State<sqflite> {
  late TextEditingController fnameeditingcontroller;
  late TextEditingController lnameeditingcontroller;
  late TextEditingController emaileditingcontroller;

  @override
  void initState() {
    fnameeditingcontroller = TextEditingController();
    lnameeditingcontroller = TextEditingController();
    emaileditingcontroller = TextEditingController();
    super.initState();
  }

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
                controller: fnameeditingcontroller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'first name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: lnameeditingcontroller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'last name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emaileditingcontroller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: ' email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final customer = customermodel(
                      id: 1,
                      fristname: fnameeditingcontroller.text,
                      lastname: lnameeditingcontroller.text,
                      email: emaileditingcontroller.text);
                  await DatabaseHelper.instance.addcustomer(customer);
                  print(customer.fristname);
                },
                child: Text("Save")),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text('Hello word'),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
