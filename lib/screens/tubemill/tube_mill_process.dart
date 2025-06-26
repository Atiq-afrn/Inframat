import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/models/tubemillplanmodel.dart';
import 'package:inframat/provider/tubemill_plan_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/tubemill/contianer_widget_for_tubemill.dart';
import 'package:inframat/screens/tubemill/tube_mill2.dart';
import 'package:provider/provider.dart';

class TubemillProcess extends StatefulWidget {
  const TubemillProcess({super.key});

  @override
  State<TubemillProcess> createState() => _TubemillProcessState();
}

List<TubeMillPlanData> tubmillplanlist = [];

class _TubemillProcessState extends State<TubemillProcess> {
  TextEditingController alertDialog3controller = TextEditingController();
  TextEditingController searchbyplancontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    searchbyplancontroller.dispose();
    super.dispose();
  }

  Timer? debaince;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        title: Text("Tube Mill"),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Appcolor.greycolor,
        actions: [Icon(Icons.date_range_outlined)],
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
                controller: searchbyplancontroller,
                onChanged: (value) {
                  if (debaince?.isActive ?? false) debaince?.cancel();
                  debaince = Timer(Duration(milliseconds: 500), () {
                    Provider.of<TubemillPlanProvider>(
                      context,
                      listen: false,
                    ).gettingtubeMillplanlist().then((value) {
                      if (value?.status == "success") {
                        tubmillplanlist.clear();
                        tubmillplanlist.addAll(value!.data!);
                      }
                    });
                  });
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
          searchbyplancontroller.text.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  itemCount: tubmillplanlist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 20),
                        ContainerWidgetForTubeMill(
                          batchNo: tubmillplanlist[index].batchNo ?? "",
                          supplierIdNo: tubmillplanlist[index].inwardId ?? "",
                          size: tubmillplanlist[index].length ?? "",
                          weight: tubmillplanlist[index].weight ?? "",
                          thickness: tubmillplanlist[index].thickness ?? "",
                          boundleNo: tubmillplanlist[index].length ?? "",
                          textnameforcrm: "Select",
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TubemillProcess2(),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              )
              : Container(),
        ],
      ),
    );
  }

  Future alertDialog1() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            actions: [
              Container(
                height: 21,
                width: MediaQuery.of(context).size.width * .3,
                color: Appcolor.deepPurple,
              ),
            ],
          ),
    );
  }
}
