import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/pickling_plane_listing_model.dart';
import 'package:inframat/provider/picling_plan_list_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/widgets/picklingprocess/container_widget_for_pickling.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PiicklingProcess extends StatefulWidget {
  const PiicklingProcess({super.key});

  @override
  State<PiicklingProcess> createState() => PiicklingProcessState();
}

class PiicklingProcessState extends State<PiicklingProcess> {
  TextEditingController searchWithbatchcontroller = TextEditingController();
  @override
  void dispose() {
    searchWithbatchcontroller.dispose();
    super.dispose();
  }

  List<PicklingPlan> picklingPlanList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PicklingPlanProvider>(
      context,
      listen: false,
    ).gettingPicklingPlanList().then((values) {
      if (values!.status == "success") {
        picklingPlanList.clear();
        picklingPlanList.addAll(values.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        backgroundColor: Appcolor.whitecolor,
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        title: Text("Pickled Oil"),
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
                      child: Text("Issue", style: TextStyle(fontSize: 18)),
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
                ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: picklingPlanList.length,
                  itemBuilder: (BuildContext, index) {
                    return Column(
                      children: [
                        SizedBox(height: 20),

                        ContainerWidgetforpickling(
                          textnameforpickling: "Select",
                          batchNo: picklingPlanList[index].batchNo,
                          supplierIdno:
                              picklingPlanList[index].inwardId.toString(),
                          size: picklingPlanList[index].length.toString(),
                          weight: picklingPlanList[index].weight,
                          planNo: picklingPlanList[index].id.toString(),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                )
                : Shimmer.fromColors(
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
                ),
          ],
        ),
      ),
    );
  }
}
