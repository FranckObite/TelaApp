// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tela_mobile/common/theme/app_font.dart';
import 'package:tela_mobile/common/theme/pallete.dart';
import 'package:tela_mobile/features/home/screen/home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static const String routeName = '/onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool? onboardingIsView;

  void navigateToHomeScreen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("onboarding_is_view", true);

    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  }

  void checkOnboardingView() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool? isView = sharedPreferences.getBool("onboarding_is_view");

    if (isView != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    } else {
      setState(() {
        onboardingIsView = false;
      });
    }
  }

  @override
  void initState() {
    checkOnboardingView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height * .01;
    double width = MediaQuery.of(context).size.width * .01;
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: heigh * 12, horizontal: 10),
          child: onboardingIsView != null && onboardingIsView == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tela, l'application qui vous fait gagner de l'argent",
                      textAlign: TextAlign.center,
                      style: AppFont.font().copyWith(fontSize: 20.sp),
                    ),
                    Image.asset(
                      "assets/images/drawer_bg.png",
                    ),
                    SizedBox(
                      height: heigh * 8,
                      width: width * 80,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Pallete.gradientSecondColor),
                          onPressed: () => navigateToHomeScreen(),
                          child: Text(
                            'Accéder',
                            style: AppFont.buttonTextStyle(),
                          )),
                    )
                  ],
                )
              : const Center(child: CircularProgressIndicator.adaptive())),
    );
  }
}
