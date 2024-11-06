import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/ui/homepage.dart';

class cart extends StatefulWidget {


  cart(
      {super.key,
      });

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => home()));
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
                      "Checkout",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100.w),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w.w),
                    child: Text(
                      "Delivery Address",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
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
                    child: Container(
                      width: 241.w,
                      height: 85.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color(0xffFFFFFF)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Text(
                                    "Address :",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 150),
                                  child: Icon(
                                    CupertinoIcons.square_pencil,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: SizedBox(
                                    width: 225.w,
                                    height: 20.h,
                                    child: Text(
                                      "216 St Paul's Rd, London N1 2LL, UK",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: SizedBox(
                                    width: 225.w,
                                    height: 20.h,
                                    child: Text(
                                      "Contact :  +44-784232",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
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
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Container(
                      width: 78.w,
                      height: 85.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color(0xffFFFFFF)),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.add_circled,
                          size: 45,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w.w, top: 20.h),
              child: Text(
                "Shopping List",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat"),
              ),
            ),
            Padding(
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
                                child: Image.asset(
                                  "assets/list.png",
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  height: 20.h,
                                  child: Text(
                                    "Kurtha",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Variations : ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Montserrat"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Container(
                                          width: 39,
                                          height: 17.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Center(
                                            child: Text(
                                              "Black ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Montserrat"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Container(
                                          width: 39,
                                          height: 17.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Center(
                                            child: Text(
                                              "Red ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Montserrat"),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        "4.8",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Montserrat"),
                                      ),
                                      SizedBox(
                                        width: 98.w,
                                        height: 14.h,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 25.w),
                                          child: RatingBar.builder(
                                            initialRating: 2,
                                            itemSize: 15,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                      )
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
                                                BorderRadius.circular(8.r),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Color(0xffCACACA))),
                                        child: Center(
                                          child: Text(
                                            "4200",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Montserrat"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "upto 33% off  ",
                                              style: TextStyle(
                                                  color: Color(0xffEB3030),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Montserrat"),
                                            ),
                                            Text(
                                              "\$ 64.00",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.sp,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Color(0xffBBBBBB)),
                                            )
                                          ],
                                        ),
                                      )
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
                                  "4200",
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
            )
          ],
        ),
      ),
    );
  }
}
