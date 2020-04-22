import 'package:flutter/material.dart';
import 'Message.dart';


class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);
  
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
 List<dynamic> messages =  const [];
 bool isLoading = true;


 Future loadMessageList() async{

    List <Message> _messages = await Message.browse();

    setState(() {
      messages = _messages;
    });
 }

 @override
  void initState() {
    loadMessageList();
    super.initState();
    isLoading=false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: isLoading ? Center(child: CircularProgressIndicator()) : ListView.separated(
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