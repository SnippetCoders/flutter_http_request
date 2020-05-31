import 'dart:convert';
import 'package:flutter_http_request/model/base_model.dart';
import 'package:flutter_http_request/model/books.dart';

import 'package:http/http.dart' as http;

class WebService {
  Future<BaseModel> getData(String url, BaseModel baseModel) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      baseModel.fromJson(json.decode(response.body));
      return baseModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<BooksModel> fetchBooks() async {
    String URL = 'http://www.iSharpeners.com/books.txt';

    final serviceResponse = await WebService().getData(URL, new BooksModel());

    return serviceResponse;
  }
}
