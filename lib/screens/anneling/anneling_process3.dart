import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/provider/timellog_provider.dart';
import 'package:inframat/screens/anneling/anneling3_custome_widget.dart';
import 'package:inframat/screens/dashboard2.dart';
import 'package:provider/provider.dart';

class Annelingprocess3 extends StatefulWidget {
  const Annelingprocess3({super.key, this.currentTime});
  final String? currentTime;

  @override
  State<Annelingprocess3> createState() => _Annelingprocess3State();
}

class _Annelingprocess3State extends State<Annelingprocess3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        backgroundColor: Appcolor.whitecolor,
        title: Text("Annealing Process 3"),
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
                    "${widget.currentTime}",
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
          GestureDetector(
            onTap: () {
              Provider.of<TimellogProvider>(
                context,
                listen: false,
              ).gettingTimeLog("end", "").then((value) {
                if (value!.status == true) {
                  Fluttertoast.showToast(
                    msg: "Machine Time Line Sent To Management ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Appcolor.deepPurple,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Center(child: Text("Network Error")),
                    ),
                  );
                }
              });
            },
            child: Padding(
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
                Container(
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
              ],
            ),

            SizedBox(height: 10),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * .92,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Text(
                          "Actual\nWt(MT)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Pickling\nLoss",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          "View",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            SizedBox(height: 10),
            Anneling3CustomeWidget(),
            SizedBox(height: 10),
            Anneling3CustomeWidget(),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Anneling3CustomeWidget(),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Anneling3CustomeWidget(),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Anneling3CustomeWidget(),
            SizedBox(height: 10),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width * .92,
              color: Appcolor.lightgrey2,
              child: Column(
                children: [
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Scarp",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Text(
                          "Qty (MT)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("03-25D-0651"),
                ),
                SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("0.029"),
                ),
              ],
            ),
            SizedBox(height: 100),
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
}
