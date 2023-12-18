import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_news_app/data_layer/models/news_data_model.dart';

import '../../core/strings.dart';

class EveryThingWebServices {
  static Future<NewsDatModel> getNewsData(String sourceId) async {
    var url = Uri.https(
      AppStrings.baseUrl,
      AppStrings.everything,
      {
        "apiKey": AppStrings.apiKey,
        "sources": sourceId,
      },
    );

    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(
        response.body,
      );
      NewsDatModel newsDatModel = NewsDatModel.fromJson(
        jsonResponse,
      );
      print(jsonResponse);
      return newsDatModel;
    } else {
      print(
        'there is an error on everything',
      );
      return NewsDatModel();
    }
  }

  static Future<NewsDatModel> getSearchData(
      String sourceId, String searchText) async {
    var url = Uri.https(
      AppStrings.baseUrl,
      AppStrings.everything,
      {
        "apiKey": AppStrings.apiKey,
        'q': searchText,
      },
    );
    var response = await http.get(
      url,
    );
    print(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(
        response.body,
      );
      NewsDatModel newsDatModel = NewsDatModel.fromJson(
        jsonResponse,
      );
      print(jsonResponse);
      return newsDatModel;
    } else {
      print(
        'there is an error on everything search',
      );
      return NewsDatModel();
    }
  }
}
