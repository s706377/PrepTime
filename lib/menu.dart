import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Menu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('foo'),
      ),
    );
  }
}
