import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


bool gainLoss = true;

Widget arrow() {
  if (gainLoss) {
    return const Icon(
      Icons.arrow_upward_outlined,
      color: Colors.green,
    );
  } else {
    return const Icon(Icons.arrow_downward_outlined, color: Colors.red);
  }
}

