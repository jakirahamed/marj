import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marj/ui/login.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Login())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.network("https://i.ibb.co/ZVjfSCD/wh-10.png"), //white
                //child: Image.network("https://i.ibb.co/LnR52fN/veriyetion-10.png"), //black
                 //color: Colors.blue,
                height: 70.h,
                width: 150.w,
              ),
              SizedBox(
                height: 5.h,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      
    );
  }
}
