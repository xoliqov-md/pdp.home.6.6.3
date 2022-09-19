import 'package:flutter/material.dart';

import 'package:untitled5/models/response_model.dart';
import 'package:untitled5/models/post_model.dart';
import 'api_service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    String user = 'null';

  void _apiPostUser(){
    Post post = Post(userId: 1, title: 'Azizbek', body: 'asdjhaskjdkgjgfadhj fshjdgfkhjsgfa');
    ApiService.POST(ApiService.GET_API, ApiService.paramsPost(post)).then((value) => {
      setState((){
        user = value!;
      })
    });
  }

  @override
  void initState() {
    _apiPostUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(user),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
