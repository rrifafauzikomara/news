import 'package:flutter/material.dart';

class FavoriteNewsPage extends StatelessWidget {
  final String title;

  const FavoriteNewsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
