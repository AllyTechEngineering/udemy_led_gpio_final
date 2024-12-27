// TODO: Import Packages
import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class LedService {
 
 late GPIO gpio16;

  void initGpio16Output() {
    try {
      gpio16 = GPIO(16, GPIOdirection.gpioDirOut);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
  
  void gpio16OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio16.write(outputValue);
  }

      void disposeGpio() {
    gpio16.dispose();
  }
  
}
