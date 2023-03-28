import 'package:flutter/material.dart';

class Controller extends StatelessWidget {
  // const Controler({Key? key}) : super(key: key);
  Controller(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('controler'),
      ),
      body: Container(
        color: Colors.red,
        child: const Text('data'),
      ),
    );
  }
}
