import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish/Bloc/order_bloc.dart';
import 'package:stylish/ui/bnb.dart';
import 'package:stylish/ui/homepage.dart';
import 'package:stylish/ui/product%20page.dart';

import 'orders.dart';

class buynow extends StatefulWidget {
  String img;
  String title;
  String description;
  String price;

  buynow(
      {super.key,
      required this.img,
      required this.description,
      required this.title,
      required this.price});

  @override
  State<buynow> createState() => _buynowState();
}

const List<String> list = <String>['42', '45', '48', '50'];
const List<String> list1 = <String>['1', '2', '3', '4'];

class _buynowState extends State<buynow> {
  List<bool> isSelected = [false, false];
  String dropdownValue = list.first;
  String dropdownValue1 = list1.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
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
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130),
                    child: Text(
                      "Shopping Bag",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80.w),
                    child: Icon(
                      Icons.favorite_outline_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                        height: 153.h,
                        width: 123.w,
                        child: Image.network(
                          widget.img,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: SizedBox(
                            width: 200.w,
                            height: 23.h,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: SizedBox(
                            width: 188.w,
                            height: 34.h,
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            children: [
                              Container(
                                width: 86.w,
                                height: 25.h,
                                color: Color(0xffF2F2F2),
                                child: Row(
                                  children: [
                                    Text(
                                      "Size",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Montserrat"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: DropdownButton<String>(
                                        value: dropdownValue,
                                        underline:
                                            Container(color: Color(0xFF616161)),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Color(0xFF616161)),
                                        onChanged: (String? value) {
                                          // This is called when the user selects an item.
                                          setState(() {
                                            dropdownValue = value!;
                                          });
                                        },
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Container(
                                  width: 86.w,
                                  height: 25.h,
                                  color: Color(0xffF2F2F2),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Qty",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Montserrat"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: DropdownButton<String>(
                                          value: dropdownValue1,
                                          underline: Container(
                                              color: Color(0xFF616161)),
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Color(0xFF616161)),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              dropdownValue1 = value!;
                                            });
                                          },
                                          items: list1
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            children: [
                              Text(
                                "Delivery by ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Montserrat"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: Text(
                                  "10 May 2024",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat"),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Icon(
                      CupertinoIcons.ticket,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      "Apply Coupons",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 140.w),
                    child: Text(
                      "Select",
                      style: TextStyle(
                          color: Color(0xffF83758),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Divider(
                indent: 20.w,
                endIndent: 20.w,
                color: Color(0xffCACACA),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w),
              child: Text(
                "Order Payment Detailsr",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Order Amounts",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 150.w),
                    child: SizedBox(
                      width: 85.w,
                      height: 20.h,
                      child: Text(
                       "\$ ${widget.price}" ,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Convenience",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Text(
                      "Know more",
                      style: TextStyle(
                          color: Color(0xffF83758),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 95.w),
                    child: Text(
                      "Apply Coupon",
                      style: TextStyle(
                          color: Color(0xffEA1712),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Delivery Fee",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 170.w),
                    child: Text(
                      "Free",
                      style: TextStyle(
                          color: Color(0xffEA1712),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Divider(
                indent: 20.w,
                endIndent: 20.w,
                color: Color(0xffCACACA),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Order Total",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 170.w),
                    child: SizedBox(
                      width: 85.w,
                      height: 20.h,
                      child: Text(
                        "\$ ${widget.price}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "EMI  Available ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Text(
                      "Details",
                      style: TextStyle(
                          color: Color(0xffF83758),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomSheet: (Container(
          width: 393.w,
          height: 80.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r))),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      width: 85.w,
                      height: 20.h,
                      child: Text(
                        "\$ ${widget.price}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                    Text(
                      "View Details",
                      style: TextStyle(
                          color: Color(0xffF83758),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: BlocListener<OrderBloc, OrderState>(
                  listener: (context, state) {
                    if (state is OrderStateLoading) {
                      print("loading");
                    }
                    if (state is OrderStateError) {
                      Text("error");
                    }
                    if (state is OrderStateLoaded) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => orders()));
                    }
                  },
                  child: GestureDetector(
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String name = prefs.getString("Name").toString();
                      String email = prefs.getString("Email").toString();

                      String buyid = prefs.getString("Buyid").toString();
                      BlocProvider.of<OrderBloc>(context).add(Fetchorder(
                          name: name,
                          email: email,
                          prdname: widget.title,
                          prdprice: widget.price,
                          quantity: widget.price,
                          category: widget.description,
                          img: widget.img,
                          buyid: buyid,
                          vendid: "yuefgyu",
                          state: 'Kottakkal',
                          city: 'Malappuram',
                          locality: "edarikode"));
                    },
                    child: Container(
                      width: 219.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0xffF83758)),
                      child: Center(
                        child: Text(
                          "Proceed to Payment",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
