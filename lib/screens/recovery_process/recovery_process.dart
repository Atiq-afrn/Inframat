import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/screens/dashboard2.dart';
import 'package:inframat/screens/recovery_process/recovery_process_custome_widget.dart';

class RecoveryProcess extends StatefulWidget {
  const RecoveryProcess({super.key});

  @override
  State<RecoveryProcess> createState() => _RecoveryProcessState();
}

class _RecoveryProcessState extends State<RecoveryProcess> {
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey.withValues(alpha: .5),
        backgroundColor: Appcolor.whitecolor,
        title: Text("Recovery Process"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            border: Border.all(color: Appcolor.greycolor),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * .96,
                  color: Appcolor.lightred,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "GP Pipes",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Weight in MT",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * .96,
                  color: Appcolor.lightgrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Rejection/Recovery",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "OPEN"),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "JOINT"),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "ZINC BLACK"),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "PIN HOLE"),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "TOLE PROBLEM"),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "BEND"),

                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * .96,
                  color: Appcolor.lightgrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Rejection",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "BABRI"),
                SizedBox(height: 10),
                RecoveryProcessCustomeWidget(buttonName: "ACUMULATOR\nSCRAP"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("TOTAL"),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .7,
                      color: Appcolor.lightgrey,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .25,
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "0000",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard2()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Appcolor.deepPurple,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.whitecolor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
