import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Club'),
      ),
      body: Center(
        child: Text('Club'),
      ),
    );
  }
}
