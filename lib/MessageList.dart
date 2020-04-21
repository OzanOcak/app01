import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);
  
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
 List<dynamic> messages =  const [];

 Future loadMessageList() async{
    String content = await rootBundle.loadString('data/messages.json');
    List collection= json.decode(content);

    setState(() {
      messages = collection;
    });
 }

 @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (BuildContext context, int index)=>Divider(),
        itemBuilder: (BuildContext context, int index) {
          var message=messages[index];

          return ListTile(
            title: Text(message["subject"]),
            leading:CircleAvatar(
              child:Text("PJ"),
            ),
            subtitle: Text(
              message["body"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              ),
            isThreeLine: true,
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
} // TODO Implement this library.