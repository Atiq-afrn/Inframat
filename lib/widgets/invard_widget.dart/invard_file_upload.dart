import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class InvardFileUpload extends StatefulWidget {
  InvardFileUpload({super.key, this.ongettingImage});
  Function(String?)? ongettingImage;
  @override
  State<InvardFileUpload> createState() => _InvardFileUploadState();
}

class _InvardFileUploadState extends State<InvardFileUpload> {
  dynamic selectedImage;
  String? base64image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width * .85,
        color: Appcolor.lightgrey2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            selectedImage == null
                ? Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final picker = ImagePicker();
                        final pickedImage = await picker.pickImage(
                          source: ImageSource.camera,
                        );
                        if (pickedImage != null) {
                          File imagepath = File(pickedImage.path);
                          setState(() {
                            selectedImage = imagepath;
                          });
                          List<int> imageByte =
                              await selectedImage.readAsBytes();
                          base64image = base64Encode(imageByte);
                          print("87074  $base64image");
                          setState(() {
                            widget.ongettingImage?.call(base64image);
                          });
                          AppStorage.storeImageBase64(base64image!);
                        } else {
                          print("No file selected");
                        }
                      },
                      child: Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Appcolor.greycolor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Take a Picture"),
                            Icon(Icons.camera_alt_outlined),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text("No file Choosen"),
                  ],
                )
                : Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(selectedImage)),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
