import 'package:flutter/material.dart';
// import 'package:marj/widgets/myTextField.dart';

class Cart extends StatelessWidget {
  const Cart({ Key? key }) : super(key: key);

  // get _nameController => null;

  // get _phonrNumber => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('Cart')),
          // myTextField("Name", TextInputType.text,_nameController ),
          // myTextField("password", TextInputType.number, _phonrNumber),
        ],
      ),
      
    );
  }
}