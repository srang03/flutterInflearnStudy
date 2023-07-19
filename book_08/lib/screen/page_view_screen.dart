import 'dart:async';

import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}
class _PageViewScreenState extends State<PageViewScreen> {
  final PageController pageController = PageController();
  final iLastIndex = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      print('hello');

      int? iPage = pageController.page?.toInt();
      if(iPage == null) return;

      if(iPage < iLastIndex){
        iPage += 1;
      }
      else{
        iPage = 0;
      }
      pageController.animateToPage(iPage, duration: Duration(milliseconds: 300), curve: Curves.linear);

    });
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [1,2,3].map((e) => Image.asset('asset/img/img_$e.jpg', fit: BoxFit.cover)).toList(),
      controller: pageController,
    );
  }
}
