import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/models/pausereasonlist_model.dart';
import 'package:inframat/provider/pauslist_provider.dart';
import 'package:inframat/provider/timellog_provider.dart';
import 'package:inframat/screens/anneling/anneling_process3.dart';
import 'package:inframat/screens/anneling/container_widget_for_anneling.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AnnelingProcess2 extends StatefulWidget {
  const AnnelingProcess2({
    super.key,
    this.batchNo,
    this.length,
    this.supplierIdNo,
    this.weight,
    this.width,
  });
  final String? batchNo;
  final String? supplierIdNo;
  final String? length;
  final String? width;
  final String? weight;

  @override
  State<AnnelingProcess2> createState() => _AnnelingProcess2State();
}

class _AnnelingProcess2State extends State<AnnelingProcess2> {
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
        title: Text("Annealing"),
        backgroundColor: Colors.white,
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
                    child: Text("Recived", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ContainerWidgetforAnneling2(
                  batchNo: widget.batchNo,
                  supplierIdno: widget.supplierIdNo,
                  length: widget.length,
                  width: widget.width,
                  weight: widget.weight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWidgetforAnneling2 extends StatefulWidget {
  const ContainerWidgetforAnneling2({
    super.key,
    this.textnameforcrm,
    this.batchNo,
    this.supplierIdno,
    this.length,
    this.width,
    this.weight,
  });
  final String? textnameforcrm;
  final String? batchNo;
  final String? supplierIdno;
  final String? length;
  final String? width;
  final String? weight;

  @override
  State<ContainerWidgetforAnneling2> createState() =>
      _ContainerWidgetforAnneling2State();
}

class _ContainerWidgetforAnneling2State
    extends State<ContainerWidgetforAnneling2> {
  String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
  Timer? timer;
  int counter = 1;
  int increamentedValues = 1;
  dynamic selectedImage;
  bool? ischecked = false;
  List<bool> isCheckedList = List.generate(5, (_) => false);

  TextEditingController picklinglossecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 600,
              child:
                  increamentedValues == 5
                      ? Text("data")
                      : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                Widget mainItemContainer = Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Appcolor.whitecolor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          offset: Offset(0, 5),
                                          blurRadius: 4,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 30),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Checkbox(
                                                activeColor:
                                                    Appcolor.deepPurple,
                                                value: isCheckedList[index],
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isCheckedList[index] =
                                                        value ?? false;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Batch no  : ",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                widget.batchNo.toString(),
                                                style: TextStyle(
                                                  color: Appcolor.greycolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Supplier Id no : ",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                widget.supplierIdno.toString(),
                                                style: TextStyle(
                                                  color: Appcolor.greycolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Size :",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "  ${widget.length} MM x${widget.width} MM x GR-1 x TATA",
                                                style: TextStyle(
                                                  color: Appcolor.greycolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Weight :",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                " ${widget.weight}",
                                                style: TextStyle(
                                                  color: Appcolor.greycolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // If this is last item, add the deepPurple Proceed button inside item
                                        if (index == 4) ...[
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Plan Details:",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          7,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    "Planning details as given planning department",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                GestureDetector(
                                                  onTap: () {
                                                    alertDialog1();
                                                    Provider.of<
                                                      TimellogProvider
                                                    >(
                                                      context,
                                                      listen: false,
                                                    ).gettingTimeLog("start", "").then((
                                                      value,
                                                    ) {
                                                      if (value != null) {
                                                        Fluttertoast.showToast(
                                                          msg:
                                                              "Annealing Process Time Start",
                                                          toastLength:
                                                              Toast
                                                                  .LENGTH_SHORT,
                                                          gravity:
                                                              ToastGravity
                                                                  .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              Appcolor
                                                                  .deepPurple,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0,
                                                        );
                                                      } else {
                                                        Fluttertoast.showToast(
                                                          msg: "Network Error ",
                                                          toastLength:
                                                              Toast
                                                                  .LENGTH_SHORT,
                                                          gravity:
                                                              ToastGravity
                                                                  .CENTER,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              Appcolor.red,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0,
                                                        );
                                                      }
                                                    });

                                                    Provider.of<
                                                      PauslistProvider
                                                    >(
                                                      context,
                                                      listen: false,
                                                    ).gettingPauseList().then((
                                                      value,
                                                    ) {
                                                      if (value?.success ==
                                                          "success") {
                                                        setState(() {
                                                          dropdownItems
                                                              ?.clear();
                                                          dropdownItems?.addAll(
                                                            value!.data!,
                                                          );
                                                        });
                                                      } else {
                                                        print("error ");
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Appcolor.deepPurple,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            7,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      "Proceed",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ],

                                        SizedBox(height: 30),
                                      ],
                                    ),
                                  ),
                                );

                                return mainItemContainer;
                              },
                            ),
                          ),
                        ],
                      ),
            ),
          ),
          SizedBox(height: 20),
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
                        "ADD New IM Annealing No",
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
                          color: Appcolor.whitecolor,
                          child: TextField(
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
                              color: Appcolor.whitecolor,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  decoration: InputDecoration(
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
                              color: Appcolor.whitecolor,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: picklinglossecontroller,
                                  decoration: InputDecoration(
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

                      //  selectedImage
                      picklinglossecontroller.text.isNotEmpty
                          ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => Annelingprocess3(
                                        currentTime: currentTime,
                                      ),
                                ),
                              );
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                          Provider.of<TimellogProvider>(context, listen: false)
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
