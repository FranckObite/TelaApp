import 'package:flutter/material.dart';

import '../../models/model_immobilier.dart';

final formKey = GlobalKey<FormState>();

class TelaImmobilier extends StatefulWidget {
  const TelaImmobilier({super.key});
  static const String routeName = "/tela_immobilier";

  @override
  State<TelaImmobilier> createState() => _TelaImmobilierState();
}

class _TelaImmobilierState extends State<TelaImmobilier> {
  List<ImmobilierPage> mesTab = [
    ImmobilierPage(
        onglet: "    Devenir \nDémarcheur", page:  const DevenirDemarcheurPage()),
    ImmobilierPage(
        onglet: "   Trouver\nune Maison",
        page: const TrouverMaisonPage(
          title: 'Trouver une Maison',
          firstSwicth: 'Chambre',
        )),
    ImmobilierPage(
        onglet: "  Trouver\nun Bureau",
        page: const TrouverMaisonPage(
          title: 'Trouver un Bureau',
          firstSwicth: 'Magasin',
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: mesTab.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Tela immobilier",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            dividerColor: Colors.blue,
            indicatorColor: Colors.white,
            tabs: mesTab.map((e) => Tab(text: e.onglet)).toList(),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: mesTab.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}

class TrouverBureauPage extends StatelessWidget {
  const TrouverBureauPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Encours de téléchargement..."),
    );
  }
}

class TrouverMaisonPage extends StatefulWidget {
  const TrouverMaisonPage({
    super.key,
    required this.title,
    required this.firstSwicth,
  });
  final String title;
  final String firstSwicth;

  @override
  State<TrouverMaisonPage> createState() => _TrouverMaisonPageState();
}

class _TrouverMaisonPageState extends State<TrouverMaisonPage> {
  List<String> ville = [
    "Abidjan",
    'Bouaflé',
    'Bouake',
    'Daloa',
    'Toumodi',
    'Yamoussoukro',
  ];
  List<String> commune = [
    "Abobo",
    'Adjamé',
    'Anyama',
    'Atecoube',
    'Bassam',
    'Bingeville',
    'Cocody',
    'Dabou',
    'Koumassi',
    'Marcory',
    'Plateau',
    'Port-Bouet',
    'Songon',
    'Yopougon'
  ];
  bool chambreValue = true;
  bool studioValue = false;
  bool maisonBasseValue = false;
  bool appartemnetValue = false;
  bool duplexEtTriplexValue = true;
  bool habitatHautStandingSansPiscineValue = false;
  bool habitatHautStandingAvecPiscineValue = true;
  int nombreDePiece = 1;
  int nombre2Salledeau = 1;
  String? valueVille;
  String? valueCommune;

  @override
  Widget build(BuildContext context) {
    valueVille = ville.first;

    valueCommune = commune.first;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Ville",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Spacer(),
                DropdownButton<String>(
                    //hint: const Text('Sélectionnez une ville'),
                    value: valueVille,
                    items: ville
                        .map<DropdownMenuItem<String>>((String valueVille) {
                      return DropdownMenuItem<String>(
                          value: valueVille, child: Text(valueVille));
                    }).toList(),
                    onChanged: (newValue) {
                      print(newValue);
                      setState(() {
                        valueVille = newValue;
                      });
                      print(valueVille);
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Row(
              children: [
                const Text(
                  "Commune",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Spacer(),
                DropdownButton<String>(
                    value: valueCommune,
                    items: commune
                        .map<DropdownMenuItem<String>>((String valueCommune) {
                      return DropdownMenuItem<String>(
                          value: valueCommune, child: Text(valueCommune));
                    }).toList(),
                    onChanged: (newValue) {
                      print(newValue);
                      print(valueCommune);

                      setState(() {
                        valueCommune = newValue;
                      });
                      print(valueCommune);
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromARGB(255, 163, 205, 226),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SwicthRow(text: widget.firstSwicth, value1: chambreValue),
                    SwicthRow(text: 'Studio', value1: studioValue),
                    SwicthRow(text: 'Maison basse', value1: maisonBasseValue),
                    SwicthRow(text: 'Appartement', value1: appartemnetValue),
                    SwicthRow(
                        text: 'Duplex & Triplex', value1: duplexEtTriplexValue),
                    SwicthRow(
                        text: 'Habitat Haut Standing \n avec Piscine',
                        value1: habitatHautStandingAvecPiscineValue),
                    SwicthRow(
                        text: 'Habitat Haut Standing \n sans Piscine',
                        value1: habitatHautStandingSansPiscineValue),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20, top: 8.0, bottom: 8.0),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Nombre2PieceRow(
                        text: 'Nombre de pièce', nombre2Value: nombreDePiece),
                    const SizedBox(
                      height: 10,
                    ),
                    Nombre2PieceRow(
                        text: "Nombre de salle \nd'eau",
                        nombre2Value: nombre2Salledeau),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Text(
                          "Désolé vous ne pouvez pas vous connecter pour l'instant.",
                          style: TextStyle(fontSize: 17),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Fermer"))
                        ],
                      );
                    });
              },
              child: const Text(
                "Valider",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ],
      ),
    );
  }

