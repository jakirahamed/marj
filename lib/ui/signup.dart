import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:marj/const/Appscolor.dart';
import 'package:marj/ui/Userform.dart';
import 'package:marj/ui/login.dart';
import 'package:marj/widgets/customButton.dart';
// import 'package:marj/widgets/customButton.dart';
// import 'package:marj/widgets/myTextField.dart';
// import 'package:marj/widgets/passwordtextfield.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _repasswordController = TextEditingController();

  bool _passwordVisible = false;

  signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Userform()));
      } else {
        Fluttertoast.showToast(msg: 'Something is worng');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  final _formkey = GlobalKey<FormState>();
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
              Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 34.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            return "Enter Correct name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.phone),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$")
                                  .hasMatch(value!)) {
                            return "Enter Correct Phone Number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.mail),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!)) {
                            return "Enter Correct Email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                           suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                    ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                                  .hasMatch(value!)) {
                            return "Enter Correct Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                       SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _repasswordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                             suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                    ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                                  .hasMatch(value!)) {
                            return "Enter Correct Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
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
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              customButton('Sign Up', () {
                if (_formkey.currentState!.validate()) {}
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height/6,
              ),
              Center(
                  child: Text('Or sign up with social account',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400))),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.network('https://i.ibb.co/C11DhdN/google.png'),
                    height: 30.h,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    child:
                        Image.network('https://i.ibb.co/GkqSptB/facebook.png'),
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
