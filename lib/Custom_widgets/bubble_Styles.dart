// ignore_for_file: camel_case_types

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class bubble_Styles {
  static BubbleStyle styleSomebody = const BubbleStyle(
    nip: BubbleNip.leftCenter,
    color: Colors.white,
    borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );

  static BubbleStyle styleMe = const BubbleStyle(
    nip: BubbleNip.rightCenter,
    color: Color.fromARGB(255, 225, 255, 199),
    borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );
}
