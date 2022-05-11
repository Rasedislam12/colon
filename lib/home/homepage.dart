import 'package:flutter/material.dart';

class fasthome extends StatefulWidget {
  const fasthome({Key? key}) : super(key: key);

  @override
  State<fasthome> createState() => _fasthomeState();
}

class _fasthomeState extends State<fasthome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text('just test'),
      ),
    );
  }
}
