import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/provider/punch_out_provider.dart';
import 'package:inframat/screens/facerecognise2.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

import 'package:provider/provider.dart';

class Punchout extends StatefulWidget {
  const Punchout({super.key});

  @override
  State<Punchout> createState() => _PunchoutState();
}

class _PunchoutState extends State<Punchout> {
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
          Center(
            child:
                selectedImage != null
                    ? Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(selectedImage),
                          ),
                        ),
                      ),
                    )
                    : SizedBox(height: 20),
          ),

          SizedBox(height: 30),
          IconButton(
            onPressed: () {
              getPunchOutImage();
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Facerecognize2(selectedImage: selectedImage,base64image:base64image ,),
                ),
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
                    "Punch Out",
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

  dynamic selectedImage;
  String? base64image;
  Future<void> getPunchOutImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      selectedImage = File(pickedImage!.path);
    });

    if (selectedImage != null) {
      List<int> imageByte = await selectedImage.readAsBytes();
      base64image = base64Encode(imageByte);

      AppStorage.storepunchOutImage(base64image!);
    } else {
      print("error 7777");
    }
  }
}
