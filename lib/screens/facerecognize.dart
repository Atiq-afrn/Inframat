import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/punch_in_model.dart';
import 'package:inframat/provider/punch_in_provider.dart';
import 'package:inframat/screens/barcode_scanner.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:provider/provider.dart';

class Facerecognize extends StatefulWidget {
  Facerecognize({super.key, this.operatorImage, this.lat, this.log});
  File? operatorImage;
  double? lat;
  double? log;
  @override
  State<Facerecognize> createState() => _FacerecognizeState();
}

class _FacerecognizeState extends State<Facerecognize> {
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        String address =
            '${place.street}, '
            '${place.subLocality}, '
            '${place.locality}, '
            '${place.administrativeArea}, '
            '${place.postalCode}, '
            '${place.country}';

        return address;
      } else {
        return 'No address found';
      }
    } catch (e) {
      print('Error in reverse geocoding: $e');
      return 'Error retrieving address';
    }
  }

  PunchInModel? punchindata;
  String? address;
  //String? formattedAddress;

  void getUserAddress() async {
    double lat = widget.lat!; // Your dynamic latitude
    double lng = widget.log!; // Your dynamic longitude

    address = await getAddressFromLatLng(lat, lng);
    print("User Address: $address");
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 25),
            Container(
              height: 38,
              width: MediaQuery.of(context).size.width * 1,
              color: Appcolor.deepPurple,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    "Face Recognised",
                    style: TextStyle(color: Appcolor.whitecolor, fontSize: 27),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Take Photo to Continue",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),

            SizedBox(height: 40),
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(widget.operatorImage!),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            SizedBox(height: 30),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.replay_circle_filled_outlined,
                size: 60,
                color: Appcolor.deepPurple,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * .2),

            GestureDetector(
              onTap: () {
                Provider.of<PunchInProvider>(context, listen: false)
                    .getOperatorPunchIn(
                      widget.operatorImage!.toString(),
                      widget.lat.toString(),
                      widget.log.toString(),
                    )
                    .then((value) {
                      if (value != null) {
                        punchindata = value;
                        AppStorage.storeOperatorId(
                          value.data!.userId.toString(),
                        );
                        openAlertDialoge();

                        splashScreen1();
                        getUserAddress();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Center(
                              child: Text("you are already punch in "),
                            ),
                          ),
                        );
                      }
                    });
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
                    Icon(
                      Icons.my_location_outlined,
                      color: Appcolor.whitecolor,
                    ),
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
      ),
    );
  }

  void splashScreen1() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
      nextAlertDialoge();
    });
  }

  Future openAlertDialoge() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: Icon(Icons.check_circle, color: Colors.green, size: 40),
            title: Text(
              "Punch In successful",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            content: Container(
              height: 300,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * .17,
                    backgroundImage: FileImage(widget.operatorImage!),
                  ),
                  Text(
                    "${punchindata?.data?.name}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${punchindata?.data?.role}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Appcolor.deepPurple,
                      ),
                      Text(
                        "Punch in at  ${punchindata?.data?.time} |  ${punchindata?.data?.date}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_searching_outlined,
                        color: Appcolor.deepPurple,
                      ),
                    ],
                  ),
                  Text(
                    " ${address}",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Future nextAlertDialoge() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Appcolor.whitecolor,
            content: Container(
              height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 62,

                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Color(0xffFDF4FF),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Appcolor.deepPurple,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.bi1,
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      "Plant ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: Text(
                                  "Inframat pvt.ltd",
                                  style: TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Container(
                          height: 62,
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Color(0xffFDF4FF),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Appcolor.deepPurple,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.bi2,
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      "Site",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: Text(
                                  " Unit 1",
                                  style: TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 62,
                          // width: MediaQuery.of(context).size.width * .30,
                          decoration: BoxDecoration(
                            color: Color(0xffFDF4FF),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Appcolor.deepPurple,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.bi3,
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 1),
                                  Text(
                                    "Work Station",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Machine A",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Container(
                          height: 62,
                          //width: MediaQuery.of(context).size.width * .30,
                          decoration: BoxDecoration(
                            color: Color(0xffFDF4FF),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Appcolor.deepPurple,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppImages.plant4,
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "Shift-A",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "10:00 am to 6 pm",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "*Note",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarcodeScanner(),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        height: 42,
                        width: MediaQuery.of(context).size.width * .4,

                        decoration: BoxDecoration(
                          color: Appcolor.deepPurple,
                          borderRadius: BorderRadius.circular(7),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code,
                              color: Appcolor.whitecolor,
                              size: 20,
                            ),
                            SizedBox(width: 7),
                            Text(
                              "Scan QR",
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
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
