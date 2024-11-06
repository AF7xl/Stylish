import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';

class intro extends StatefulWidget {
  const intro({super.key});

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      pages: [
        PageViewModel(
            image: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: SizedBox(
                width: 300.w,
                height: 300.h,
                child: Image.asset(
                  "assets/intro1.png",
                ),
              ),
            ),
            title: "Choose Products",
            body:
                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
        PageViewModel(
            image: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: SizedBox(
                width: 300.w,
                height: 300.h,
                child: Image.asset(
                  "assets/intro1.png",
                ),
              ),
            ),
            title: "Make Payment",
            body:
                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit"),
        PageViewModel(
            image: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: SizedBox(
                width: 300.w,
                height: 300.h,
                child: Image.asset(
                  "assets/intro1.png",
                ),
              ),
            ),
            title: "Get Your Order",
            body:
                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit")
      ],
      showBackButton: false,
      showNextButton: true,
      back: const Icon(Icons.arrow_back),
      done: const Text(
        "Get Started",
        style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xffF83758)),
      ),
      next: const Text(
        "Next",
        style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xffF83758)),
      ),
      showSkipButton: true,
      onSkip: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => login()));
      },
      onDone: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => login()));
      },
    );
  }
}
