
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marj/ui/bottom_nav_controller.dart';
import 'package:marj/ui/bottom_nav_pages/home.dart';
import 'package:marj/ui/forgotpassword.dart';
import 'package:marj/widgets/customButton.dart';
import 'package:marj/widgets/myTextField.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavController()));

      }
      else {
        Fluttertoast.showToast(msg: 'Something is worng');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'The account already exists for that email.');

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  myTextField('Enter Your Email', 'Email',
                      TextInputType.emailAddress, _emailController),
                  SizedBox(
                    height: 10.0,
                  ),
                  myTextField(

                    'Enter Your Password', 'Password',
                      TextInputType.visiblePassword, _passwordController),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: 'Forgot your password? ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                TextSpan(
                                    text: '→',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.sp))
                              ]))),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  customButton('Login', () {
                    signIn();
                  }),
                  SizedBox(
                    height: 240.h,
                  ),
                  Center(
                      child: Text('Or login with social account',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400))),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.network(
                            'https://i.ibb.co/C11DhdN/google.png'),
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Container(
                        child: Image.network(
                            'https://i.ibb.co/GkqSptB/facebook.png'),
                        height: 30.h,
                        width: 30.w,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
