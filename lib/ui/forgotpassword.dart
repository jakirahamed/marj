import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marj/widgets/customButton.dart';
import 'package:marj/widgets/myTextField.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  get _nameController => null;

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
                    'Forgot Password',
                    style:
                        TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Text('Enter Your Email/Phone',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: 20.0,
                  ),
                  myTextField('Enter Your Email/Phone', 'Email or Phone',
                      TextInputType.emailAddress, _nameController),
                  SizedBox(
                    height: 10.0,
                  ),
                
                 
                  SizedBox(
                    height: 25.h,
                  ),
                  customButton('SEND', () {}),
                 
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
