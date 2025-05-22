import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';

import 'package:inframat/screens/coil_sliting_screen2.dart';
import 'package:inframat/screens/issue.dart';
import 'package:inframat/widgets/invard_widget.dart/invard.dart';

class Issue extends StatefulWidget {
  const Issue({super.key});

  @override
  State<Issue> createState() => _IssueState();
}

class _IssueState extends State<Issue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        backgroundColor: Appcolor.whitecolor,
        title: Text("Coil slit"),
        actions: [
          Container(
            height: 25,
            width: MediaQuery.of(context).size.width * .16,
            color: Appcolor.deepPurple,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Invard()),
                  );
                },
                child: Container(
                  height: 31,
                  width: MediaQuery.of(context).size.width * .23,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Appcolor.greycolor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Plan", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoilSlitingScreen2(),
                    ),
                  );
                },
                child: Container(
                  height: 31,
                  width: MediaQuery.of(context).size.width * .23,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Appcolor.greycolor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Slit", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
              Container(
                height: 31,
                width: MediaQuery.of(context).size.width * .23,
                decoration: BoxDecoration(
                  color: Appcolor.deepPurple,
                  border: Border.all(width: 1, color: Appcolor.greycolor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Issue",
                    style: TextStyle(fontSize: 18, color: Appcolor.whitecolor),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "supplier\nID.NO",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "batch/ID\nNO",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "size\nDetails",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 45),
                      child: Text(
                        "Qty/MT",
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
              Text("C03923B", style: TextStyle(fontSize: 12)),
              Text("03-25A-0651", style: TextStyle(fontSize: 12)),
              Text("1520 MM x\n 0.80 MM\n x CR-2 x SAIL"),
              Text("13.450"),
              GestureDetector(
                onTap: () {
                  openDialoge3();
                },
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Appcolor.deepPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Center(
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Appcolor.whitecolor,
                      ),
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
              Text("C03923B", style: TextStyle(fontSize: 12)),
              Text("03-25A-0651", style: TextStyle(fontSize: 12)),
              Text("1520 MM x\n 0.80 MM\n x CR-2 x SAIL"),
              Text("13.450"),
              GestureDetector(
                onTap: () {
                  openDialoge3();
                },
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Appcolor.deepPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Center(
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Appcolor.whitecolor,
                      ),
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
              Text("C03923B", style: TextStyle(fontSize: 12)),
              Text("03-25A-0651", style: TextStyle(fontSize: 12)),
              Text("1520 MM x\n 0.80 MM\n x CR-2 x SAIL"),
              Text("13.450"),
              GestureDetector(
                onTap: () {
                  openDialoge3();
                },
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Appcolor.deepPurple,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Center(
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Appcolor.whitecolor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future openDialoge3() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Appcolor.whitecolor,
            content: Container(
              height: 500,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Batch /ID no.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(": 03-25B-0651"),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "size Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("  :250 MM x 0.70 MM x\n   GR-1 x TATA"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Actual wt",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" :  13.456"),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "Supplier ID No :  13",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Mill wt",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" :  13.456"),
                      SizedBox(height: 10),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "Qty wt",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" :  13.456"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Issue to",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" : Coil slit"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Appcolor.lightgrey,
                    child: Image.asset(fit: BoxFit.fill, AppImages.coilstock),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
    );
  }
}
