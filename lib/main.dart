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

class EmailApp extends StatelessWidget {   // warning : all variables of statless widget must be immutable(final)

  final title;

  EmailApp({this.title});

  var  messages = [
    {
    "subject":"title one",
    "body":"another text is very very long that will not fit in one line which is pretty hard to get there but possible"
    },
    {
    "subject":"title two",
    "body":"another text is very very long that will not fit in one line which is pretty hard to get there but possible"
    },
    {
    "subject":"title three",
    "body":"another text is very very long that will not fit in one line which is pretty hard to get there but possible"
    },
    {
    "subject":"title four",
    "body":"another text is very very long that will not fit in one line which is pretty hard to get there but possible"
    },
    {
    "subject":"title five",
    "body":"another text is very very long that will not fit in one line which is pretty hard to get there but possible"
    },
    {
    "subject":"title six",
    "body":"another text is very very long that will not fit in one line which is pretty hard to get there but possible"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title')),
      body:Center(
        child:ListView.separated(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index){
            var message = messages[index]; //get the map

              return ListTile(
                leading: CircleAvatar(child:Text("OO")),
                title: Text(message['subject']),
                isThreeLine: true,
                subtitle: Text(message['body']),
              );
        }, 
        separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      ),
    );
  }
}