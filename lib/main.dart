import 'package:flutter/material.dart';
import 'package:flutter_http_request/model/books.dart';
import 'package:flutter_http_request/service/webservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Request',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Snippet Coder - Http Request")),
        body: Center(child: Container(child: _fetchData())));
  }

  Widget _fetchData() {
    return FutureBuilder<BooksModel>(
        future: WebService().fetchBooks(),
        builder: (BuildContext context, AsyncSnapshot<BooksModel> bookModel) {
          if (bookModel.hasData) {
            return _listView(bookModel.data);
          }

          return CircularProgressIndicator();
        });
  }

  Widget _listView(BooksModel model) {
    return ListView(
      children: <Widget>[
        _buildHeader(model.categoryName),
        ListView.separated(            
            itemCount: model.books.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildRow(model.books[index]);
            },
            separatorBuilder: (context, index) {
              return Divider();
            }
        )
      ],
    );
  }

  Widget _buildRow(Books bookModel) {
    return ListTile(title: new Text(bookModel.bookTitle));
  }

  Widget _buildHeader(String text) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Text(text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))));
  }
}
