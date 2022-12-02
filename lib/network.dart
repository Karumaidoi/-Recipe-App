import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:recipe/model.dart';

class ApiService {
  static Future<List<RecipesModel>> getRecipesData() async {
    String baseUrl =
        "https://forkify-api.herokuapp.com/api/v2/recipes?search=pizza";
    try {
      var res = await http.get(Uri.parse(baseUrl));

      if (res.statusCode == 200) {
        List jsonResponse = jsonDecode(res.body)["data"]["recipes"];
        return jsonResponse.map((data) => RecipesModel.fromJson(data)).toList();
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<RecipeModel> getRecipeData(String id) async {
    String baseUrl = "https://forkify-api.herokuapp.com/api/v2/recipes/$id";
    try {
      var res = await http.get(Uri.parse(baseUrl));
      print(res.body);
      if (res.statusCode == 200) {
        return RecipeModel.fromJson(jsonDecode(res.body)['data']['recipe']);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
