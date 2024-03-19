import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_layout.dart';


class AppButton extends StatelessWidget {
  final Color boxColor;
  final String textButton;
  final VoidCallback onTap;
  double fontSize;

  AppButton(
      {Key? key,
        required this.boxColor,
        required this.textButton,
        required this.onTap,
        this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: boxColor, // foreground
      ),
      onPressed: () { onTap(); },
      child: Text(textButton, style: TextStyle(fontSize: fontSize == 20 ? 20 : fontSize)
      ),
    );
  }
}
