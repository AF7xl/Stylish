import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/ui/product%20page.dart';

import 'homepage.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                        width: 18.w,
                        height: 12.h,
                        child: Icon(
                          Icons.dehaze,
                          color: Color(0xff323232),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 95.w),
                    child: SizedBox(
                        width: 111.78.w,
                        height: 31.03.h,
                        child: Image.asset("assets/logofull.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 70.w),
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage("assets/avatar.png"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 15.w),
              child: Container(
                width: 343.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xffBBBBBB), fontSize: 16.sp),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Color(0xffBBBBBB),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Search any Product..",
                        hintStyle: TextStyle(
                            fontFamily: "Monsterrat",
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Color(0xffBBBBBB)),
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Color(0xffBBBBBB),
                        ),
                        suffixIcon:
                            Icon(CupertinoIcons.mic, color: Color(0xffBBBBBB))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 15.w),
              child: Text(
                "52,082+ Iteams ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat"),
              ),
            ),
            GridView.count(
              padding: EdgeInsets.only(top: 15.h, left: 3.w, right: 3.w),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: 164 / 200,
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => productdetails( img: popularprdctdata[index]
                            .images!
                            .first
                            .toString(),
                            description: popularprdctdata[index]
                                .description
                                .toString(),
                            title: popularprdctdata[index]
                                .productName
                                .toString(),
                            price: popularprdctdata[index]
                                .productPrice
                                .toString()
                                .toString())));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: 124.h,
                            child: Image.asset(
                              "assets/list.png",
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: SizedBox(
                            width: 162.w,
                            height: 16.h,
                            child: Text(
                              "Women Printed Kurta",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: SizedBox(
                            width: 162.w,
                            height: 32.h,
                            child: Text(
                              "Neque porro quisquam est qui dolorem ipsum quia",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: SizedBox(
                            width: 66.w,
                            height: 18.h,
                            child: Text(
                              "₹1500",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80.w,
                                height: 14.h,
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
                              Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: SizedBox(
                                  width: 39.w,
                                  height: 14.h,
                                  child: Text(
                                    "56890",
                                    style: TextStyle(
                                        color: Color(0xffA4A9B3),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
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
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
