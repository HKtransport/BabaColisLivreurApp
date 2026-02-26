import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map livreur;

  const ProfileScreen({super.key, required this.livreur});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom : ${livreur['nom']}"),
            Text("Téléphone : ${livreur['telephone']}"),
            Text("Solde : ${livreur['solde']} FCFA"),
          ],
        ),
      ),
    );
  }
}
