import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Bloc/banner_bloc.dart';
import 'package:stylish/Bloc/categories_bloc.dart';
import 'package:stylish/Bloc/popularprdct_bloc.dart';
import 'package:stylish/Repository/modelclass/BannerModelClass.dart';
import 'package:stylish/Repository/modelclass/CategoriesModelClass.dart';
import 'package:stylish/Repository/modelclass/PopularprdctModelClass.dart';
import 'package:stylish/ui/product%20page.dart';

import '../Bloc/rcomndedprdct_bloc.dart';
import '../Repository/modelclass/RecommendedprdctModelClass.dart';
import 'categories.dart';
import 'orders.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

late List<BannerModelClass> data;
late List<RecommendedprdctModelClass> recdata;
late List<CategoriesModelClass> categoriesdata;
late List<PopularprdctModelClass> popularprdctdata;

class _homeState extends State<home> {
  @override
  void initState() {
    BlocProvider.of<BannerBloc>(context).add(FetchBanner());
    super.initState();
    BlocProvider.of<CategoriesBloc>(context).add(FetchCategories());
    super.initState();
    BlocProvider.of<PopularprdctBloc>(context).add(FetchPopularprdct());
    super.initState();
    BlocProvider.of<RcomndedprdctBloc>(context).add(FetchRcomndedprdct());
    super.initState();
  }

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
                    padding: EdgeInsets.only(left: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => orders()));
                      },
                      child: Icon(
                        Icons.card_travel,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
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
                "Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat"),
              ),
            ),
            SizedBox(
              height: 120.h,
              child: BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesStateLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoriesStateError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (state is CategoriesStateLoaded) {
                    categoriesdata = BlocProvider.of<CategoriesBloc>(context)
                        .categoriesModelClass;
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 15.w, top: 20.h),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => categories(
                                          name: categoriesdata[index]
                                              .name
                                              .toString(),
                                        )));
                              },
                              child: CircleAvatar(
                                radius: 35.r,
                                backgroundImage: NetworkImage(
                                    categoriesdata[index].image.toString()),
                              ),
                            ),
                            Text(
                              categoriesdata[index].name.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat"),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5.w,
                        );
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
            BlocBuilder<BannerBloc, BannerState>(
              builder: (context, state) {
                if (state is BannerStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BannerStateError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (state is BannerStateLoaded) {
                  data = BlocProvider.of<BannerBloc>(context).bannerModelClass;
                  return CarouselSlider.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Stack(children: [
                      Container(
                        child: Image.network(
                          data[itemIndex].image.toString(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 35.h),
                              child: Text(
                                "50-40% OFF",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Text(
                                "Now in (product)",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Text(
                                "All colours",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Container(
                                width: 100.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border:
                                        Border.all(color: Color(0xffFFFFFF)),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.w),
                                        child: Text(
                                          "Shop Now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.w),
                                        child: Icon(
                                          size: 16,
                                          CupertinoIcons.arrow_right,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            Text(
              "Popular Products",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat"),
            ),
            SizedBox(
              height: 250.h,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, top: 10.h),
                child: BlocBuilder<PopularprdctBloc, PopularprdctState>(
                  builder: (context, state) {
                    if (state is PopularprdctStateLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is PopularprdctStateError) {
                      return Center(
                        child: Text("No Connection"),
                      );
                    }
                    if (state is PopularprdctStateLoaded) {
                      popularprdctdata =
                          BlocProvider.of<PopularprdctBloc>(context)
                              .popularprdctModelClass;

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularprdctdata.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => productdetails(
                                        img: popularprdctdata[index]
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
                                            .toString(),
                                      )));
                            },
                            child: Container(
                              width: 170.w,
                              height: 241.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: double.infinity,
                                      height: 124.h,
                                      child: Image.network(
                                          popularprdctdata[index]
                                              .images!
                                              .first
                                              .toString())),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: SizedBox(
                                      width: 162.w,
                                      height: 16.h,
                                      child: Text(
                                        popularprdctdata[index]
                                            .productName
                                            .toString(),
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
                                        popularprdctdata[index]
                                            .description
                                            .toString(),
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
                                        "\$ ${popularprdctdata[index].productPrice.toString().toString()}",
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
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.w),
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
                                        ),
                                      ],
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
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 5.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),
            Text(
              "Recomended Products",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat"),
            ),
            SizedBox(
              height: 250.h,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, top: 10.h),
                child: BlocBuilder<RcomndedprdctBloc, RcomndedprdctState>(
                  builder: (context, state) {
                    if (state is RcomndedprdctStateLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is RcomndedprdctStateError) {
                      return Center(
                        child: Text("No Connection"),
                      );
                    }
                    if (state is RcomndedprdctStateLoaded) {
                      recdata = BlocProvider.of<RcomndedprdctBloc>(context)
                          .recommendedprdctModelClass;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: recdata.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => productdetails(
                                      img: recdata[index]
                                          .images!
                                          .first
                                          .toString(),
                                      description:
                                          recdata[index].description.toString(),
                                      title:
                                          recdata[index].productName.toString(),
                                      price: recdata[index]
                                          .productPrice
                                          .toString())));
                            },
                            child: Container(
                              width: 170.w,
                              height: 241.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: double.infinity,
                                      height: 124.h,
                                      child: Image.network(recdata[index]
                                          .images!
                                          .first
                                          .toString())),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: SizedBox(
                                      width: 162.w,
                                      height: 16.h,
                                      child: Text(
                                        recdata[index].productName.toString(),
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
                                        recdata[index].description.toString(),
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
                                        "\$ ${recdata[index].productPrice.toString()}",
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
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 5.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
