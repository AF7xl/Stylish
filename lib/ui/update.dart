import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/Bloc/update_bloc.dart';
import 'package:stylish/ui/settings.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  TextEditingController city = TextEditingController();
  TextEditingController locality = TextEditingController();
  TextEditingController _state = TextEditingController();
  void changeData(  String state, String city,
      String locality) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("State", state);
    prefs.setString("City", city);
    prefs.setString("Locality", locality);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90.w),
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  child: Center(
                    child: TextFormField(controller: locality,
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
                        hintText: "Address",
                        hintStyle: TextStyle(
                            fontFamily: "Monsterrat",
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xff676767)),
                      ),
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
                  child: Center(
                    child: TextFormField(controller: city,
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
                        hintText: "City",
                        hintStyle: TextStyle(
                            fontFamily: "Monsterrat",
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xff676767)),
                      ),
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
                  child: Center(
                    child: TextFormField(controller: _state,
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
                        hintText: "State",
                        hintStyle: TextStyle(
                            fontFamily: "Monsterrat",
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xff676767)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 15.w),
                child: BlocListener<UpdateBloc, UpdateState>(
                  listener: (context, state) {
                    if (state is UpdateStateLoading) {
                      print("loading");
                    }
                    if (state is UpdateStateError) {
                      Text("error");
                    }
                    if (state is UpdateStateLoaded) {
                      changeData(_state.text,city.text,locality.text);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => settings()));
                    }
                  },
                  child: GestureDetector(
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String buyid = prefs.getString("Buyid").toString();
                      BlocProvider.of<UpdateBloc>(context).add(FetchUpdate(
                        buyid: buyid,
                        state: _state.text,
                        locality: locality.text,
                        city: city.text,
                      ));
                    },
                    child: Container(
                      width: 327.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          color: Color(0xffF83758),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: Text(
                          "Update",
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
