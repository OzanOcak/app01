import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: EmailApp(title:'Email App'),   
    );
  }
}

class EmailApp extends StatelessWidget {

  final title;

  EmailApp({this.title});

  var messages =[
    'my titile',
    'more title',
    'a title',
    'happy be',
    'thing to think'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title')),
      body:Center(
        child:ListView.separated(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: CircleAvatar(child:Text("OO")),
                title: Text(messages[index]),
                isThreeLine: true,
                subtitle: Text("another text is very very long that will not fit in one line which is pretty hard to get there but possible"),
              );
        }, 
        separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      ),
    );
  }
}