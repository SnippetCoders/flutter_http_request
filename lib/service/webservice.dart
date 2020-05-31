import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/books.dart';
import '../model/base_model.dart';

class Webservice {
  Future<BaseModel> getData<T>(String url, BaseModel baseModel) async {
    final response = await http.get(url);
    if(response.statusCode == 200) {   
      baseModel.fromJson(json.decode(response.body));
      return baseModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<BooksModel> fetchBooks() async {
    
    String url = 'http://www.iSharpeners.com/books.txt';

    final serviceResponse = await Webservice().getData<BooksModel>(url, new BooksModel());

    return serviceResponse;
  }
}
