import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://babacolis.com/livreur";

  static int livreurId = 0;

  static Future<Map> login(String tel, String pass) async {
    final url = Uri.parse("$baseUrl/login_livreur.php");

    final response = await http.post(url, body: {
      "telephone": tel,
      "mot_de_passe": pass,
    });

    final data = jsonDecode(response.body);

    if (data["success"] == true) {
      livreurId = data["livreur"]["id"];
    }

    return data;
  }

  static Future<Map?> getCourse() async {
    final url = Uri.parse("$baseUrl/get_course.php");

    final response = await http.post(url);
    final data = jsonDecode(response.body);

    return data;
  }

  static Future<void> updatePosition(double lat, double lng) async {
    final url = Uri.parse("$baseUrl/update_position.php");

    await http.post(url, body: {
      "livreur_id": livreurId.toString(),
      "lat": lat.toString(),
      "lng": lng.toString(),
    });
  }

  static Future<void> updateCourseStatus(int courseId, String statut) async {
    final url = Uri.parse("$baseUrl/update_course_status.php");

    await http.post(url, body: {
      "course_id": courseId.toString(),
      "statut": statut,
    });
  }

  static Future<List> getHistorique() async {
    final url = Uri.parse("$baseUrl/get_historique.php");

    final response = await http.post(url);
    final data = jsonDecode(response.body);

    if (data["success"] == true) {
      return data["historique"];
    }

    return [];
  }
}
