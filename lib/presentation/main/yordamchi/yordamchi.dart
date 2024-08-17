import 'package:flutter/material.dart';

class Yordamchi extends StatefulWidget {
  const Yordamchi({super.key});

  @override
  State<Yordamchi> createState() => _YordamchiState();
}

class _YordamchiState extends State<Yordamchi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Yordamchi")),
    );
  }
}
