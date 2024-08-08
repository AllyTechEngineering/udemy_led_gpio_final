import 'package:flutter/material.dart';

//TODO: Import the led_service.dart file
import 'package:udemy_led_gpio/led_service/led_service.dart';

class LedScreen extends StatefulWidget {
  const LedScreen({super.key});

  @override
  State<LedScreen> createState() => _LedScreenState();
}

class _LedScreenState extends State<LedScreen> {
  //TODO: Create an instance of the LedService class
final LedService ledService = LedService();
  //TODO: Call the initGpio16Output method in the initState method
  @override
  void initState() {
    ledService.initGpio16Output();
    super.initState();
  }

  //TODO: Call the disposeGpio method in the dispose method
  @override
  void dispose() {
    ledService.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Create a Scaffold widget
    return Scaffold(
      //TODO: Add an AppBar widget
      appBar: AppBar(
        title: const Text('Udemy Led GPIO'),
        centerTitle: true,
      ),
      //TODO: Add a Center widget
      body: Center(
        //TODO: Add a Column widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: Add the getElevatedButtonLedOn method
            getElevatedButtonLedOn(),
            const SizedBox(height: 20),
            //TODO: Add the getElevatedButtonLedOff method
            getElevatedButtonLedOff(),
          ],
        ),
      ),
    );
  }
//TODO: Create the getElevatedButtonLedOn method
  Widget getElevatedButtonLedOn() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          ledService.gpio16OutputLevel(true);
        });
      },
      child: const Text(
        'GPIO16 High LED On',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
//TODO: Create the getElevatedButtonLedOff method
  Widget getElevatedButtonLedOff() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          ledService.gpio16OutputLevel(false);
        });
      },
      child: const Text(
        'GPIO16 Low LED Off',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
}