import 'package:flutter/material.dart';

class TrouverUneMaison extends StatefulWidget {
  const TrouverUneMaison({super.key});
  static const String routeName = "/trouver_maison_screen";

  @override
  State<TrouverUneMaison> createState() => _TrouverUneMaisonState();
}

class _TrouverUneMaisonState extends State<TrouverUneMaison> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trouver une maison"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Encours de téléchargement"),
      ),
    );
  }
}
