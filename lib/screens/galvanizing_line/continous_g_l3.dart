import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/cgl_process_model.dart';
import 'package:inframat/provider/timellog_provider.dart';
import 'package:inframat/screens/galvanizing_line/printqr_for_cg.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:provider/provider.dart';

class ContinousGL3 extends StatefulWidget {
  const ContinousGL3({super.key, this.newEntry, this.currentTime});
  final CglProcessData? newEntry;
  final String? currentTime;

  @override
  State<ContinousGL3> createState() => _ContinousGL3State();
}

class _ContinousGL3State extends State<ContinousGL3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        backgroundColor: Appcolor.whitecolor,
        title: Text("CGL 3"),
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
                if (value != null) {
                  Fluttertoast.showToast(
                    msg: "Machine time log sent to management",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Appcolor.deepPurple,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Network Error",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Appcolor.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
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
      body: Column(
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
                    style: TextStyle(fontSize: 18, color: Appcolor.whitecolor),
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
                        "Std Zinc\nweight",
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
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${widget.newEntry?.batchNo}",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "${widget.newEntry?.length} MM x\n ${widget.newEntry?.width} MM\n x CR-2 x SAIL",
              ),
              Text(
                "${widget.newEntry?.weight}",
                style: TextStyle(fontSize: 12),
              ),
              Text("${widget.newEntry?.zincCoatingWeight}"),
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
                child: Text("${widget.newEntry?.scrapWeight}"),
              ),
              SizedBox(width: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("${widget.newEntry?.scrapWeight}"),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => PrintqrforCGl(
                        batchNo: widget.newEntry?.batchNo,
                        coilno: widget.newEntry?.id,
                      ),
                ),
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
                  Text(": ${widget.newEntry?.batchNo}"),
                ],
              ),

              Row(
                children: [
                  Text(
                    "size Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "  : ${widget.newEntry?.length} MM x ${widget.newEntry?.width} MM x\n   GR-1 x TATA",
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Actual wt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" :  ${widget.newEntry?.weight}"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Mill wt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" :  ${widget.newEntry?.weight}"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Qty Mt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" : ${widget.newEntry?.weight}"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Supplier MRN Coil ID No :  ${widget.newEntry!.id}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Container(
                height: 150,
                width: double.infinity,
                color: Appcolor.lightgrey,
                child: Image.asset(fit: BoxFit.fill, AppImages.coilstock),
                //Image.network("{widget.newEntry!.image!}"),
                //
              ),

              SizedBox(height: 30),
            ],
          ),
    );
  }
}
