// import 'package:flutter/foundation.dart';

// class databasemodel {
//   int? id;
//   String? firstname;
//   String? lastname;
//   String? email;
//   databasemodel({this.id, this.firstname, this.lastname, this.email});

//   factory databasemodel.formmap(Map<String, dynamic> data) => databasemodel(
//       id: data['id'],
//       firstname: data['first_name'],
//       lastname: data['last_name'],
//       email: data['email']);

//   Map<String, dynamic> tomap() => {
//         'id': id,
//         "first_name": firstname,
//         "last_name": lastname,
//         "email": email
//       };
// }

class customermodel {
  int? id;
  String? fristname;
  String? lastname;
  String? email;
  customermodel({this.id, this.fristname, this.lastname, this.email});

  factory customermodel.frommap(Map<String, dynamic> data) => customermodel(
      id: data['id'],
      fristname: data['first_name'],
      lastname: data['last_name'],
      email: data['email']);

  Map<String, dynamic> tomap() => {
        'id': id,
        'first_name': fristname,
        'last_name': lastname,
        'email': email
      };
}