  Row Nombre2PieceRow({required String text, required int nombre2Value}) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 20)),
        const Spacer(),
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 30, 168, 192),
          child: IconButton(
            onPressed: () {
              if (nombre2Value != 1) {
                setState(() {
                  nombre2Value--;
                });
              }
            },
            icon: const Icon(Icons.remove),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
              child: Text(
            nombre2Value.toString(),
            style: const TextStyle(fontSize: 20),
          )),
        ),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 30, 168, 192),
          child: IconButton(
            onPressed: () {
              setState(() {
                nombre2Value++;
              });
            },
            icon: const Icon(Icons.add),
          ),
        )
      ],
    );
  }

  Row SwicthRow({required bool value1, required String text}) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        const Spacer(),
        Switch(
          value: value1,
          onChanged: (newValue) {
            print(newValue);
            print(value1);
            setState(() {
              value1 == newValue; // Met à jour l'état du bouton
            });
            print(value1);
          },
        )
      ],
    );
  }
}

class DevenirDemarcheurPage extends StatefulWidget {
  const DevenirDemarcheurPage({
    super.key,
  });

  @override
  State<DevenirDemarcheurPage> createState() => _DevenirDemarcheurPageState();
}

class _DevenirDemarcheurPageState extends State<DevenirDemarcheurPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Creér un compte",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const Text(
                "Démarcheur",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Vous êtes déjà inscrite? Connectez-vous ici.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 50,
                  )),
              const SizedBox(
                height: 20,
              ),
              ModelTextfield(context, hintText: 'NOM', obscureText: false),
              const SizedBox(
                height: 20,
              ),
              ModelTextfield(context, hintText: 'PRENOMS', obscureText: false),
              const SizedBox(
                height: 20,
              ),
              ModelTextfield(context,
                  hintText: 'TELEPHONE', obscureText: false),
              const SizedBox(
                height: 20,
              ),
              ModelTextfield(context,
                  hintText: 'MOT DE PASSE', obscureText: true),
              const SizedBox(
                height: 20,
              ),
              ModelTextfield(context,
                  hintText: 'CONFIRMER MOT DE PASSE', obscureText: true),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Acceptez nos conditions d'utilisation",
                    style: TextStyle(color: Colors.white),
                  ),
                  Checkbox(
                      value: false,
                      onChanged: (newValue) {
                        setState(() {
                          newValue;
                        });
                      })
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                              "Désolé vous ne pouvez pas vous connecter pour l'instant.",
                              style: TextStyle(fontSize: 17),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Fermer"))
                            ],
                          );
                        });
                  },
                  child: const Text(
                    "s'Inscrire",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container ModelTextfield(BuildContext context,
      {required String hintText, required bool obscureText}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: TextFormField(
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
