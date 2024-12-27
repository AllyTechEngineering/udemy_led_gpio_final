import 'package:flutter/material.dart';
import 'package:udemy_led_gpio/led_screen/led_button.dart';
import 'package:udemy_led_gpio/led_service/led_service.dart';

class LedScreen extends StatefulWidget {
  const LedScreen({super.key});

  @override
  State<LedScreen> createState() => _LedScreenState();
}

class _LedScreenState extends State<LedScreen> {
  final LedService ledService = LedService();
  @override
  void initState() {
    ledService.initGpio16Output();
    super.initState();
  }

  @override
  void dispose() {
    ledService.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Udemy Led GPIO'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LedButton(buttonText: 'LED ON', buttonLevel: true)
                .getElevatedButtonLedOn(setState, ledService),
                const SizedBox(height: 20),
            LedButton(buttonText: 'LED Off', buttonLevel: false)
                .getElevatedButtonLedOn(setState, ledService),
          ],
        ),
      ),
    );
  }
}
