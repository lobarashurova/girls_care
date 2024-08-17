import 'package:flutter/material.dart';

class Hisob extends StatefulWidget {
  const Hisob({super.key});

  @override
  State<Hisob> createState() => _HisobState();
}

class _HisobState extends State<Hisob> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hisob")),
    );
  }
}
