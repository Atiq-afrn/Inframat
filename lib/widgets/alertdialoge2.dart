
  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inframat/const/color.dart';

Future openDialoge(dynamic context) async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
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
                  Text(":250 MM x 0.70 MM x\n GR-1 x TATA"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Actual wt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(":13.456"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Supplier ID No",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(" "),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Appcolor.greycolor),
                    ),
                    child: Center(
                      child: Text(
                        "Enter coil weight",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "(In MT)",
                    style: TextStyle(color: Appcolor.greycolor, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.red,
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.deepPurple,
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,

                          color: Appcolor.whitecolor,
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

