// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:richpich/register/register1.dart';
import 'package:richpich/register/register2.dart';
import 'package:richpich/register/register3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainRegister extends StatefulWidget {
  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Register1(),
      Register2(),
      Register3(),
    ];

    void _nextPage() {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: _pages,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 80,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 40,
              child: TextButton(
                onPressed: _nextPage,
                child: Text('Next'),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 40,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              axisDirection: Axis.horizontal,
              effect: SwapEffect(),
            ),
          ),
        ),
      ],
    );
  }
}
