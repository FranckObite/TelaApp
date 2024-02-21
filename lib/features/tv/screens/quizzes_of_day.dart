import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tela_mobile/common/theme/app_font.dart';
import 'package:tela_mobile/constant/api_manager.dart';
import 'package:tela_mobile/features/tv/screens/quiz_screen.dart';

import '../../models/quiz.dart';

class QuizzesOfDay extends StatefulWidget {
  const QuizzesOfDay({super.key});

  static const String routeName = '/quizzes-of-day';

  @override
  State<QuizzesOfDay> createState() => _QuizzesOfDayState();
}

class _QuizzesOfDayState extends State<QuizzesOfDay> {
  List<Quiz>? quizzes = [];
  bool quizIsClose = false;
  bool loadingData = true;

  void fetchQuizzesOfDay() async {
    Map<String, dynamic>? response =
        await ApiManager.fetchGet(uri: "quizzes-of-day");

    if (response!['status'] && response['message'] != null) {
      setState(() {
        quizIsClose = true;
        quizzes = null;
      });
    } else if (response['status'] && response['data'] != null) {
      List<Quiz> dayQuizzes = [];
      for (Map<String, dynamic> quiz in response['data']) {
        dayQuizzes.add(Quiz.fromMap(quiz));
      }

      if (dayQuizzes.isEmpty) {
        setState(() {
          loadingData = false;
        });
      } else {
        setState(() {
          quizzes = dayQuizzes;
          loadingData = false;
        });
      }
    }
  }

  @override
  void initState() {
    fetchQuizzesOfDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste des questions du jour",
          style: AppFont.appBarTextStyle(),
        ),
      ),
      body: Center(
          child: quizIsClose
              ? Text(
                  "Le jeux n'est plus disponible pour aujourd'hui 😎.",
                  textAlign: TextAlign.center,
                  style: AppFont.font().copyWith(fontSize: 18),
                )
              : loadingData
                  ? const CircularProgressIndicator.adaptive()
                  : quizzes!.isEmpty
                      ? const Text('Aucune question disponible pour le moment.')
                      : Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 22,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  top: height * 10,
                                  left: 10,
                                  right: 10,
                                  bottom: height * 5),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.info,
                                    color: Colors.white,
                                    size: 30.sp,
                                  ),
                                  Text(
                                    "Un quiz fonctionne en posant une série de questions aux participants, qui doivent y répondre pour évaluer leurs connaissances sur un sujet spécifique. Les réponses correctes sont ensuite comptabilisées pour déterminer le score final.",
                                    textAlign: TextAlign.justify,
                                    style: AppFont.font().copyWith(
                                        color: Colors.white, fontSize: 13.sp),
                                  )
                                ],
                              ),
                            ),
                            for (Quiz quiz in quizzes!)
                              Container(
                                height: height * 13,
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Navigator.pushNamed(
                                        context, QuizScreen.roouteName,
                                        arguments: {
                                          "quiz_id": quiz.id,
                                          "quiz_no": quizzes!.indexOf(quiz) + 1
                                        }),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Center(
                                          child: Text(
                                        "Q${quizzes!.indexOf(quiz) + 1} : ${quiz.question}",
                                        textAlign: TextAlign.center,
                                        style: AppFont.font().copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        )),
    );
  }
}
