import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desciptioncontoller = TextEditingController();

  List datacollect = [];
  Getdata() {
    FirebaseFirestore.instance
        .collection('datatest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      datacollect = querySnapshot.docs;
    });
  }

  @override
  void initState() {
    Getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: titlecontroller,
            decoration: InputDecoration(
                hintText: 'title', filled: true, fillColor: Colors.grey[200]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: desciptioncontoller,
            decoration: InputDecoration(
                hintText: 'description',
                filled: true,
                fillColor: Colors.grey[200]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("datatest")
                      .add({
                        "title": titlecontroller.text,
                        "description": desciptioncontoller.text
                      })
                      .then((value) => print('data added'))
                      .catchError((error) => print("data not added"))
                      .then((value) => {
                            desciptioncontoller.clear(),
                            titlecontroller.clear()
                          });
                },
                child: Text('Add')),
            ElevatedButton(onPressed: () {}, child: Text('Update'))
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: datacollect.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Container(
                  height: 30,
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                ),
                title: Text(datacollect[index]['title']),
                subtitle: Text(datacollect[index]['description']),
              );
            },
          ),
        )
      ],
    )));
  }
}
