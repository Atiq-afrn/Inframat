import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';

class TubeMillCustomeWidget extends StatefulWidget {
  const TubeMillCustomeWidget({super.key});

  @override
  State<TubeMillCustomeWidget> createState() => _TubeMillCustomeWidgetState();
}

class _TubeMillCustomeWidgetState extends State<TubeMillCustomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("03-25A-0651", style: TextStyle(fontSize: 12)),
        Text("1520 MM x\n 0.80 MM\n x CR-2 x SAIL"),
        Text("140", style: TextStyle(fontSize: 12)),
        Text("3.65"),
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
                    "Mill Wt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" :  13.456"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "No Of Pices",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" : 140"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Qty Mt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" : 21.056"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "W/P",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" : 3.65"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Supplier MRN Coil ID :",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text("294834343"),
                ],
              ),
              SizedBox(height: 10),

              Container(
                height: 150,
                width: double.infinity,
                color: Appcolor.lightgrey,
                child: Image.asset(fit: BoxFit.fill, AppImages.coilstock),
              ),

              SizedBox(height: 30),
            ],
          ),
    );
  }
}
