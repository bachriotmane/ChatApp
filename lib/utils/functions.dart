import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

pushReplacementTopage(page, BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

enum TypeError { ERROR, WARNING, SUCCESS, INFO }

showMyDialog(
    BuildContext context, TypeError type, String info, String description) {
  AwesomeDialog(
    context: context,
    dialogType: type == TypeError.INFO
        ? DialogType.info
        : type == TypeError.ERROR
            ? DialogType.error
            : type == TypeError.SUCCESS
                ? DialogType.success
                : type == TypeError.WARNING
                    ? DialogType.warning
                    : DialogType.noHeader,
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.scale,
    title: info,
    desc: description,
    showCloseIcon: true,
    btnOkOnPress: () {},
  ).show();
}
