import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shimmer/shimmer.dart';

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
      debugShowCheckedModeBanner: false,
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
  bool _enabled = true;

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
            print(jsonList);
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _enabled = false;
            });
                });
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

    if (_enabled == true){
      print("123456");
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
    Shimmer.fromColors(
    baseColor: Colors.grey.shade400,
    highlightColor: Colors.green.shade300,
    enabled: true,
    //period: const Duration(seconds: 5),
    direction : ShimmerDirection.ltr,
    loop: 0,
    child: ListView.builder(
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
    //isThreeLine: true,
    ));
    }
    ),
    ),
    );
    }else{
      print("78910");
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
    //isThreeLine: true,
    ));
    }
    ),
    );
    }
  }
}