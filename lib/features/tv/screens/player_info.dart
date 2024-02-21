// ignore_for_file: use_build_context_synchronously

import "dart:convert";
import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:tela_mobile/common/theme/app_font.dart";
import "package:tela_mobile/common/theme/pallete.dart";
import "package:tela_mobile/features/models/quiz_answer.dart";
import "package:tela_mobile/features/tv/screens/tv_screen.dart";

class PlayerInfo extends StatefulWidget {
  const PlayerInfo({super.key, required this.answer});
  final QuizAnswer answer;
  static const String routeName = "player-info";

  @override
  State<PlayerInfo> createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    fullnameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void submitQuizAnswer({required int answerId, required int quizId}) async {
    if (fullnameController.text.isEmpty || phoneNumberController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Veuillez remplir le formulaire de soumettre.");
      return;
    }

    Dio dio = Dio();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Response response =
        await dio.post("http://192.168.1.5:8000/api/v1/store-answer", data: {
      "player_fullname": fullnameController.text,
      "player_phone_number": phoneNumberController.text,
      "answer_id": answerId
    });

    if (response.statusCode == 200 && response.data['status']) {
      // store answer question id
      final String? ids = sharedPreferences.getString('answered_quiz_id');
      final String? expireDate = sharedPreferences.getString('expire_date');

      if (ids == null || expireDate == null) {
        sharedPreferences.setString("answered_quiz_id", "[$quizId]");
        sharedPreferences.setString(
            "expire_date", DateTime.now().toIso8601String());
      } else {
        DateTime expire = DateTime.parse(expireDate);
        if (DateTime.now().isAfter(expire)) {
          sharedPreferences.setString("answered_quiz_id", "[$quizId]");
          sharedPreferences.setString(
              "expire_date", DateTime.now().toIso8601String());
        } else {
          List<int> id = jsonDecode(ids);
          id.add(quizId);

          sharedPreferences.setString("answered_quiz_id", id.toString());
        }
      }

      Navigator.pushNamedAndRemoveUntil(
          context, TVScreen.routeName, (route) => false);
    } else {
      Fluttertoast.showToast(
          msg:
              "Une erreur c'est produite lors du traitement, veuillez réessayer plutard.");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Valider votre reponse",
          style: AppFont.appBarTextStyle(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: height * 7),
        child: Column(
          children: [
            Text(
              "Veuillez entrer vos information pour valider votre reponse",
              textAlign: TextAlign.center,
              style: AppFont.font()
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: height * 5,
            ),
            Container(
              height: height * 8,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(13)),
              child: TextField(
                cursorHeight: 25,
                style: AppFont.font().copyWith(fontSize: 18),
                cursorColor: Pallete.whiteColor,
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 20),
                  hintText: "Nom et Prénom(s)",
                  hintStyle: AppFont.font().copyWith(),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 8,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(13)),
              child: TextField(
                cursorHeight: 25,
                style: AppFont.font().copyWith(fontSize: 18),
                cursorColor: Pallete.whiteColor,
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 20),
                  hintText: "Numéro de téléphone",
                  hintStyle: AppFont.font().copyWith(),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: height * 6,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.gradientSecondColor),
                  onPressed: () => submitQuizAnswer(
                      answerId: widget.answer.id, quizId: widget.answer.quizId),
                  child: Text(
                    'Valider',
                    style: AppFont.buttonTextStyle(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
