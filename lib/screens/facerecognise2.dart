import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/punchout_model.dart';
import 'package:inframat/provider/punch_out_provider.dart';
import 'package:inframat/screens/barcode_scanner.dart';
import 'package:inframat/screens/dashboard.dart';
import 'package:inframat/screens/splash_screen.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:provider/provider.dart';

class Facerecognize2 extends StatefulWidget {
  Facerecognize2({super.key, required this.selectedImage, this.base64image});
  dynamic selectedImage;
  dynamic base64image;

  @override
  State<Facerecognize2> createState() => _Facerecognize2State();
}

class _Facerecognize2State extends State<Facerecognize2> {
  // int connectionId = 0;
  Position? currentPosition;
  Future<void> getUserLocation() async {
    try {
      // Check if location services are enabled
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
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

      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      // Store location if valid
      AppStorage.storeLat(currentPosition!.latitude.toString());
      AppStorage.storeLong(currentPosition!.longitude.toString());

      print(
        "Location retrieved: ${currentPosition!.latitude}, ${currentPosition!.longitude}",
      );
    } catch (e) {
      print("Failed to get location: $e");
    }
  }

  // getting user location  by lat and long
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

  String? address;
  //String? formattedAddress;

  void getUserAddress() async {
    double lat = currentPosition!.latitude; // Your dynamic latitude
    double lng = currentPosition!.longitude; // Your dynamic longitude

    address = await getAddressFromLatLng(lat, lng);
    print("User Address: $address");
  }

  PunchOutModel? punchOutdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

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
            SizedBox(height: 50),
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
                    image: FileImage(widget.selectedImage),
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
                Provider.of<PunchOutProvider>(
                  context,
                  listen: false,
                ).getPunchOut(widget.base64image).then((value) {
                  if (value?.status == "success") {
                    punchOutdata = value;
                    AppStorage.removeUserIdandMachineId();
                    openAlertDialoge();
                    splashScreen1();
                    print("Punch Out success");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Center(
                          child: Text("PunchIn Record Not found "),
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
      ),
    );
  }

  void splashScreen1() async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    });
  }

  Future openAlertDialoge() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: Icon(Icons.check_circle, color: Colors.green, size: 40),
            title: Text(
              "Punch Out successful",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            content: Container(
              height: 300,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * .17,
                    backgroundImage: AssetImage(AppImages.punchinimage),
                  ),
                  Text(
                    "${punchOutdata?.data?.name}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${punchOutdata?.data?.role}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Appcolor.deepPurple,
                      ),
                      Text(
                        "Punch in at  ${punchOutdata?.data?.time}  |  ${punchOutdata?.data?.dateInfo}",
                        style: TextStyle(
                          fontSize: 14,
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
                      Text(
                        " ,",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${address}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
