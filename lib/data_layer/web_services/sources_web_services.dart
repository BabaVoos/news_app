import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_news_app/core/strings.dart';

import '../models/sources_model.dart';

class SourcesWebServices {
  static Future<SourcesModel> getSources(String category) async {
    var url = Uri.https(AppStrings.baseUrl, AppStrings.allSources, {
      'apiKey': AppStrings.apiKey,
      'category': category,
    });
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      SourcesModel sourcesModel = SourcesModel.fromJson(jsonResponse);
      print(jsonResponse);
      return sourcesModel;
    } else {
      print(
        'There is an error when getting the resources',
      );
      return SourcesModel();
    }
  }
}
