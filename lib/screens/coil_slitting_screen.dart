import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:inframat/const/color.dart';
import 'package:inframat/models/coilslitting_search_plan.dart';

import 'package:inframat/provider/coilslitting_plan_seaarch_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';

import 'package:inframat/widgets/container_widget_for_coilslitting.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CoilSlittingScreen extends StatefulWidget {
  const CoilSlittingScreen({super.key});

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

  List<CoilSlittingPlanData> filteredItems = [];

  List<CoilSlittingPlanData> planListing = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredItems = planListing;
    Provider.of<CoilslittingPlanSeaarchProvider>(
      context,
      listen: false,
    ).gettingcoilSlittingPlanDataList().then((value) {
      if (value?.status == "success") {
        planListing.clear();
        print(value?.data?.length ?? []);
        planListing.addAll(value!.data!);
        print("datafetched");
      } else {
        print("network error");
      }
    });
  }

  void filterList(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredItems =
          planListing.where((plan) {
            return plan.batchNo!.toLowerCase().contains(lowerQuery);
          }).toList();
    });
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
                onChanged: (value) => filterList(value),
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
          planListing.isEmpty
              ? Shimmer.fromColors(
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
              )
              : Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    shrinkWrap: true,

                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ContainerWidgetforall(
                              textname: "Select",
                              supplyerIdNo:
                                  item.inwardId.toString().isEmpty
                                      ? "no plan found"
                                      : item.inwardId.toString(),
                              size: item.expectedLength.toString(),
                              weight: item.expectedWeight,
                              batchNo: item.batchNo,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
