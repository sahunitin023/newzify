import 'dart:convert';

import 'package:newzify/features/home/models/article_model.dart';
import 'package:newzify/features/home/models/request_query.dart';
import 'package:newzify/services/crud_api.dart';
import 'package:newzify/utility/constants.dart';

class HomeRepo {
  static Future<List<ArticleModel>> getTopHeadlines(
      RequestQuery requestQuery) async {
    var response = await CrudApi.getRequest({
      'country': requestQuery.country,
      'q': requestQuery.query,
      'category': requestQuery.category,
      'apiKey': NEWSAPI_KEY,
    });
    if (response != null) {
      List<ArticleModel> listOfPosts =
          articleModelListFromJson(jsonEncode(response));
      return listOfPosts;
    } else {
      return [];
    }
  }
}
