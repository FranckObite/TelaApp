import 'package:flutter/material.dart';
import 'package:tela_mobile/features/models/quiz_answer.dart';
import 'package:tela_mobile/features/onboarding/screens/onboarding_screen.dart';
import 'package:tela_mobile/features/tv/screens/devenir_demarcheur.dart';
import 'package:tela_mobile/features/tv/screens/payment_screen.dart';
import 'package:tela_mobile/features/tv/screens/player_info.dart';
import 'package:tela_mobile/features/tv/screens/quiz_screen.dart';
import 'package:tela_mobile/features/tv/screens/tela_immobilier.dart';
import 'package:tela_mobile/features/tv/screens/trouver_bureau_screen.dart';
import 'package:tela_mobile/features/tv/screens/trouver_maison_screen.dart';
import 'package:tela_mobile/features/tv/screens/tv_screen.dart';
import 'package:tela_mobile/features/tv/screens/video_player_screen.dart';

import '../features/home/screen/home_screen.dart';
import '../features/tv/screens/quizzes_of_day.dart';
import '../features/tv/screens/tela_finance.dart';
import '../features/tv/screens/tela_pub.dart';
import '../features/tv/screens/tela_rediffusion.dart';
import '../features/tv/screens/tela_sport.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Onboarding.routeName:
      return MaterialPageRoute(
          builder: (BuildContext context) => const Onboarding());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case TVScreen.routeName:
      return MaterialPageRoute(
          builder: (BuildContext context) => const TVScreen());
    case QuizScreen.roouteName:
      return MaterialPageRoute(
          builder: (context) => QuizScreen(
                quizData: settings.arguments as Map<String, int>,
              ));
    case PaymentScreen.routeName:
      return MaterialPageRoute(
          builder: (context) =>
              PaymentScreen(data: settings.arguments as Map<String, dynamic>));
    case VideoPlayerScreen.routeName:
      return MaterialPageRoute(builder: (context) => const VideoPlayerScreen());
    case PlayerInfo.routeName:
      return MaterialPageRoute(
          builder: (context) =>
              PlayerInfo(answer: settings.arguments as QuizAnswer));
    case QuizzesOfDay.routeName:
      return MaterialPageRoute(builder: (context) => const QuizzesOfDay());
    case TelaPubScreen.routeName:
      return MaterialPageRoute(builder: (context) => const TelaPubScreen());
    case TelaSportScreen.routeName:
      return MaterialPageRoute(builder: (context) => const TelaSportScreen());
    case DevenirDemarcheur.routeName:
      return MaterialPageRoute(builder: (context) => const DevenirDemarcheur());
    case TrouverUneMaison.routeName:
      return MaterialPageRoute(builder: (context) => const TrouverUneMaison());
    case TrouverUnBureau.routeName:
      return MaterialPageRoute(builder: (context) => const TrouverUnBureau());
    case TelaImmobilier.routeName:
      return MaterialPageRoute(builder: (context) => const TelaImmobilier());
    case TelaFinance.routeName:
      return MaterialPageRoute(builder: (context) => const TelaFinance());
    case TelaPubScreen.routeName:
      return MaterialPageRoute(builder: (context) => const TelaPubScreen());
    case TelaSportScreen.routeName:
      return MaterialPageRoute(builder: (context) => const TelaSportScreen());
    case TelaRediffusionScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const TelaRediffusionScreen());
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      );
  }
}
