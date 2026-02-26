import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HistoriqueScreen extends StatefulWidget {
  const HistoriqueScreen({super.key});

  @override
  State<HistoriqueScreen> createState() => _HistoriqueScreenState();
}

class _HistoriqueScreenState extends State<HistoriqueScreen> {
  List historique = [];

  loadData() async {
    final data = await ApiService.getHistorique();
    setState(() => historique = data);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historique")),
      body: ListView.builder(
        itemCount: historique.length,
        itemBuilder: (_, i) {
          final c = historique[i];
          return ListTile(
            title: Text("${c['depart']} → ${c['arrivee']}"),
            subtitle: Text("Gain : ${c['gain_livreur']} FCFA"),
          );
        },
      ),
    );
  }
}
