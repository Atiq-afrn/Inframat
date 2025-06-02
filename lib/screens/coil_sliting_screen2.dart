import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/coil_slitting_response_model.dart';

import 'package:inframat/screens/coil_slitting_screen.dart';
import 'package:inframat/screens/dashboard.dart';
import 'package:inframat/screens/dashboard2.dart';
import 'package:inframat/screens/issue.dart';

class CoilSlitingScreen2 extends StatefulWidget {
  CoilSlitingScreen2({super.key, this.batchNo1, this.batchNo2, this.batchNo3});
  final CoilSlittingEntry? batchNo1;
  final CoilSlittingEntry? batchNo2;
  final CoilSlittingEntry? batchNo3;

  @override
  State<CoilSlitingScreen2> createState() => _CoilSlitingScreen2State();
}

class _CoilSlitingScreen2State extends State<CoilSlitingScreen2> {
  TextEditingController departmentcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        backgroundColor: Appcolor.whitecolor,
        title: Text("Coil slitting"),
        actions: [
          Container(
            height: 27,
            width: MediaQuery.of(context).size.width * .18,
            decoration: BoxDecoration(
              color: Appcolor.lightpurple,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Appcolor.lightpurple, width: 1),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "00:30 :55",
                    style: TextStyle(fontSize: 10, color: Appcolor.whitecolor),
                  ),
                  Icon(
                    Icons.watch_later_outlined,
                    color: Appcolor.whitecolor,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 27,
              width: MediaQuery.of(context).size.width * .17,
              decoration: BoxDecoration(
                color: Appcolor.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "End",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Appcolor.whitecolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 31,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Appcolor.greycolor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Plan", style: TextStyle(fontSize: 18)),
                  ),
                ),
                Container(
                  height: 31,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Appcolor.greycolor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Issue", style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Issue()),
                    );
                  },
                  child: Container(
                    height: 31,
                    width: MediaQuery.of(context).size.width * .25,
                    decoration: BoxDecoration(
                      color: Appcolor.deepPurple,
                      border: Border.all(width: 1, color: Appcolor.greycolor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Recived",
                        style: TextStyle(
                          fontSize: 18,
                          color: Appcolor.whitecolor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Container(
              height: 60,
              width: double.infinity,
              color: Appcolor.lightgrey2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Batch/\n No",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Text(
                          "Qty MT",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Actual\nWT(MT)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          "View",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.batchNo1?.batchNo ?? "Server issue",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "${widget.batchNo1?.length} MM x\n ${widget.batchNo1?.width} MM\n x CR-2 x SAIL",
                ),
                Text(
                  widget.batchNo1?.weight.toString() ?? "null",
                  style: TextStyle(fontSize: 12),
                ),
                Text(widget.batchNo1?.expectedWeight.toString() ?? "null"),
                GestureDetector(
                  onTap: () {
                    openDialoge4();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Appcolor.deepPurple,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Appcolor.whitecolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.batchNo2?.batchNo ?? " server issue",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "${widget.batchNo2?.length} MM x\n ${widget.batchNo2?.width} MM\n x CR-2 x SAIL",
                ),
                Text(
                  widget.batchNo2?.weight.toString() ?? "null",
                  style: TextStyle(fontSize: 12),
                ),
                Text(widget.batchNo2?.expectedWeight.toString() ?? "null"),

                GestureDetector(
                  onTap: () {
                    openDialoge4();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Appcolor.deepPurple,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Appcolor.whitecolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.batchNo3?.batchNo ?? "server issue",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "${widget.batchNo3?.length} MM x\n ${widget.batchNo1?.width} MM\n x CR-2 x SAIL",
                ),
                Text(
                  widget.batchNo3?.expectedWeight.toString() ?? "null",
                  style: TextStyle(fontSize: 12),
                ),
                Text(widget.batchNo3?.weight.toString() ?? "null"),
                GestureDetector(
                  onTap: () {
                    openDialoge4();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Appcolor.deepPurple,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Appcolor.whitecolor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * .8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard2()),
                );
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: Appcolor.deepPurple,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18,
                      color: Appcolor.whitecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future openDialoge4() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Appcolor.whitecolor,
            actions: [
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Batch /ID no.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(": 03-25B-0651"),
                ],
              ),

              Row(
                children: [
                  Text(
                    "size Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("  :250 MM x 0.70 MM x\n   GR-1 x TATA"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Actual wt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" :  13.456"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Supplier ID No :  13",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Container(
                height: 150,
                width: double.infinity,
                color: Appcolor.lightgrey,
                child: Image.asset(fit: BoxFit.fill, AppImages.slittingcoil),
              ),

              SizedBox(height: 30),
            ],
          ),
    );
  }
}
