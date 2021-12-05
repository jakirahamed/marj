import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marj/ui/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: ()=> MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'marj',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splashscreen(),
        
        // home: MyHomePage(),
      ),
    );
  }
}

      
