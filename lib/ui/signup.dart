import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Bloc/signup_bloc.dart';
import 'package:stylish/ui/bnb.dart';
import 'package:stylish/ui/getstart.dart';
import 'package:stylish/ui/homepage.dart';
import 'package:stylish/ui/login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool passwordObscured = true;
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 30.w),
              child: Text(
                "Create an\naccount",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 36.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 65.h, left: 30.w),
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffA8A8A9)),
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                  child: TextFormField(
                    controller: Username,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff0676767), fontSize: 16.sp),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Color(0xff676767),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 3.h),
                      border: InputBorder.none,
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Username or Email",
                      hintStyle: TextStyle(
                          fontFamily: "Monsterrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: Color(0xff676767)),
                      prefixIcon: Icon(
                        CupertinoIcons.profile_circled,
                        color: Color(0xff676767),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 30.w),
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffA8A8A9)),
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                  child: TextFormField(
                    controller: fullname,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff0676767), fontSize: 16.sp),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Color(0xff676767),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 3.h),
                      border: InputBorder.none,
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                          fontFamily: "Monsterrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: Color(0xff676767)),
                      prefixIcon: Icon(
                        CupertinoIcons.profile_circled,
                        color: Color(0xff676767),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 30.w),
              child: Container(
                width: 317.w,
                height: 55.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffA8A8A9)),
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                  child: TextFormField(controller:Password ,
                    textAlign: TextAlign.start,
                    obscureText: passwordObscured,
                    style: TextStyle(color: Color(0xff0676767), fontSize: 16.sp),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Color(0xff676767),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 3.h),
                        border: InputBorder.none,
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                            fontFamily: "Monsterrat",
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xff676767)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xff676767),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObscured = !passwordObscured;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            color: Color(0xff676767),
                          ),
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 30.w),
              child: RichText(
                text: TextSpan(
                  text: 'By clicking the ',
                  style: TextStyle(
                      color: Color(0xff676767),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat",
                      fontSize: 12.sp),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFF4B26),
                            fontSize: 12,
                            fontFamily: "Montserrat")),
                    TextSpan(text: ' button, you agree\n to the public offer'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 30.w),
              child: BlocListener<SignupBloc, SignupState>(
                listener: (context, state) {
                  if (state is SignupStateLoading) {
                    print("loading");
                  }
                  if (state is SignupStateError) {
                    Text("error");
                  }
                  if (state is SignupStateLoaded) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => getstart()));
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<SignupBloc>(context).add(Fetchsignup(
                        username: Username.text, password: Password.text,fullname: fullname.text));
                  },
                  child: Container(
                    width: 317.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                        color: Color(0xffF83758),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 130.w),
              child: Text(
                "- OR Continue with -",
                style: TextStyle(
                    color: Color(0xff575757),
                    fontFamily: "Montserrat",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 85.w),
                    child: SizedBox(
                        width: 54.w,
                        height: 54.h,
                        child: Image.asset("assets/Google.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: SizedBox(
                        width: 54.w,
                        height: 54.h,
                        child: Image.asset("assets/apple.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: SizedBox(
                        width: 54.w,
                        height: 54.h,
                        child: Image.asset("assets/Facebook.png")),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 110.w),
              child: Row(
                children: [
                  Text(
                    "I Already Have An Account",
                    style: TextStyle(
                        color: Color(0xff575757),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: "Montserrat"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => signup()));
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => login()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xffF83758),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
