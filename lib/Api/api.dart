import 'dart:convert';

import 'package:gym_project/Model/exercise.dart';
import 'package:http/http.dart' as http;

class Api {
  static String rapid_key =
      "84d31b5d54msh9120e64135a6d09p1bd354jsn0f2a55d40ed8";
  String upperarms =
      "https://exercisedb.p.rapidapi.com/exercises/bodyPart/upper%20arms?rapidapi-key=84d31b5d54msh9120e64135a6d09p1bd354jsn0f2a55d40ed8";
  String lowerarms =
      "https://exercisedb.p.rapidapi.com/exercises/bodyPart/lower%20arms?rapidapi-key=84d31b5d54msh9120e64135a6d09p1bd354jsn0f2a55d40ed8";

  static Future<List<Exercise>> getUpperArms(String url) async {
    List<Exercise> exercises_q = [];
    http.Response response = await http.get(Uri.parse(url));
    var dataDecoded = jsonDecode(response.body);
    for (var item in dataDecoded) {
      exercises_q.add(Exercise(
          bodyPart: item["bodyPart"],
          gifUrl: item["gifUrl"],
          id: item["id"],
          equipment: item["equipment"],
          target: item["target"],
          name: item["name"]));
    }

    print(dataDecoded);
    return exercises_q;
  }
}
