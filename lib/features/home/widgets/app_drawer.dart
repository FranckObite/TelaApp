import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tela_mobile/common/theme/app_font.dart';
import 'package:tela_mobile/features/tv/screens/tela_finance.dart';
import 'package:tela_mobile/features/tv/screens/tela_immobilier.dart';

import 'package:tela_mobile/features/tv/screens/tv_screen.dart';

import '../../tv/screens/devenir_demarcheur.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: height * 38,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/drawer_bg.png"))),
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.houseUser,
                  size: 25,
                ),
                title: Text(
                  'Acceuil',
                  style: AppFont.menuTextStyle(),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, DevenirDemarcheur.routeName),
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.solidBuilding,
                  size: 25,
                ),
                title: Text(
                  'Tela Immobilier',
                  style: AppFont.menuTextStyle(),
                ),

                /* trailing: DropdownButton<String>(
                    //value: 'Devenir démarcheur',
                    //isExpanded: true,
                    items: <String>[
                      "Devenir démarcheur",
                      'Trouver une maison',
                      'Trouver un bureau'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (newValue) {
                      if (newValue == 'Devenir démarcheur') {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context, DevenirDemarcheur.routeName);
                      } else if (newValue == 'Trouver une maison') {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context, TrouverUneMaison.routeName);
                      } else if (newValue == 'Trouver un bureau') {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, TrouverUnBureau.routeName);
                      }
                    }), */
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, TelaImmobilier.routeName);
                },
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.coins,
                  size: 25,
                ),
                title: Text(
                  'Tela Finances',
                  style: AppFont.menuTextStyle(),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, TelaFinance.routeName);
                },
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.tv,
                  size: 25,
                ),
                title: Text(
                  'Tela TV',
                  style: AppFont.menuTextStyle(),
                ),
                onTap: () => Navigator.pushNamed(context, TVScreen.routeName),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Center(
              child: Text(
                "Tela V 1.0",
                style: AppFont.menuTextStyle().copyWith(fontSize: 13),
              ),
            ),
          )
        ],
      ),
    );
  }
}
