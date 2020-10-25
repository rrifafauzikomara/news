import 'package:flutter/material.dart';

class FavoriteNewsPage extends StatelessWidget {
  static const routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Center(
        child: Text('Favorite'),
      ),
    );
  }
}
