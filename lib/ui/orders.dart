import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/Bloc/deletebloc_bloc.dart';
import 'package:stylish/Bloc/getorder_bloc.dart';
import 'package:stylish/Repository/modelclass/GetorderModelClass.dart';

class orders extends StatefulWidget {
  const orders({super.key});

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  late List<GetorderModelClass> data;

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String buyid = prefs.getString("Buyid").toString();
    BlocProvider.of<GetorderBloc>(context).add(FetchGetorder(buyid: buyid));
  }

  @override
  initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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
                    "Orders",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<GetorderBloc, GetorderState>(
            builder: (context, state) {
              if (state is GetorderStateLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetorderStateError) {
                return Center(
                  child: Text("No items"),
                );
              }
              if (state is GetorderStateLoaded) {
                data =
                    BlocProvider
                        .of<GetorderBloc>(context)
                        .getorderModelClass;
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 15.h),
                        child: Container(
                          width: 331.w,
                          height: 191.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Color(0xffFFFFFF)),
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: SizedBox(
                                          width: 130.53.w,
                                          height: 125.h,
                                          child: Image.network(
                                            data[index].image.toString(),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 150.w,
                                                height: 20.h,
                                                child: Text(
                                                  data[index]
                                                      .productName
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontFamily: "Montserrat"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.only(left: 3.w),
                                                child: BlocListener<
                                                    DeleteblocBloc,
                                                    DeleteblocState>(
                                                  listener: (context, state) async {
                                                    if (state is DeleteStateLoading) {
                                                      print("loading");
                                                    }
                                                    if (state is DeleteStateError) {
                                                      Text("error");
                                                    }
                                                    if (state is DeleteStateLoaded)
                                                    {
                                                      final SharedPreferences prefs = await SharedPreferences
                                                          .getInstance();
                                                      String buyid = prefs
                                                          .getString("Buyid")
                                                          .toString();
                                                      BlocProvider.of<
                                                          GetorderBloc>(context)
                                                          .add(FetchGetorder(
                                                          buyid:buyid));
                                                    }
                                                  },
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      BlocProvider.of<
                                                          DeleteblocBloc>(
                                                          context)
                                                          .add(Fetchdelete(
                                                          buyid: data[index]
                                                              .id
                                                              .toString()));
                                                      super.initState();
                                                    },
                                                    child: Icon(
                                                      Icons.cancel_outlined,
                                                      size: 18,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Quantity : ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontFamily: "Montserrat"),
                                                ),
                                                Text(
                                                    "1",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontFamily:
                                                        "Montserrat"))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 84.w,
                                                  height: 29.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Color(
                                                              0xffCACACA))),
                                                  child: Center(
                                                    child: Text(
                                                      "\$ ${data[index]
                                                          .productPrice
                                                          .toString()}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontFamily:
                                                          "Montserrat"),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Divider(
                                    indent: 10.w,
                                    endIndent: 10.w,
                                    color: Color(0xffBBBBBB),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Text(
                                          "Total Order (1)   :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: Color(0xff000000)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 150),
                                        child: SizedBox(
                                          width: 66.w,
                                          height: 20.h,
                                          child: Text(
                                            "\$ ${data[index].productPrice
                                                .toString()}",
                                            style: TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Montserrat"),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox();
                    },
                    itemCount: data.length,
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
