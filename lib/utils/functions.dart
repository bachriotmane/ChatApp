import 'package:flutter/material.dart';

pushReplacementTopage(page, BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
