import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/models/quality_check_model.dart';
import 'package:inframat/provider/quality_check_provider.dart';
import 'package:inframat/screens/coil_slitting_screen.dart';
import 'package:provider/provider.dart';

class Invard4 extends StatefulWidget {
  const Invard4({super.key, this.pieces});
  final String? pieces;
  @override
  State<Invard4> createState() => _Invard4State();
}

class _Invard4State extends State<Invard4> {
  int initialValus = 0;
  dynamic selectedImage;

  bool isPhotoAddButtonVisible = false;

  List<File> myDocs = [];
  List<String> myBase64images = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.pieces;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        title: Text("Quality Check"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Vendor Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      size: 14,
                      Icons.check,
                      color: Appcolor.whitecolor,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: Appcolor.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      size: 14,
                      Icons.info_outline_rounded,
                      color: Appcolor.whitecolor,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20),
                Text("Gate Entry"),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "Quality",
                    style: TextStyle(color: Appcolor.deepPurple),
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * .1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [Text("pices: ${widget.pieces}")]),
            ),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                border: Border.all(color: Appcolor.greycolor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("No Of Coil"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .85,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Appcolor.greycolor),
                        ),
                        color: Appcolor.lightgrey2,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                "  Pieces ${widget.pieces} ",
                                //{myDocs.length}
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPhotoAddButtonVisible = true;
                                  });
                                },
                                icon:
                                    myDocs.length >= 6
                                        ? Container()
                                        : Icon(Icons.add),
                              ),
                              Container(
                                height: 30,
                                width: 0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Appcolor.greycolor),
                                ),
                              ),
                              SizedBox(height: 10),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    myDocs.removeLast();
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: myDocs.length + 1,
                      itemBuilder: (BuildContext context, index) {
                        if (index == myDocs.length) {
                          return Visibility(
                            visible: isPhotoAddButtonVisible,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    "Coil ${myDocs.length} (Testing Doc))",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Container(
                                    height: 56,
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    color: Appcolor.lightgrey2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                onAddCLick();
                                              },
                                              child: Container(
                                                height: 35,
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    .4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: Appcolor.greycolor,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text("Take a Picture"),
                                                    Icon(
                                                      Icons.camera_alt_outlined,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Text("No file Choosen"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return Column(
                          children: [
                            Text("Coil-${myDocs.length} (Testing)"),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width * .8,
                                decoration: BoxDecoration(
                                  color: Appcolor.lightgrey,
                                ),
                                child: Image.file(myDocs[index]),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          await Provider.of<QualityCheckProvider>(
            context,
            listen: false,
          ).gettingQualityCheck(myBase64images).then((value) {
            print("value is ${value}");
            if (value!.status == "success") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoilSlittingScreen()),
              );
              print("images added");
            } else {
              print("navigation failed");
            }
          });
        },
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * .9,
          decoration: BoxDecoration(
            color: Appcolor.deepPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Appcolor.whitecolor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? qualityCheckImagebase64;
  onAddCLick() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (pickedImage != null) {
      File imagepath = File(pickedImage.path);
      List<int> imagebyte = await imagepath.readAsBytes();

      qualityCheckImagebase64 = base64Encode(imagebyte);
      setState(() {
        selectedImage = imagepath;
        myDocs.add(selectedImage);
        myBase64images.add(qualityCheckImagebase64!);
        isPhotoAddButtonVisible = false;
      });
      print("880 ${qualityCheckImagebase64}");
    } else {
      print("No file selected");
    }
  }
}
