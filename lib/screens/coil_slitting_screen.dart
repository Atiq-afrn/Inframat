import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/quality_check_model.dart';
import 'package:inframat/screens/coil_sliting_screen2.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/coilslitting_issue_screen.dart';
import 'package:inframat/widgets/container_widget_for_coilslitting.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CoilSlittingScreen extends StatefulWidget {
  const CoilSlittingScreen({super.key, this.modelData});
  final QualityCheckModel? modelData;

  @override
  State<CoilSlittingScreen> createState() => _CoilSlittingScreenState();
}

class _CoilSlittingScreenState extends State<CoilSlittingScreen> {
  TextEditingController alertDialog3controller = TextEditingController();
  TextEditingController searchbyplancontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    searchbyplancontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("coil slitting"),
        elevation: 2,
        shadowColor: Appcolor.greycolor,
        actions: [Icon(Icons.date_range_outlined)],
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
                  controller: searchbyplancontroller,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    hintText: "search by Batch no/Plan no",
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
                    color: Appcolor.deepPurple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Plan",
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
                    child: Text("Issue", style: TextStyle(fontSize: 18)),
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
                      child: Text("Recived", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            searchbyplancontroller.text.isNotEmpty
                ? Column(
                  children: [
                    SizedBox(height: 20),
                    ContainerWidgetforall(
                      textname: "Select",
                      supplyerIdNo:
                          widget.modelData?.data.id.toString() != null
                              ? widget.modelData!.data.id.toString()
                              : "No Data found",
                      size:
                          widget.modelData?.data.loadedWeight.toString() != null
                              ? widget.modelData!.data.loadedWeight.toString()
                              : "No Data found",
                      weight:
                          widget.modelData?.data.emptyWeight != null
                              ? widget.modelData!.data.emptyWeight.toString()
                              : "No Data found",

                      batchNo:
                          widget.modelData?.data.coilWeight.toString() != null
                              ? widget.modelData!.data.coilWeight.toString()
                              : "No Data found",
                    ),
                    SizedBox(height: 20),

                    ContainerWidgetforall(
                      supplyerIdNo:
                          widget.modelData?.data.id.toString() != null
                              ? widget.modelData!.data.id.toString()
                              : "No Data found",
                      size:
                          widget.modelData?.data.loadedWeight.toString() != null
                              ? widget.modelData!.data.loadedWeight.toString()
                              : "No Data found",
                      weight:
                          widget.modelData?.data.emptyWeight != null
                              ? widget.modelData!.data.emptyWeight.toString()
                              : "No Data found",
                      textname: "Select",
                      batchNo:
                          widget.modelData?.data.materialId.toString() != null
                              ? widget.modelData!.data.materialId.toString()
                              : "No Data found",
                    ),
                    SizedBox(height: 20),
                    ContainerWidgetforall(
                      supplyerIdNo:
                          widget.modelData?.data.id.toString() != null
                              ? widget.modelData!.data.id.toString()
                              : "No Data found",
                      size:
                          widget.modelData?.data.loadedWeight.toString() != null
                              ? widget.modelData!.data.loadedWeight.toString()
                              : "No Data found",
                      weight:
                          widget.modelData?.data.emptyWeight != null
                              ? widget.modelData!.data.emptyWeight.toString()
                              : "No Data found",
                      textname: "Select",
                      batchNo:
                          widget.modelData?.data.materialId.toString() != null
                              ? widget.modelData!.data.materialId.toString()
                              : "No Data found",
                    ),
                  ],
                )
                : Container(),
          ],
        ),
      ),
    );
  }
}
