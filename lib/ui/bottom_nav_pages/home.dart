import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue,
     appBar: AppBar(
        title: Text('marj'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
