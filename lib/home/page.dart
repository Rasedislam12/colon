import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  late TextEditingController titlecontroller;
  late TextEditingController desciptioncontoller;

  List datacollect = [];
  late String docmentid;
  bool isloding = false;
  Getdata() {
    FirebaseFirestore.instance
        .collection('datatest')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        datacollect = querySnapshot.docs;
      });
    });
  }

  @override
  void initState() {
    titlecontroller = TextEditingController();
    desciptioncontoller = TextEditingController();
    Getdata();
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
                    setState(() {
                      isloding = true;
                    });
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
                              titlecontroller.clear(),
                              Getdata(),
                              setState(() {
                                isloding = false;
                              })
                            });
                  },
                  child: Text('Add')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isloding = true;
                    });
                    FirebaseFirestore.instance
                        .collection('datatest')
                        .doc(docmentid)
                        .update({
                          "title": titlecontroller.text,
                          'description': desciptioncontoller.text,
                        })
                        .then((value) => print('data succesfully update'))
                        .catchError((error) => print('data not updated$error'))
                        .then((value) => {
                              titlecontroller.clear(),
                              desciptioncontoller.clear(),
                              Getdata(),
                              setState(() {
                                isloding = false;
                              })
                            });
                  },
                  child: Text('Update'))
            ],
          ),
          isloding
              ? CircularProgressIndicator()
              // : FutureBuilder(
              //     future:
              //         FirebaseFirestore.instance.collection("datatest").get(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> queryshanpshot) {
              //       if (queryshanpshot.hasError) {
              //         return Text("Something went wrong");
              //       }

              //       if (queryshanpshot.hasData) {
              //         return Text('Data not found');
              //       }

              //       if (queryshanpshot.connectionState ==
              //           ConnectionState.done) {
              //         List<DocumentSnapshot> datacollect =
              //             queryshanpshot.data!.docs;

              //         return ListView(
              //           children: datacollect.map((data) {
              //             return ListTile(
              //               title: Text(data['title']),
              //               subtitle: Text(data['description']),
              //             );
              //           }).toList(),
              //         );
              //       }

              //       return Text("loding.....");
              //     }),

              : Container(
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
                                  onPressed: () {
                                    setState(() {
                                      isloding = true;
                                    });
                                    FirebaseFirestore.instance
                                        .collection('datatest')
                                        .doc(datacollect[index].id)
                                        .delete()
                                        .then(
                                            (value) => print('delate success'))
                                        .then((value) {
                                      Getdata();
                                      setState(() {
                                        isloding = false;
                                      });
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      docmentid = datacollect[index].id;
                                      titlecontroller.text =
                                          datacollect[index]['title'];
                                      desciptioncontoller.text =
                                          datacollect[index]['description'];
                                    });
                                  },
                                  icon: Icon(Icons.edit))
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
      ),
    )));
  }
}
