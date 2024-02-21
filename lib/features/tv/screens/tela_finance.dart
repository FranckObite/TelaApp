import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();

class TelaFinance extends StatefulWidget {
  const TelaFinance({super.key});
  static const String routeName = "/tela_finance";

  @override
  State<TelaFinance> createState() => _TelaFinanceState();
}

class _TelaFinanceState extends State<TelaFinance> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      /*  appBar: AppBar(
        title: Text("data"),
      ), */
      backgroundColor: Colors.lightBlueAccent,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/drawer_bg-removebg-preview.png",
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: (obscureText)
                                    ? const Icon(Icons.remove_red_eye_sharp)
                                    : const Icon(Icons.visibility_off)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  "Mot de passe oublier?",
                                  style: TextStyle(fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
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
                              'Connexion',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
