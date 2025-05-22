import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/provider/punch_in_provider.dart';
import 'package:inframat/screens/facerecognize.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:provider/provider.dart';

class Punchnow extends StatefulWidget {
  const Punchnow({super.key});

  @override
  State<Punchnow> createState() => _PunchnowState();
}

class _PunchnowState extends State<Punchnow> {
  dynamic selectedImage;
  bool isLocationServiceEnabled = false;
  Future<void> getUserLocation() async {
    try {
      // Check if location services are enabled
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        print("Location services are disabled.");
        // Optionally, prompt the user to enable location services.
        return;
      }

      // Check for permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("Location permission denied.");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print("Location permission permanently denied.");

        return;
      }

      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      // Store location if valid
      AppStorage.storeLat(currentPosition.latitude.toString());
      AppStorage.storeLong(currentPosition.longitude.toString());

      print(
        "Location retrieved: ${currentPosition.latitude}, ${currentPosition.longitude}",
      );
    } catch (e) {
      print("Failed to get location: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .67,
            ),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Text(
            "Take Photo to Continue",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),

          SizedBox(height: 40),
          selectedImage != null
              ? Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(selectedImage)),
                    shape: BoxShape.circle,
                  ),
                ),
              )
              : SizedBox(height: 30),
          IconButton(
            onPressed: () {
              pickedImage();
            },
            icon: Icon(
              Icons.replay_circle_filled_outlined,
              size: 60,
              color: Appcolor.deepPurple,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .2),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Facerecognize(operatorImage: selectedImage,)),
              );
            },
            child: Container(
              height: 43,
              width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Appcolor.lightpurple,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.my_location_outlined, color: Appcolor.whitecolor),
                  SizedBox(width: 10),
                  Text(
                    "Punch in",
                    style: TextStyle(
                      color: Appcolor.whitecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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

  String? base64image;
  Future pickedImage() async {
    final picked = ImagePicker();
    final imageSource = await picked.pickImage(source: ImageSource.camera);

    setState(() {
      selectedImage = File(imageSource!.path);
    });

    if (selectedImage != null) {
      List<int> imageByte = await selectedImage.readAsBytes();
      base64image = base64Encode(imageByte);
      AppStorage.storeImageBase64(base64image!);
      print("base64==  $base64image");
      print("base64 conversion success");
    } else {
      print("error");
    }
  }
}
