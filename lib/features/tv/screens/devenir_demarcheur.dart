import 'package:flutter/material.dart';

class DevenirDemarcheur extends StatefulWidget {
  const DevenirDemarcheur({super.key});
  static const String routeName = "/devenir_demarcheur";

  @override
  State<DevenirDemarcheur> createState() => _DevenirDemarcheurState();
}

class _DevenirDemarcheurState extends State<DevenirDemarcheur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devenir demarcheur"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Nous démarrons bientôt"),
      ),
    );
  }
}
