import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Bloc/cat_bloc.dart';
import 'package:stylish/Repository/modelclass/CatModelClass.dart';
import 'package:stylish/ui/product%20page.dart';

class categories extends StatefulWidget {
  String name;

  categories({super.key, required this.name});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  late List<CatModelClass> catdata;

  @override
  void initState() {
    BlocProvider.of<CatBloc>(context).add(Fetchcat(name: widget.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: EdgeInsets.only(left: 10.w),
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
                    "categories",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 15.h),
            child: Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: BlocBuilder<CatBloc, CatState>(
              builder: (context, state) {
                if (state is CatStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CatStateError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (state is CatStateLoaded) {
                  catdata = BlocProvider.of<CatBloc>(context).catmodelclass;
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    childAspectRatio: 170 / 241,
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    children: List.generate(
                      catdata.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => productdetails(
                                      img: catdata[index].images!.first.toString(),
                                      description:
                                          catdata[index].description.toString(),
                                      title:
                                          catdata[index].productName.toString(),
                                      price: catdata[index]
                                          .productPrice
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
                                        catdata[index].images!.first.toString())),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.h),
                                  child: SizedBox(
                                    width: 162.w,
                                    height: 16.h,
                                    child: Text(
                                      catdata[index].productName.toString(),
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
                                      catdata[index].description.toString(),
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
                                      "\$ ${catdata[index].productPrice.toString()}",
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
                    ),
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
