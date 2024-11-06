import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Bloc/review_bloc.dart';
import 'package:stylish/Repository/modelclass/ReviewModelClass.dart';
import 'package:stylish/ui/cart.dart';
import 'package:stylish/ui/homepage.dart';
import 'package:stylish/ui/orders.dart';

import 'buynow.dart';

class productdetails extends StatefulWidget {
  String img;
  String title;
  String description;
  String price;

  productdetails(
      {super.key,
      required this.img,
      required this.description,
      required this.title,
      required this.price});

  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  late List<ReviewModelClass> revdata;

  @override
  void initState() {
    BlocProvider.of<ReviewBloc>(context).add(FetchReview());
    super.initState();
  }

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
                  padding: EdgeInsets.only(left: 280.w),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xffF2F2F2),
                    child: Center(
                        child: Icon(
                      CupertinoIcons.cart,
                      color: Colors.black,
                    )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                width: 343.w,
                height: 213.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25.r)),
                child: Image.network(
                  widget.img,
                  fit: BoxFit.fill,
                ),
              ),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 25.w),
            child: SizedBox(
              width: 343.w,
              height: 22.h,
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h, left: 25.w),
            child: SizedBox(
              width: 343.w,
              height: 16.h,
              child: Text(
                widget.description,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                SizedBox(
                  width: 105.w,
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
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: SizedBox(
                    width: 39.w,
                    height: 16.h,
                    child: Text(
                      "56890",
                      style: TextStyle(
                          color: Color(0xffA4A9B3),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
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
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: SizedBox(
                    width: 66.w,
                    height: 18.h,
                    child: Text(
                      "\$ ${widget.price}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: SizedBox(
                    width: 110.w,
                    height: 16.h,
                    child: Text(
                      "40%Off",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 25.w),
            child: Text(
              "Product Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 25.w),
            child: SizedBox(
              width: 343.w,
              height: 110.h,
              child: Text(
                "Perhaps the most iconic sneaker of all-time, this original Chicago? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat"),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => orders()));
                  },
                  child: SizedBox(
                      height: 40.h,
                      width: 137.w,
                      child: Image.asset("assets/gotocart.png")),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => buynow(
                              description: widget.description,
                              title: widget.title,
                              price: widget.price,
                              img: widget.img,
                            )));
                  },
                  child: SizedBox(
                      height: 40.h,
                      width: 137.w,
                      child: Image.asset("assets/buy.png")),
                ),
              )
            ],
          ),
          Expanded(
            child: BlocBuilder<ReviewBloc, ReviewState>(
              builder: (context, state) {
                if (state is ReviewStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ReviewStateError) {
                  return Center(
                    child: Text("No Connection"),
                  );
                }
                if (state is ReviewStateLoaded) {
                  revdata =
                      BlocProvider.of<ReviewBloc>(context).reviewmodelclass;
                  return ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 110.w,
                        height: 150.h,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: CircleAvatar(
                                    radius: 22.r,
                                    backgroundImage:
                                        AssetImage("assets/avatar.png"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        revdata[index].fullName.toString(),
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '12/03/2024 12:00',
                                        style: TextStyle(
                                            color: Colors.grey[150],
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w200),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w, top: 10.h),
                              child: Text(
                                'Rating : ${revdata[index].rating.toString()}',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h, left: 5.w),
                              child: SizedBox(
                                width: 200.w,
                                height: 50.h,
                                child: Text(
                                  revdata[index].review.toString(),
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                    itemCount: revdata.length,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
