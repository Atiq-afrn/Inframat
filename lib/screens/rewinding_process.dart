import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/screens/dashboard2.dart';

class RewindingProcess extends StatefulWidget {
  const RewindingProcess({super.key});

  @override
  State<RewindingProcess> createState() => _RewindingProcessState();
}

class _RewindingProcessState extends State<RewindingProcess> {
  bool? ischecked1 = false;
  bool? ischecked2 = false;
  bool? ischecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("  Rewinding Process")),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 27,
                width: MediaQuery.of(context).size.width * .18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Appcolor.greycolor, width: 1),
                ),
                child: Center(
                  child: Text("Started 9 P.M", style: TextStyle(fontSize: 10)),
                ),
              ),
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
                        style: TextStyle(
                          fontSize: 10,
                          color: Appcolor.whitecolor,
                        ),
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
              Container(
                height: 27,
                width: MediaQuery.of(context).size.width * .18,
                decoration: BoxDecoration(
                  color: Appcolor.gcol,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: Appcolor.greycolor, width: 1),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.pause, color: Appcolor.whitecolor, size: 15),
                      Text(
                        "Pause",
                        style: TextStyle(
                          fontSize: 10,
                          color: Appcolor.whitecolor,
                        ),
                      ),
                    ],
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
                        "Select",
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("batchno"),
              ),
              Text("size"),
              Text("qtymy"),
              Text("actula weight"),
              Checkbox(
                value: ischecked1,

                activeColor: Appcolor.deepPurple,
                onChanged: (values) {
                  setState(() {
                    ischecked1 = values;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("batchno"),
              ),
              Text("size"),
              Text("qtymy"),
              Text("actula weight"),
              Checkbox(
                value: ischecked2,

                activeColor: Appcolor.deepPurple,
                onChanged: (values) {
                  setState(() {
                    ischecked2 = values;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("batchno"),
              ),
              Text("size"),
              Text("qtymy"),
              Text("actula weight"),
              Checkbox(
                value: ischecked3,

                activeColor: Appcolor.deepPurple,
                onChanged: (values) {
                  setState(() {
                    ischecked3 = values;
                  });
                },
              ),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.width * .5),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard2()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.teal,
                  content: Center(child: Text(" Rewinding Completed ")),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Appcolor.deepPurple,
                ),

                child: Center(
                  child: Text(
                    "Continue To Next Step",
                    style: TextStyle(
                      fontSize: 18,
                      color: Appcolor.whitecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
