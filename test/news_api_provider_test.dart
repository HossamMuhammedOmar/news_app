import 'package:flutter_test/flutter_test.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('fetchTopIds function return a list of ids', () async {
    // step of test case
    final newsApi = new NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();
    // expectation
    expect(ids, [1, 2, 3, 4]);
  });

  test("fetchItems function return a item model", () async {
    final newsApi = new NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode({'id': 123}), 200);
    });

    final item = await newsApi.fetchItems(999);

    expect(item.id, 123);
  });
}
