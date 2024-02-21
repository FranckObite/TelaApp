import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tela_mobile/common/theme/app_font.dart';
import 'package:tela_mobile/common/theme/pallete.dart';

import 'package:tela_mobile/features/tv/screens/payment_screen.dart';

import '../../../constant/api_manager.dart';
import '../../../constant/app_constant.dart';
import '../../models/quiz_answer.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.quizData});
  final Map<String, int> quizData;
  static const String roouteName = '/quiz';

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? quizOfTheDay;
  List<QuizAnswer>? answers = [];
  int? choice;
  int luckFactor = 1;
  int amount = AppConstact.quizPlayAmount;

  void fetchQuiz() async {
    try {
      Map<String, dynamic>? response = await ApiManager.fetchGet(
          uri: "quiz-of-day?quiz_id=${widget.quizData['quiz_id']}");

      if (response!['status']) {
        final data = response['data'];
        if (data.runtimeType != List) {
          List<QuizAnswer> quizAnswers = [];
          for (Map<String, dynamic> answer in data['answers']) {
            quizAnswers.add(QuizAnswer.fromMap(answer));
          }

          setState(() {
            quizOfTheDay = data['question'];
            quizAnswers.shuffle();
            answers = quizAnswers;
          });
        } else {
          setState(() {
            answers = null;
          });
        }
      } else {
        setState(() {
          quizOfTheDay = '';
          answers = null;
        });
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  void incrementLuckFactor() {
    setState(() {
      luckFactor++;
      amount += AppConstact.quizPlayAmount;
    });
  }

  void decrementLuckFactor() {
    if (luckFactor > 1) {
      setState(() {
        luckFactor--;
        amount -= AppConstact.quizPlayAmount;
      });
    }
  }

  @override
  void initState() {
    fetchQuiz();
    super.initState();
  }

  void userChoice(int uChoice) {
    setState(() {
      choice = uChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Question du jour N°${widget.quizData['quiz_no']}",
          style: AppFont.appBarTextStyle(),
        ),
      ),
      body: Center(
        child: answers == null
            ? Text(
                'Désolé, aucune question disponible actuellement ...',
                textAlign: TextAlign.center,
                style: AppFont.font().copyWith(fontSize: 16),
              )
            : quizOfTheDay != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            quizOfTheDay!,
                            style: AppFont.font().copyWith(
                                fontSize: 20, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          for (QuizAnswer answer in answers!)
                            Container(
                              height: 65,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () =>
                                      userChoice(answers!.indexOf(answer)),
                                  borderRadius: BorderRadius.circular(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${(answers!.indexOf(answer) + 1).toString()} - ",
                                        style: AppFont.font().copyWith(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        answer.answer,
                                        style: AppFont.font().copyWith(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      if (answers!.indexOf(answer) == choice)
                                        const Padding(
                                          padding: EdgeInsets.only(left: 50),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircleCheck,
                                            color: Colors.white,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 15),
                            child: const Divider(
                              color: Pallete.gradientSecondColor,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Augmentez votre change de gagner",
                              style: AppFont.font().copyWith(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Pallete.gradientSecondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: decrementLuckFactor,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: AppFont.font().copyWith(
                                            color: Pallete.whiteColor,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                luckFactor.toString(),
                                style: AppFont.font().copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                    color: Pallete.gradientSecondColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: incrementLuckFactor,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: AppFont.font().copyWith(
                                            color: Pallete.whiteColor,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Coût Total : $amount Fcfa",
                            style: AppFont.font().copyWith(fontSize: 15),
                          )
                        ],
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Pallete.gradientSecondColor,
                          ),
                          onPressed: () {
                            if (choice == null) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Veuillez reponse à la question avant soumission de votre réponse");
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, PaymentScreen.routeName, arguments: {
                                "amount": amount,
                                "luck_factor": luckFactor,
                                "answer": answers![choice!]
                              });
                            }
                          },
                          child: Text(
                            'Valider ma reponse',
                            style: AppFont.buttonTextStyle(),
                          ),
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
