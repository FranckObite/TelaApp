import 'package:flutter/material.dart';

class TrouverUnBureau extends StatefulWidget {
  const TrouverUnBureau({super.key});
  static const String routeName = "/trouver_bureau_screen";

  @override
  State<TrouverUnBureau> createState() => _TrouverUnBureauState();
}

class _TrouverUnBureauState extends State<TrouverUnBureau> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trouver un bureau"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Encore de téléchargement"),
      ),
    );
  }
}
