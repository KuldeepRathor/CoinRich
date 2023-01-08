// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_field

import 'package:coinrich/Helpers/constants.dart';
import 'package:coinrich/Services/api.dart';
import 'package:coinrich/model/model.dart';
import 'package:coinrich/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Coin> coin;

  @override
  void initState() {
    coin = fetchData();

    super.initState();
  }
  // String percentChange = snapshot.data.data.btc.quote.usd.percentChange24H;

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
        backgroundColor: secondaryColor,
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
                        Image(
                          image: AssetImage(
                            'assets/icons/pie-chart.png',
                          ),
                          height: size.height * 0.03,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'Show Chart',
                          style: TextStyle(
                            color: primaryColor,
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
                          ' 1',
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
              FutureBuilder<Coin>(
                  future: coin,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: size.height * 0.17,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          snapshot.data.data.btc.name,
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 24,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        arrow(),
                                        Text(
                                          '${snapshot.data.data.btc.quote.usd.percentChange24H.toString().substring(0, 5)}%',
                                          style: TextStyle(
                                            color: tertiaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              tertiaryColor),
                                    ),
                                    onPressed: () async {
                                      // var response = await BaseClient().get('/coin');
                                      fetchData();
                                    },
                                    child:
                                        Text('${snapshot.data.data.btc.symbol}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Price',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.03,
                                          ),
                                          Text(
                                            snapshot
                                                .data.data.btc.quote.usd.price
                                                .toString()
                                                .substring(0, 8),
                                            style: TextStyle(
                                              color: tertiaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Rank',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.03,
                                          ),
                                          Text(
                                            " ${snapshot.data.data.btc.cmcRank}",

                                            // response data.toString(),
                                            style: TextStyle(
                                              color: tertiaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// FutureBuilder<Coin>(
//                   future: coin,
//                   builder: (BuildContext context, AsyncSnapshot snapshot) {
//                     if (snapshot.hasData) {
//                       return Container(
//                         height: size.height * 0.17,
//                         width: size.width * 0.9,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           snapshot.data.data.btc.name,
//                                           style: TextStyle(
//                                             color: primaryColor,
//                                             fontSize: 24,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: size.width * 0.03,
//                                         ),
//                                         arrow(),
//                                         Text(
//                                           '${snapshot.data.data.btc.quote.usd.percentChange24H.toString().substring(0, 5)}%',
//                                           style: TextStyle(
//                                             color: tertiaryColor,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   TextButton(
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all(
//                                               tertiaryColor),
//                                     ),
//                                     onPressed: () async {
//                                       // var response = await BaseClient().get('/coin');
//                                       fetchData();
//                                     },
//                                     child:
//                                         Text('${snapshot.data.data.btc.symbol}',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             )),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             'Price',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: size.width * 0.03,
//                                           ),
//                                           Text(
//                                             snapshot
//                                                 .data.data.btc.quote.usd.price
//                                                 .toString()
//                                                 .substring(0, 8),
//                                             style: TextStyle(
//                                               color: tertiaryColor,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             'Rank',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: size.width * 0.03,
//                                           ),
//                                           Text(
//                                             " ${snapshot.data.data.btc.cmcRank}",

//                                             // response data.toString(),
//                                             style: TextStyle(
//                                               color: tertiaryColor,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 45,
//                                       width: 45,
//                                       decoration: BoxDecoration(
//                                         color: primaryColor,
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                       child: Icon(
//                                         Icons.arrow_forward,
//                                         size: 30,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     } else {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   }),
