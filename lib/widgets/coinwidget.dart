// ignore_for_file: prefer_const_constructors

import 'package:coinrich/Services/api.dart';
import 'package:flutter/material.dart';

import '../Helpers/constants.dart';

class CoinWidgets extends StatelessWidget {
  const CoinWidgets({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        'Coin',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                      Text(
                        'data',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  onPressed: () async {
                    // var response = await BaseClient().get('/coin');
                    fetchData();
                  },
                  child: Text('data',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'data',
                          style: TextStyle(
                            color: Colors.grey,
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
                          '4',

                          // response data.toString(),
                          style: TextStyle(
                            color: Colors.grey,
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
  }
}
