import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/ui/login.dart';
import 'package:stylish/ui/update.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {

   String locality="";
   String city="";
   String state=""; String email="";

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email=prefs.getString("Email").toString();
      locality = prefs.getString("Locality").toString();
      city = prefs.getString("City").toString();
      state = prefs.getString("State").toString();
    });

  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h, left: 150.w),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundImage: AssetImage("assets/avatar.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45.w, top: 40.h),
                    child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: Colors.blueAccent,
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Personal Details",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Email Address",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8C8C8)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, top: 10.h),
                        child: Text(
                          email,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8C8C8)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, top: 10.h),
                        child: Text(
                          "***********",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 190.w),
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                          color: Color(0xffF83758),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat"),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              indent: 25.w,
              endIndent: 25.w,
              color: Color(0xffC4C4C4),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      children: [
                        Text(
                          "Address Details",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => update()));
                            },
                            child: Text(
                              "Update Address Details",
                              style: TextStyle(
                                  color: Color(0xffF83758),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Pincode",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8C8C8)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, top: 10.h),
                        child: Text(
                          "676501",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8C8C8)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, top: 10.h),
                        child: Text(
                           locality,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "City",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8C8C8)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, top: 10.h),
                        child: Text(
                         city,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "State",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8C8C8)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, top: 10.h),
                        child: Text(
                          state,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Country",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffC8C8C8)),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, top: 10.h),
                        child: Text(
                          "Country",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 25.w),
              child: GestureDetector(onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => login()));
              },
                child: Container(
                  width: 327.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                      color: Color(0xffF83758),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                    child: Text(
                      "Logout",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
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
