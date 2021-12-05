import 'dart:math';

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search'),),
      body: Center(
        child: Transform.rotate(angle: pi/4,
        child: Container(
          height: 200,
          width: 200,
          color: Colors.blue,
        ),
        ),
      )
    );
  }
}