import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class fast2 extends StatefulWidget {
  const fast2({Key? key}) : super(key: key);

  @override
  State<fast2> createState() => _fast2State();
}

class _fast2State extends State<fast2> {
  TextEditingController titleeditingcontroller = TextEditingController();
  TextEditingController descriptioneditingcontoller = TextEditingController();
  late String docmentid;
  late String documentid2;
  bool islodign = false;
  List dataadded = [];
  delatedata() {
    setState(() {
      islodign = true;
    });
    FirebaseFirestore.instance
        .collection('store')
        .doc(docmentid)
        .delete()
        .then((value) {
          getdata();
          setState(() {
            islodign = false;
          });
        })
        .then((value) => print('delate succesful'))
        .catchError((error) {
          print('shoe me error$error');
        });
  }

  getdata() {
    FirebaseFirestore.instance
        .collection('store')
        .get()
        .then((QuerySnapshot querysnapshot) {
      setState(() {
        dataadded = querysnapshot.docs;
      });
    });
  }

  Adddata() {
    setState(() {
      islodign = true;
    });
    FirebaseFirestore.instance
        .collection('store')
        .add({
          "title": titleeditingcontroller.text,
          "description": descriptioneditingcontoller.text,
        })
        .then((value) => print('todo added'))
        .catchError((error) {
          print('data not added$error');
        })
        .then((value) => {
              titleeditingcontroller.clear(),
              descriptioneditingcontoller.clear(),
              getdata(),
              setState(() {
                islodign = false;
              })
            });
  }

  updatedata() {
    setState(() {
      islodign = true;
    });
    FirebaseFirestore.instance.collection('store').doc(documentid2).update({
      'title': titleeditingcontroller.text,
      'description': descriptioneditingcontoller.text
    }).then((value) => {
          titleeditingcontroller.clear(),
          descriptioneditingcontoller.clear(),
          getdata(),
          setState(() {
            islodign = false;
          })
        });
  }

  @override
  void initState() {
    getdata();
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
                controller: titleeditingcontroller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: descriptioneditingcontoller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Adddata();
                    },
                    child: Text('Add')),
                ElevatedButton(
                    onPressed: () {
                      updatedata();
                    },
                    child: Text('Update')),
              ],
            ),
            islodign
                ? CircularProgressIndicator()
                : Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: dataadded.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: Container(
                            height: 30,
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      docmentid = dataadded[index].id;
                                      delatedata();
                                    },
                                    icon: Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        documentid2 = dataadded[index].id;
                                        titleeditingcontroller.text =
                                            dataadded[index]['title'];
                                        descriptioneditingcontoller.text =
                                            dataadded[index]['description'];
                                      });
                                    },
                                    icon: Icon(Icons.edit))
                              ],
                            ),
                          ),
                          title: Text(dataadded[index]['title']),
                          subtitle: Text(dataadded[index]['description']),
                          leading: CircleAvatar(backgroundColor: Colors.black),
                        );
                      },
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
