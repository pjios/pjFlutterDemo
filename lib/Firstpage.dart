import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyFirstPage(),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  var jsonList;
  @override
  void initState() {
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          .get('https://protocoderspoint.com/jsondata/superheros.json');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['superheros'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              //Navigator.of(context).pop(),
          Navigator.of(context, rootNavigator: true).pop(context),
        ),
        title: Text(
          'ListView',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:
      ListView.builder(
          itemCount: jsonList == null ? 0 : jsonList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.network(
                      jsonList[index]['url'],
                      fit: BoxFit.fill,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  title: Text(jsonList[index]['name']),
                  subtitle: Text(jsonList[index]['power']),
                ));
          }),
    );
  }
}