import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Firebase',
            style: TextStyle(color: Colors.pinkAccent)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text('Anda berhasil Login'),
      ),
    );
  }
}
