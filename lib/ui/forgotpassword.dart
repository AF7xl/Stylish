import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 30.w),
            child: Text(
              "Forgot\npassword?",
              style: TextStyle(
                  color: Color(0xff000000),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 36.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 45.h, left: 30.w),
            child: Container(
              width: 317.w,
              height: 55.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffA8A8A9)),
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Center(
                child: TextFormField(
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color(0xff0676767), fontSize: 16.sp),
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Color(0xff676767),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 3.h),
                    border: InputBorder.none,
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Enter your email address",
                    hintStyle: TextStyle(
                        fontFamily: "Monsterrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: Color(0xff676767)),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xff676767),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h,left: 30.w),
            child: RichText(
              text: TextSpan(
                text: '*',
                style: TextStyle(color: Color(0xffFF4B26), fontSize: 12.sp),
                children: const <TextSpan>[
                  TextSpan(
                      text:
                          'We will send you a message to set or reset\nyour new password',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff676767),
                          fontSize: 12,
                          fontFamily: "Montserrat")),
                ],
              ),
            ),
          ), Padding(
            padding: EdgeInsets.only(top: 40.h, left: 30.w),
            child: Container(
              width: 317.w,
              height: 55.h,
              decoration: BoxDecoration(
                  color: Color(0xffF83758),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
