import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/Bloc/signin_bloc.dart';
import 'package:stylish/Repository/modelclass/SigninModelClass.dart';
import 'package:stylish/ui/bnb.dart';
import 'package:stylish/ui/forgotpassword.dart';
import 'package:stylish/ui/homepage.dart';
import 'package:stylish/ui/signup.dart';

import 'getstart.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool passwordObscured = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late SigninModelClass data;

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
                "Welcome\nBack!",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
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
                    controller: username,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(color: Color(0xff0676767), fontSize: 16.sp),
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
                    controller: password,
                    textAlign: TextAlign.start,
                    obscureText: passwordObscured,
                    style:
                        TextStyle(color: Color(0xff0676767), fontSize: 16.sp),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Color(0xff676767),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 3.h),
                        border: InputBorder.none,
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Password",
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
              padding: EdgeInsets.only(top: 8.h, left: 240.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => forgotpassword()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Color(0xffF83758),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 30.w),
              child: BlocListener<SigninBloc, SigninState>(
                listener: (context, state) {
                  if (state is SigninStateLoading) {
                    print("loading");
                  }
                  if (state is SigninStateError) {
                    Text("error");
                  }
                  if (state is SigninStateLoaded) {
                    data =
                        BlocProvider.of<SigninBloc>(context).signinmodelclass;
                    storeData(
                        data.fullName.toString(),
                        data.email.toString(),
                        data.state.toString(),
                        data.city.toString(),
                        data.locality.toString(),data.id.toString());
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => bnb()));
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<SigninBloc>(context).add(Fetchsignin(
                      username: username.text,
                      password: password.text,
                    ));
                  },
                  child: Container(
                    width: 317.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                        color: Color(0xffF83758),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                      child: Text(
                        "Login",
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
              padding: EdgeInsets.only(top: 75.h, left: 130.w),
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
                    "Create An Account",
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
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xffF83758),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void storeData(String name, String email, String state, String city,
      String locality,String buyid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Name", name);
    prefs.setString("Email", email);
    prefs.setString("State", state);
    prefs.setString("City", city);
    prefs.setString("Locality", locality);
    prefs.setString("Buyid", buyid);
  }
}
