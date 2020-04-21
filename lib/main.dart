import 'package:flutter/material.dart';

import 'MessageList.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email App',
      theme: ThemeData(primarySwatch: Colors.green, accentColor: Colors.red),
      home: MessageList(title: 'Flutter Demo Home Page'),
    );
  }
}

