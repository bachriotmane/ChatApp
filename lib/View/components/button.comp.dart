// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  
  String btnText;
  void Function()? onTap;
  MyBotton({
    Key? key,
    required this.btnText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.07,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              offset: Offset(2, 2),
              spreadRadius: 2)
        ], color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
