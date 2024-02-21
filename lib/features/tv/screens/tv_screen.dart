import 'package:flutter/material.dart';
// import 'package:tela_mobile/common/theme/pallete.dart';
import 'package:tela_mobile/features/tv/screens/quizzes_of_day.dart';
import 'package:tela_mobile/features/tv/screens/video_player_screen.dart';

import '../../../common/theme/app_font.dart';
import '../../../common/theme/pallete.dart';

import 'tela_pub.dart';
import 'tela_rediffusion.dart';
import 'tela_sport.dart';

class TVScreen extends StatefulWidget {
  const TVScreen({super.key});

  static const String routeName = "/tela-tv";

  @override
  State<TVScreen> createState() => _TVScreenState();
}

class _TVScreenState extends State<TVScreen> {
  bool currentUserAlreadyAnswerToQuiz = false;

  // void quizAlreadyAnswer() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // String? answerQuizId = sharedPreferences.getString("answered_quiz_id");
  //   String? expireDate = sharedPreferences.getString("expire_date");
  //   setState(() {
  //     currentUserAlreadyAnswerToQuiz = expireDate != null
  //         ? DateTime.now().day == DateTime.parse(expireDate).day
  //         : false;
  //   });
  // }

  @override
  void initState() {
    // quizAlreadyAnswer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tela TV',
          style: AppFont.appBarTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: Column(
            children: [
              Container(
                height: heigh * 15,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff693a8e),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/quiz_bg.png"))),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, QuizzesOfDay.routeName);
                    },
                    borderRadius: BorderRadius.circular(15),
                    // child: Stack(
                    //   alignment: AlignmentDirectional.bottomStart,
                    //   children: [
                    //     Container(
                    //       height: 60,
                    //       width: double.infinity,
                    //       decoration: const BoxDecoration(
                    //         color: Pallete.lightBlackColor,
                    //         borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(15),
                    //           bottomRight: Radius.circular(15),
                    //         ),
                    //       ),
                    //       child: const Text(
                    //         "Description du Quiz",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                ),
              ),
              Container(
                height: heigh * 30,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/tela_pub.png")),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, TelaPubScreen.routeName),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          height: heigh * 12,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Pallete.lightBlackColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Tela Pub',
                            style: AppFont.font().copyWith(
                                color: Pallete.whiteColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: heigh * 30,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/tela_original.png")),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, VideoPlayerScreen.routeName),
                    // child: Stack(
                    //   alignment: AlignmentDirectional.bottomStart,
                    //   children: [
                    //     Container(
                    //       height: heigh * 12,
                    //       width: double.infinity,
                    //       padding: const EdgeInsets.all(10),
                    //       decoration: const BoxDecoration(
                    //         color: Pallete.lightBlackColor,
                    //         borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(15),
                    //           bottomRight: Radius.circular(15),
                    //         ),
                    //       ),
                    //       child: Text(
                    //         'Tela Original',
                    //         style: AppFont.font().copyWith(
                    //             color: Pallete.whiteColor,
                    //             fontSize: 17,
                    //             fontWeight: FontWeight.w600),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                ),
              ),
              Container(
                height: heigh * 30,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/tela_sport.jpeg")),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, TelaSportScreen.routeName),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          height: heigh * 12,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Pallete.lightBlackColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Tela Sport',
                            style: AppFont.font().copyWith(
                                color: Pallete.whiteColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: heigh * 30,
              //   width: double.infinity,
              //   margin: const EdgeInsets.only(top: 10),
              //   decoration: BoxDecoration(
              //     image: const DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage("assets/images/tela_redu.jpg")),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: const Material(
              //     color: Colors.transparent,
              //     child: InkWell(
              //         // onTap: () => Navigator.pushNamed(
              //         //     context, VideoPlayerScreen.routeName),
              //         // child: Stack(
              //         //   alignment: AlignmentDirectional.bottomStart,
              //         //   children: [
              //         //     Container(
              //         //       height: heigh * 12,
              //         //       width: double.infinity,
              //         //       padding: const EdgeInsets.all(10),
              //         //       decoration: const BoxDecoration(
              //         //         color: Pallete.lightBlackColor,
              //         //         borderRadius: BorderRadius.only(
              //         //           bottomLeft: Radius.circular(15),
              //         //           bottomRight: Radius.circular(15),
              //         //         ),
              //         //       ),
              //         //       child: Text(
              //         //         'Tela Rédifusion',
              //         //         style: AppFont.font().copyWith(
              //         //             color: Pallete.whiteColor,
              //         //             fontSize: 17,
              //         //             fontWeight: FontWeight.w600),
              //         //       ),
              //         //     )
              //         //   ],
              //         // ),
              //         ),
              //   ),
              // ),

              Container(
                height: heigh * 30,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/tela_redu.jpg")),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, TelaRediffusionScreen.routeName),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          height: heigh * 12,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Pallete.lightBlackColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Tela Rediffusion',
                            style: AppFont.font().copyWith(
                                color: Pallete.whiteColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
