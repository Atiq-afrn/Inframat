import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/cgl_process_model.dart';
import 'package:inframat/provider/cgl_process_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/crm_cold_mill/container_widget_for_crm.dart';
import 'package:inframat/screens/galvanizing_line/container_widget_for_cgl.dart';
import 'package:inframat/screens/galvanizing_line/continous_g_l3.dart';

import 'package:inframat/widgets/picklingprocess/container_widget_for_pickling.dart';
import 'package:provider/provider.dart';

class Continousgalvanizingline2 extends StatefulWidget {
  const Continousgalvanizingline2({
    super.key,
    this.batchNo,
    this.supplierIdNo,
    this.size,
    this.length,
    this.weight,
    this.planningNO,
  });

  final String? batchNo;
  final String? supplierIdNo;
  final String? size;
  final String? length;
  final String? weight;
  final String? planningNO;

  @override
  State<Continousgalvanizingline2> createState() =>
      Continousgalvanizingline2State();
}

class Continousgalvanizingline2State extends State<Continousgalvanizingline2> {
  TextEditingController searchWithbatchcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    searchWithbatchcontroller.dispose();
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
        title: Text("CGL"),
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
                  controller: searchWithbatchcontroller,
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
                      "issue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.whitecolor,
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
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
                ),
              ],
            ),

            Column(
              children: [
                SizedBox(height: 20),

                Containerwidgetforcgl2(
                  textnameforcrm: "Proceed",
                  batchNo: widget.batchNo,
                  supplierIdNo: widget.supplierIdNo,
                  size: widget.size,
                  length: widget.length,
                  weight: widget.weight,

                  plannignNo: widget.planningNO,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Containerwidgetforcgl2 extends StatefulWidget {
  const Containerwidgetforcgl2({
    super.key,
    this.textnameforcrm,
    this.batchNo,
    this.supplierIdNo,
    this.size,
    this.length,
    this.weight,
    this.plannignNo,
  });
  final String? textnameforcrm;

  final String? batchNo;
  final String? supplierIdNo;
  final String? size;
  final String? length;
  final String? weight;
  final String? plannignNo;

  @override
  State<Containerwidgetforcgl2> createState() => _Containerwidgetforcgl2State();
}

class _Containerwidgetforcgl2State extends State<Containerwidgetforcgl2> {
  dynamic selectedImage;
  dynamic base64Imgae;

  TextEditingController lengthcontroller = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController stdZincController = TextEditingController();
  TextEditingController scrapeController = TextEditingController();
  TextEditingController actualWeightController = TextEditingController();
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
                  " ${widget.batchNo} ",
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
                  "${widget.supplierIdNo}",
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
                  " ${widget.length} MM x ${widget.size} MM x GR-1 x TATA",
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
                  "${widget.weight} MT",
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
                  "Planning No :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.plannignNo!,
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
                            "Started 9 P.M",
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
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "ADD New IM CGL No",
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
                              controller: lengthcontroller,
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
                            controller: weightController,
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
                        "Std Zinc Weight",
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
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: TextField(
                                  controller: stdZincController,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "00.00",
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
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
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: TextField(
                                  controller: scrapeController,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "00.00",
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
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
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: actualWeightController,
                                  decoration: InputDecoration(
                                    hintText: "00.00",
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
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
                  GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedImage = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (pickedImage != null) {
                        File imagepath = File(pickedImage.path);
                        final bytes = await imagepath.readAsBytes();
                        base64Imgae = base64Encode(bytes);

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

                      actualWeightController.text.isNotEmpty
                          ? GestureDetector(
                            onTap: () {
                              Provider.of<CglProcessProvider>(
                                    context,
                                    listen: false,
                                  )
                                  .gettingCglProcess(
                                    widget.batchNo.toString(),
                                    lengthcontroller.text,
                                    widthController.text,
                                    widget.size.toString(),
                                    weightController.text,
                                    scrapeController.text,
                                    stdZincController.text,
                                    widget.supplierIdNo!,
                                    base64Imgae,
                                  )
                                  .then((value) {
                                    if (value!.data != null) {
                                      CglProcessData? newEntry = CglProcessData(
                                        batchNo: value.data?.batchNo.toString(),
                                        length: value.data?.length.toString(),
                                        width: value.data?.width.toString(),
                                        weight: value.data?.weight.toString(),
                                        zincCoatingWeight:
                                            value.data?.zincCoatingWeight
                                                .toString(),
                                        scrapWeight:
                                            value.data?.scrapWeight.toString(),
                                      );

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => ContinousGL3(
                                                newEntry: newEntry,
                                              ),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            "this plan already Processed of something error",
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
}
