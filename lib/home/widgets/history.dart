import 'package:flutter/material.dart';

class History extends StatelessWidget {
  History({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
      child: Center(child: Text("History")),
    );
  }
}