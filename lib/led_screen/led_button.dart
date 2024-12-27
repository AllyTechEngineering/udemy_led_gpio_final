import 'package:flutter/material.dart';

class LedButton {
  final String buttonText;
  final bool buttonLevel;

  LedButton({required this.buttonText, required this.buttonLevel});

  Widget getElevatedButtonLedOn(Function setState, dynamic ledService) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          ledService.gpio16OutputLevel(buttonLevel);
        });
      },
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 50.0),
      ),
    );
  }
}