// // import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';

// class fasthome extends StatefulWidget {
//   const fasthome({Key? key}) : super(key: key);

//   @override
//   State<fasthome> createState() => _fasthomeState();
// }

// class _fasthomeState extends State<fasthome> {
//   @override
//   void initState() {
//     Getdata();
//     super.initState();
//   }

//   List tododata = [];

//   Getdata() async {
//     FirebaseFirestore.instance
//         .collection('todos')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       tododata = querySnapshot.docs;

//       print('print tododata$tododata');
//     });
//   }

//   TextEditingController titleeditingcontroller = TextEditingController();
//   TextEditingController descriptioneditingcontrolloer = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: TextField(
//                   controller: titleeditingcontroller,
//                   style: TextStyle(color: Colors.blue),
//                   decoration: InputDecoration(
//                       hintText: 'titile',
//                       filled: true,
//                       // focusColor: Colors.grey,
//                       fillColor: Colors.grey[300],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ))),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: TextField(
//                   controller: descriptioneditingcontrolloer,
//                   style: TextStyle(color: Colors.blue),
//                   decoration: InputDecoration(
//                       hintText: 'description',
//                       filled: true,
//                       // focusColor: Colors.grey,
//                       fillColor: Colors.grey[300],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ))),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       CollectionReference todos =
//                           FirebaseFirestore.instance.collection("todos");
//                       todos
//                           .add({
//                             "title": titleeditingcontroller.text,
//                             "description": descriptioneditingcontrolloer.text
//                           })
//                           .then((value) => print('todos added'))
//                           .catchError(
//                               (error) => print('totos not adedd:$error'))
//                           .then((clear) => {
//                                 titleeditingcontroller.clear(),
//                                 descriptioneditingcontrolloer.clear()
//                               });
//                     },
//                     child: Text('add')),
//                 ElevatedButton(onPressed: () {}, child: Text('update')),
//               ],
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height / 1.5,
//               width: MediaQuery.of(context).size.width,
//               child: ListView.builder(itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(backgroundColor: Colors.black),
//                   title: Text('just test'),
//                   subtitle: Text('amar sonar bangla'),
//                   trailing: Container(
//                     height: 30,
//                     width: 100,
//                     child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             )),
//                         IconButton(onPressed: () {}, icon: Icon(Icons.edit))
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
