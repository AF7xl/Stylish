import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/ui/bnb.dart';

import 'homepage.dart';

class getstart extends StatefulWidget {
  const getstart({super.key});

  @override
  State<getstart> createState() => _getstartState();
}

class _getstartState extends State<getstart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bi.png"), fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 530.h, left: 60.w),
              child: Text(
                "     You want\nAuthentic, here\n       you go!",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: "Montserrat",
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 110.w),
              child: Text(
                "Find it here, buy it now",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: "montserrat",
                    color: Color(0xffF2F2F2)),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top: 20.h,left: 30.w),
              child: GestureDetector(onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>bnb()));
              },
                child: Container(
                  width: 317.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                      color: Color(0xffF83758),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
