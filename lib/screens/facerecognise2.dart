import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/provider/punch_out_provider.dart';
import 'package:inframat/screens/barcode_scanner.dart';
import 'package:inframat/screens/dashboard.dart';
import 'package:inframat/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class Facerecognize2 extends StatefulWidget {
  Facerecognize2({super.key , required this.selectedImage});
  dynamic selectedImage; 

  @override
  State<Facerecognize2> createState() => _Facerecognize2State();
}

class _Facerecognize2State extends State<Facerecognize2> {
  int connectionId = 0;
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
                    image: DecorationImage(image: FileImage(widget.selectedImage)),
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
              Provider.of<PunchOutProvider>(context, listen: false)
                  .getPunchOut()
                  .then((value) {
                    print("Punch Out success");
                  })
                  .then((values) {
                    openAlertDialoge();
                    splashScreen1();
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

  void splashScreen1() async {
    await Future.delayed(Duration(seconds: 1), () {
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
                    "shivansh Sharma",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sale Executive",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Appcolor.deepPurple,
                      ),
                      Text(
                        "Punch in at  09:00 am  |  09 Apr 2024",
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
                        "1/5 Sec-A Omax City, Sharda Nagar ,",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    " Extention,Lucknow, Uttar Pradesh, 226002, India",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
