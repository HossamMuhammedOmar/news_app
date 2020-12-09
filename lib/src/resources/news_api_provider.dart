import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:news/src/models/item_model.dart';

final _url = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider {
  Client client = new Client();

  fetchTopIds() async {
    final response = await client.get("$_url/topstories.json");
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItems(int id) async {
    final response = await client.get("$_url/item/$id.json");
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
// 2532
