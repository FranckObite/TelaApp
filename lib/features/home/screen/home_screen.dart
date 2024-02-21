import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tela_mobile/common/theme/app_font.dart';
import 'package:tela_mobile/common/theme/pallete.dart';
import 'package:tela_mobile/features/home/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int carouselActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    // double width = MediaQuery.of(context).size.width * .01;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/drawer_bg.png",
          fit: BoxFit.cover,
          width: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              // fit: StackFit.expand,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CarouselSlider(
                  items: [
                    Image.asset(
                      "assets/images/remplacant_slide1.jpeg",
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      "assets/images/remplacant_slide2.jpeg",
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      "assets/images/remplacant_slide3.jpeg",
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      "assets/images/remplacant_slide4.jpeg",
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      "assets/images/remplacant_slide5.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ],
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          carouselActiveIndex = index;
                        });
                      },
                      viewportFraction: 1,
                      height: height * 45,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3)),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AnimatedSmoothIndicator(
                        effect: const WormEffect(
                            dotWidth: 7,
                            dotHeight: 7,
                            activeDotColor: Pallete.gradientSecondColor,
                            dotColor: Colors.white),
                        activeIndex: carouselActiveIndex,
                        count: 7),
                  ),
                )
              ],
            ),
            // Column(
            //   children: [
            //     Text("Bienvenu sur Tela",
            //         style: AppFont.font()
            //             .copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
            //     Text("Choisissez votre rubrique",
            //         style: AppFont.font()
            //             .copyWith(fontSize: 20, fontWeight: FontWeight.w600))
            //   ],
            // ),
            Container(
              height: height * 13,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/tela_tv.png")),
                  // color: Pallete.telaRedColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Tela TV",
                  style: AppFont.font().copyWith(
                      color: Pallete.whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
