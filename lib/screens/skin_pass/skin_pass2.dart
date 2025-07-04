import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/pausereasonlist_model.dart';
import 'package:inframat/models/skin_process_response_model.dart';
import 'package:inframat/provider/pauslist_provider.dart';
import 'package:inframat/provider/skinpass_process_provider.dart';
import 'package:inframat/provider/timellog_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/skin_pass/skin_pass3.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SkinPass2 extends StatefulWidget {
  const SkinPass2({
    super.key,
    this.batchNo,
    this.supplierId,
    this.length,
    this.thickness,
    this.weight,
    this.planNo,
  });
  final String? batchNo;
  final String? supplierId;
  final String? length;
  final String? thickness;
  final String? weight;
  final String? planNo;

  @override
  State<SkinPass2> createState() => SkinPass2State();
}

class SkinPass2State extends State<SkinPass2> {
  TextEditingController nocontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    nocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        backgroundColor: Appcolor.whitecolor,
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        title: Text("Skin pass 2"),
        actions: [
          GestureDetector(
            onTap: () {
              var datepicked = showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2050),
              );
            },
            child: Icon(Icons.date_range),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(children: [Text("Search plan :")]),
            ),

            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffF2F4FC),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    hintText: "Search by Batch No Plan no",
                    suffixIcon: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoilslitingOpenCamera(),
                                ),
                              );
                            },
                            child: Icon(Icons.qr_code),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                    color: Appcolor.deepPurple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Issue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.whitecolor,
                      ),
                    ),
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
                    child: Text("Recieved", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                SizedBox(height: 20),

                ContainerWidgetForSkinPass2(
                  textnameforcrm: "Proceed",
                  batchNo: widget.batchNo,
                  supplierId: widget.supplierId,
                  length: widget.length,
                  thickness: widget.thickness,
                  weight: widget.weight,
                  planNo: widget.planNo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWidgetForSkinPass2 extends StatefulWidget {
  ContainerWidgetForSkinPass2({
    super.key,
    this.textnameforcrm,
    this.batchNo,
    this.supplierId,
    this.length,
    this.thickness,
    this.weight,
    this.planNo,
  });
  final String? textnameforcrm;
  final String? batchNo;
  final String? supplierId;
  final String? length;
  final String? thickness;
  final String? weight;
  final String? planNo;

  @override
  State<ContainerWidgetForSkinPass2> createState() =>
      _ContainerWidgetForSkinPass2State();
}

class _ContainerWidgetForSkinPass2State
    extends State<ContainerWidgetForSkinPass2> {
  TextEditingController skinpasscontroller = TextEditingController();

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
                  widget.batchNo.toString(),
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
                  widget.supplierId.toString(),
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
                  "  ${widget.length} MM x ${widget.thickness} MM x GR-1 x TATA",
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
                  widget.weight.toString(),
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
                  widget.planNo.toString(),
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
                if (value != null) {
                  Fluttertoast.showToast(
                    msg: "Annealing Process Time Start",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Appcolor.deepPurple,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Network Error ",
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

  dynamic selectedImage;
  dynamic base64image;
  String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
  Timer? timer;
  List<SkinProcessData> processResonseData = [];
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController mtweightController = TextEditingController();
  TextEditingController scrapcontroller = TextEditingController();
  TextEditingController actualWeightController = TextEditingController();
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
                        width: MediaQuery.of(context).size.width * .18,
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
                        "ADD New IM Skin pass No",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 43,
                    width: double.infinity,
                    color: Appcolor.lightgrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,

                          width: MediaQuery.of(context).size.width * .11,

                          decoration: BoxDecoration(
                            color: Appcolor.whitecolor,
                            border: Border.all(color: Appcolor.greycolor),
                          ),
                          child: Center(
                            child: TextField(
                              controller: lengthController,
                              decoration: InputDecoration(
                                hintText: "00.00",
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Text("MM x"),
                        Container(
                          height: 30,

                          width: MediaQuery.of(context).size.width * .11,

                          decoration: BoxDecoration(
                            color: Appcolor.whitecolor,
                            border: Border.all(color: Appcolor.greycolor),
                          ),
                          child: Center(
                            child: TextField(
                              controller: widthController,
                              decoration: InputDecoration(
                                hintText: "3.300",

                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),

                        Text("MMX CR-2 x SAIL"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 43,
                    width: double.infinity,
                    color: Appcolor.lightgrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                            color: Appcolor.whitecolor,
                            border: Border.all(color: Appcolor.greycolor),
                          ),
                          child: TextField(
                            controller: mtweightController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "00.00",
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Text("MT"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scrap",
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
                                controller: scrapcontroller,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "0.0",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Text("(in MT)"),
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
                        "Actual Weight",
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
                                controller: actualWeightController,
                                decoration: InputDecoration(
                                  hintText: "0.0",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Text("(in MT)"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedImage = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (pickedImage != null) {
                        File imagepath = File(pickedImage.path);
                        List<int> imagebytes = await imagepath.readAsBytes();
                        base64image = base64Encode(imagebytes);

                        setState(() {
                          selectedImage = imagepath;
                        });
                      }
                    },
                    child:
                        selectedImage != null
                            ? Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * .8,
                              child: Image.file(selectedImage),
                            )
                            : Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * .8,
                              color: Appcolor.lightgrey2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt_outlined),
                                  SizedBox(width: 6),
                                  Text("Take Pickture"),
                                ],
                              ),
                            ),
                  ),
                  SizedBox(height: 120),

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

                      //selectedImage
                      scrapcontroller.text.isNotEmpty
                          ? GestureDetector(
                            onTap: () {
                              Provider.of<SkinpassProcessProvider>(
                                    context,
                                    listen: false,
                                  )
                                  .gettingskinprocess(
                                    widget.batchNo.toString(),
                                    lengthController.text,
                                    widget.thickness.toString(),
                                    widthController.text,
                                    mtweightController.text,
                                    actualWeightController.text,
                                    scrapcontroller.text,
                                    base64image,
                                  )
                                  .then((value) {
                                    if (value?.status == "success") {
                                      if (value?.data != null) {
                                        processResonseData.clear();
                                        processResonseData.add(value!.data!);
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => SkinPass3(
                                                responsedata:
                                                    processResonseData,
                                                supplierId: widget.supplierId,
                                                currenttime: currentTime,
                                              ),
                                        ),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg:
                                            "This batch no has already been taken",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Appcolor.deepPurple,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
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
                          )
                          : Container(
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
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  List<IssueData>? dropdownItems = [];
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
                                child: Text(item.name ?? 'Unnamed'),
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
                            print(dropdownItems?.length);
                            print(dropdownItems?[0].id);
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
                                )
                                .gettingTimeLog("pause", "${selectedIssueId}")
                                .then((value) {
                                  if (value != null) {
                                    print("success on UI");
                                  } else {
                                    print(" error on ui");
                                  }
                                });
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
