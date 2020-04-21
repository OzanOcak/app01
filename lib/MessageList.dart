import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;

import 'Message.dart';


class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);
  
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
 List<dynamic> messages =  const [];

 Future loadMessageList() async{
    //String content = await rootBundle.loadString('data/messages.json');

    http.Response response = await http.get('http://www.mocky.io/v2/5e9f81d32d00004a00cb7bec');
    String content= response.body;
    List collection= json.decode(content);
    List <Message> _messages = collection.map((json)=> Message.fromJson(json)).toList();


    setState(() {
      messages = _messages;
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
            title: Text(message.subject),
            leading:CircleAvatar(
              child:Text("PJ"),
            ),
            subtitle: Text(
              message.body,
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