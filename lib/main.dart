import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _counter = 0;

  void increment()=> _counter++;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('my app')),
      body:Center(
        child:Text("$_counter",style: TextStyle(fontSize: 18.0),),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          setState(() {
            increment();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}