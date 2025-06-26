import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/skin_pass_plan_model.dart';
import 'package:inframat/provider/skin_pass_plan_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/skin_pass/container_widget_for_skinpass.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

Timer? _debounce;

class SkinPass extends StatefulWidget {
  const SkinPass({super.key});

  @override
  State<SkinPass> createState() => SkinPassState();
}

class SkinPassState extends State<SkinPass> {
  TextEditingController searchWithbatchcontroller = TextEditingController();

  List<SkinPassPlanData> plansList = [];
  @override
  void dispose() {
    // TODO: implement dispose
    searchWithbatchcontroller.dispose();
    super.dispose();
  }

  @override
  // void fetchFilteredPlans(String searchText) async {
  //   final provider = Provider.of<SkinPassPlanProvider>(context, listen: false);
  //   final response =
  //       await provider.gettingSkinpass(); // adjust if using batch param
  //   if (response?.status == "success") {
  //     setState(() {
  //       if (response?.data != null)
  //       {
  //          plansList.clear();
  //       plansList.addAll(response!.data!);
  //       }
  //         plansList =
  //             response!.data!
  //                 .where(
  //                   (plan) =>
  //                       plan.batchNo?.toLowerCase().contains(
  //                         searchText.toLowerCase(),
  //                       ) ??
  //                       false,
  //                 )
  //                 .toList();
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        backgroundColor: Appcolor.whitecolor,
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        title: Text("Skin pass"),
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
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    Provider.of<SkinPassPlanProvider>(
                      context,
                      listen: false,
                    ).gettingSkinpass().then((value) {
                      if (value!.status == "success") {
                        print(value);
                        plansList.clear();
                        plansList.addAll(value.data!);
                      }
                    });
                  });

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
                  child: Text("Recieved", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),

          searchWithbatchcontroller.text.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  itemCount: plansList.length,
                  itemBuilder: (contex, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ContainerWidgetForSkinPass(
                            textnameforcrm: "select",
                            batchNo: plansList[index].batchNo,
                            supplierId: plansList[index].inwardId,
                            length: plansList[index].length,
                            thickness: plansList[index].thickness,
                            weight: plansList[index].weight,
                            planNo: plansList[index].id,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
              : Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Appcolor.lightgrey,
                      highlightColor: Appcolor.greycolor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5, // Dummy shimmer items
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }
}
