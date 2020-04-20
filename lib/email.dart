import 'package:flutter/material.dart';

class EmailApp extends StatelessWidget {   // warning : all variables of statless widget must be immutable(final)

  final title;

  EmailApp({this.title});

  var  messages = [];

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
                subtitle: Text(message['body'],maxLines: 2,overflow: TextOverflow.ellipsis),
              );
        }, 
        separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      ),
    );
  }
}