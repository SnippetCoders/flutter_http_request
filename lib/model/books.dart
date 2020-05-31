import 'base_model.dart';

class BooksModel extends BaseModel {
  String categoryId;
  String categoryName;
  List<Books> books;

  BooksModel({this.categoryId, this.categoryName, this.books});

  @override
  fromJson(Map<String, dynamic> json) {    
    this.categoryId = json["CategoryID"].toString();
    this.categoryName = json["CategoryName"];
    this.books = (json['Books'] as List).map((i) => Books.fromJson(i)).toList();
  }
}

class Books {
  final int id;
  final String bookTitle;

  Books({this.id, this.bookTitle});

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(id: json["ID"], bookTitle: json['BookTitle']);
  }
}
