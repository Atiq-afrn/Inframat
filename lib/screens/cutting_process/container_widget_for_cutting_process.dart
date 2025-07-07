import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/cuttingprocess_model.dart';
import 'package:inframat/models/pausereasonlist_model.dart';
import 'package:inframat/models/timelog_model.dart';
import 'package:inframat/provider/cutting_process2_provider.dart';
import 'package:inframat/provider/pauslist_provider.dart';
import 'package:inframat/provider/timellog_provider.dart';
import 'package:inframat/screens/cutting_process/cutting_process3.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Containerwidgetforcuttingprocess extends StatefulWidget {
  const Containerwidgetforcuttingprocess({
    super.key,
    this.textnameforcrm,
    this.batchNo,
    this.supplierId,
    this.length,
    this.width,
    this.weight,
    this.planNo,
  });
  final String? textnameforcrm;
  final String? batchNo;
  final String? supplierId;
  final String? length;
  final String? width;
  final String? weight;
  final String? planNo;

  @override
  State<Containerwidgetforcuttingprocess> createState() =>
      _ContainerwidgetforcuttingprocessState();
}

class _ContainerwidgetforcuttingprocessState
    extends State<Containerwidgetforcuttingprocess> {
  List<IssueData>? dropdownItems = [];
  final String? currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Appcolor.whitecolor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            offset: Offset(0, 5),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Batch no  : ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  " ${widget.batchNo}",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Supplier Id no : ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.supplierId}",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Size :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),

                Text(
                  "${widget.length} MM x ${widget.width} MM x GR-1 x TATA",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Weight :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.weight}",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Planning :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  " ${widget.planNo}",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Plans Details :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolor.lightred,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text("Planning details as given planning department"),
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              alertDialog1();
              Provider.of<TimellogProvider>(
                context,
                listen: false,
              ).gettingTimeLog("start", "").then((value) {
                if (value?.status == true) {
                  Fluttertoast.showToast(
                    msg: " Cutting Process Time Start",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Appcolor.deepPurple,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: " Network Error",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Appcolor.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              });

              Provider.of<PauslistProvider>(
                context,
                listen: false,
              ).gettingPauseList().then((value) {
                if (value?.success == "success") {
                  setState(() {
                    dropdownItems?.clear();
                    dropdownItems?.addAll(value!.data!);
                  });
                } else {
                  print("error ");
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolor.deepPurple,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    widget.textnameforcrm.toString(),
                    style: TextStyle(
                      fontSize: 19,
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
    );
  }

  TextEditingController lengthcontroller = TextEditingController();
  TextEditingController widthcontroller = TextEditingController();
  TextEditingController piecesController = TextEditingController();
  Future alertDialog1() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Appcolor.whitecolor,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 27,
                        width: MediaQuery.of(context).size.width * .19,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Appcolor.greycolor,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Started ${currentTime}",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: 27,
                        width: MediaQuery.of(context).size.width * .18,
                        decoration: BoxDecoration(
                          color: Appcolor.lightpurple,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Appcolor.lightpurple,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${currentTime}",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          timeStopalertDialoge(context, (selectedOption) {
                            if (selectedOption != null) {
                              print("User selected: $selectedOption");
                            } else {
                              print("No option selected");
                            }
                          });
                        },
                        child: Container(
                          height: 27,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Appcolor.gcol,
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(
                              color: Appcolor.greycolor,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.pause,
                                  color: Appcolor.whitecolor,
                                  size: 15,
                                ),
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
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "IM Cutting Process Requirement",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Length Required",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .37,
                        color: Appcolor.lightgrey2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * .17,
                              decoration: BoxDecoration(
                                color: Appcolor.whitecolor,
                                border: Border.all(color: Appcolor.greycolor),
                              ),
                              child: TextField(
                                controller: lengthcontroller,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "00.00",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Text("(in MM)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Width Required ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .37,
                        color: Appcolor.lightgrey2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * .17,
                              decoration: BoxDecoration(
                                color: Appcolor.whitecolor,
                                border: Border.all(color: Appcolor.greycolor),
                              ),
                              child: TextField(
                                controller: widthcontroller,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "00.00",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Text("(in MM)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter No of Pieces",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .37,
                        color: Appcolor.lightgrey2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * .17,
                              decoration: BoxDecoration(
                                color: Appcolor.whitecolor,
                                border: Border.all(color: Appcolor.greycolor),
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: piecesController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintText: "00.00",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Text("(PCS)"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width * .8),

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
                                color: Appcolor.whitecolor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      piecesController.text.isEmpty
                          ? Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Appcolor.greycolor,
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
                          )
                          : GestureDetector(
                            onTap: () {
                              Provider.of<CuttingProcess2Provider>(
                                    context,
                                    listen: false,
                                  )
                                  .gettingCuttingProcees(
                                    widget.batchNo.toString(),
                                    lengthcontroller.text,
                                    widthcontroller.text,
                                    piecesController.text,
                                  )
                                  .then((value) {
                                    if (value?.status == "success") {
                                      CuttingProcessSaveData? responsedata =
                                          (value?.data);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => CuttingProcess3(
                                                responseData: responsedata,
                                                currentTime: currentTime,
                                              ),
                                        ),
                                      );
                                    }
                                  });
                            },
                            child: Container(
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
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  String? selectedIssueId;
  String? selectedIssue;

  void timeStopalertDialoge(
    BuildContext context,
    void Function(String?) onSubmit,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return Dialog(
          backgroundColor: Appcolor.whitecolor,
          insetPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: const EdgeInsets.all(16),
                width: screenWidth * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Pause", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 16),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Appcolor.lightgrey2,
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: selectedIssue,
                        hint: Text("Select issue"),
                        isExpanded: true,
                        items:
                            dropdownItems?.map((IssueData item) {
                              return DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(item.name ?? ''),
                              );
                            }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedIssue = newValue;

                            final selectedItem = dropdownItems?.firstWhere(
                              (item) => item.name == newValue,
                              orElse: () => IssueData(id: "", name: ''),
                            );

                            selectedIssueId = selectedItem?.id;
                            print("📌 Selected ID: $selectedIssueId");
                          });
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .34,
                            decoration: BoxDecoration(
                              color: Appcolor.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                " Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Provider.of<TimellogProvider>(
                              context,
                              listen: false,
                            ).gettingTimeLog("pause", "${selectedIssueId}").then(
                              (value) {
                                if (value != null) {
                                  Fluttertoast.showToast(
                                    msg: "Machine time line sent to management",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Appcolor.deepPurple,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } else {
                                  print(" error on ui");
                                }
                              },
                            );
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .34,
                            decoration: BoxDecoration(
                              color: Appcolor.deepPurple,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
            },
          ),
        );
      },
    );
  }
}
