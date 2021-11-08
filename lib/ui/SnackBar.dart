import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Builder(builder: (BuildContext con) {
              // ignore: deprecated_member_use
              return RaisedButton(
                onPressed: () {
                  // ignore: deprecated_member_use
                  Scaffold.of(con).showSnackBar(SnackBar(
                    content: Text('This is SnackBar'),
                    duration: Duration(seconds: 10),
                    action: SnackBarAction(
                      label: "ok",
                      onPressed: () {},
                    ),
                  ));
                },
                child: Text("Click "),
                
              );
            }),
            
          ),
          Text("Md Jakir Hossain",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 32))),
        ],
      ),
      
    );
  }
}
