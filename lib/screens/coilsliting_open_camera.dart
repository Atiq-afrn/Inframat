import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CoilslitingOpenCamera extends StatefulWidget {
  const CoilslitingOpenCamera({super.key});

  @override
  State<CoilslitingOpenCamera> createState() => _CoilslitingOpenCameraState();
}

class _CoilslitingOpenCameraState extends State<CoilslitingOpenCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width * 1,
                child: MobileScanner(onDetect: (barcodes) {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
