import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/cuttingprocess_plan_model.dart';
import 'package:inframat/provider/cutting_processplan_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/cutting_process/container_widget_for_cutting_process.dart';
import 'package:provider/provider.dart';

class Cuttingprocess2 extends StatefulWidget {
  const Cuttingprocess2({super.key});

  @override
  State<Cuttingprocess2> createState() => Cuttingprocess2State();
}

class Cuttingprocess2State extends State<Cuttingprocess2> {
  TextEditingController searchWithbatchcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    searchWithbatchcontroller.dispose();
    super.dispose();
  }

  Timer? debinace;
  List<CuttingPlanData> planList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        backgroundColor: Appcolor.whitecolor,
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        title: Text("Cutting "),
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
      body: Column(
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
                  if (debinace?.isActive ?? false) debinace?.cancel();
                  debinace = Timer(Duration(milliseconds: 500), () {
                    Provider.of<CuttingProcessplanProvider>(
                      context,
                      listen: false,
                    ).gettingCuttingProcessplan().then((value) {
                      if (mounted) {
                        planList.clear();
                        planList.addAll(value!.data!);
                      } else {
                        print("error in object");
                      }
                    });
                  });
                  setState(() {});
                },
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
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

          searchWithbatchcontroller.text.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  itemCount: planList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Containerwidgetforcuttingprocess(
                            textnameforcrm: "Select",
                            batchNo: planList[index].batchNo,
                            supplierId: planList[index].inwardId,
                            length: planList[index].length,
                            width: planList[index].width,
                            weight: planList[index].weight,
                            planNo: planList[index].id,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
              : Text(" Plan Not Found"),
        ],
      ),
    );
  }
}
