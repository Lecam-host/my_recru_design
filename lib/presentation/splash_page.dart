import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/core/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  nextPage() {
    Timer(const Duration(seconds: 3), () {
      context.go(PageName.onboardingPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(SvgIconConstants.splash1, height: 150),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset(SvgIconConstants.splash2, height: 150),
            ),
            Positioned(
              bottom: 200,
              left: 70,
              child: SvgPicture.asset(SvgIconConstants.splash2, height: 50),
            ),
            Positioned(
              top: 290,
              right: 70,
              child: SvgPicture.asset(SvgIconConstants.splash1, height: 100),
            ),
            Center(
              child: SvgPicture.asset(SvgIconConstants.appIcon, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
