import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

part 'Message.g.dart';


@JsonSerializable()
class Message{
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String,dynamic>json) => _$MessageFromJson(json);

     static browse() async{
        http.Response response = await http.get('http://www.mocky.io/v2/5e3854163100005a00d38157');

        await Future.delayed(Duration(seconds:3));
        String content= response.body;
        List collection = json.decode(content);
        List <Message> _messages = collection.map((json)=> Message.fromJson(json)).toList();

        return _messages;
     }    
} 