import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/data_model/qr_data_after_scanne.dart';
import 'package:inframat/models/qr_code_model.dart';
import 'package:inframat/provider/qr_scann_provider.dart';
import 'package:inframat/screens/dashboard.dart';
import 'package:inframat/screens/dashboard2.dart';
import 'package:inframat/screens/splash_screen.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String? qrcodedata;

  MobileScannerController scanController = MobileScannerController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scanController.dispose();
    qrcodedata;
  }

  void storeid(String machineid, String plantid, String siteid) async {
    print(machineid);
    await AppStorage.storemachineId(machineid);
    await AppStorage.storeplantId(plantid);
    await AppStorage.storesiteId(siteid);
    print("${machineid + plantid + siteid}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * .3),
          Text(
            "Scan QR Code ",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text("Align the QR code within "),
          Text(" frame to scan "),

          SizedBox(height: MediaQuery.of(context).size.width * .3),
          Center(
            child: Container(
              height: 246,
              width: MediaQuery.of(context).size.width * .6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: MobileScanner(
                controller: scanController,
                onDetect: (result) {
                  qrcodedata = result.barcodes.first.rawValue;
                  if (qrcodedata != null) {
                    setState(() {
                      qrcodedata = result.barcodes.first.rawValue;
                    });
                    scanController.stop();
                  }
                },
              ),
            ),
          ),
          qrcodedata != null
              ? Text(
                "${qrcodedata}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
              : Text(
                "Scan QR code to get  machine name",
                style: TextStyle(fontSize: 12),
              ),
          SizedBox(height: 23),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width * .65,
            decoration: BoxDecoration(
              color: Appcolor.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "your are allocated to this machine",
                style: TextStyle(color: Appcolor.whitecolor),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              Provider.of<QrScannProvider>(
                context,
                listen: false,
              ).getQrcodeData(qrcodedata!).then((value) {
                if (value != null) {
                  storeid(
                    value.machineId.toString(),
                    value.plantId.toString(),
                    value.siteId.toString(),
                  );
                  splashScreen2();
                  rightchecked();
                  print("87074");

                  print(
                    "AppStorage.gettingSiteId() ${AppStorage.gettingSiteId().toString()}",
                  );
                }
              });
            },
            child: Container(
              height: 42,
              width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Appcolor.deepPurple,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pause, color: Appcolor.whitecolor),
                  Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.whitecolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void splashScreen2() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard2()),
      );
    });
  }

  Future rightchecked() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  Text(
                    "Login Successful",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Icon(
                    Icons.check_circle_outline,
                    color: Appcolor.gcol,
                    size: 50,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
