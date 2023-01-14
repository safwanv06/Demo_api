import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  String? a;

  getdata() async {
    Response res =
        await get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    setState(() {
      a = jsonDecode(res.body)['message'];
      print(a);
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: a==null?CircularProgressIndicator(color: Colors.blue,backgroundColor: Colors.lightBlue,):Container(
            child: Column(children: [
              Image(image: NetworkImage(a!), height: 200, width: 200),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getdata();
                    });
                  },
                  child: Text('Change'))
            ]),
          ),
        ),
      ),
    );
  }
}
// 'https://api.ipify.org?format=json'
// 'https://ipinfo.io/$a/geo'
