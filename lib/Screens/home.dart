// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:coinrich/Api/api.dart';
import 'package:flutter/material.dart';

import '../widgets/coinwidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    var response = fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('CoinRich',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        backgroundColor: Color(0xff363333),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.pie_chart_outline_rounded,
                          color: Colors.amberAccent,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'Show Chart',
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Count:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'data',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder(
                  future: fetchData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return CoinWidgets(size: size);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Coin {
  String name;
  String price;
  String rank;

  Coin({
    required this.name,
    required this.price,
    required this.rank,
  });
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      price: json['price'],
      rank: json['rank'],
    );
  }
}
