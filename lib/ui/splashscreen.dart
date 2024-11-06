import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Inropage.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const intro()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 350.h,left: 60.w),
            child: Row(
              children: [
                SizedBox(
                    width: 124.99.w,
                    height: 100.h,
                    child: Image.asset("assets/logo.png")),
                Text(
                  "Stylish",
                  style: TextStyle(
                      fontFamily: "Libre Caslon Text",
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffF83758)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
