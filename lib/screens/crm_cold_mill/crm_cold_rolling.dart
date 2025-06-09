import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/crm_plan_listing_responsemodel.dart';
import 'package:inframat/provider/crm_provider.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/crm_cold_mill/container_widget_for_crm.dart';

import 'package:inframat/widgets/picklingprocess/container_widget_for_pickling.dart';
import 'package:provider/provider.dart';

class Crmcoldmill extends StatefulWidget {
  const Crmcoldmill({super.key});

  @override
  State<Crmcoldmill> createState() => CrmcoldmillState();
}

class CrmcoldmillState extends State<Crmcoldmill> {
  TextEditingController searchWithbatchcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    searchWithbatchcontroller.dispose();
    super.dispose();
  }

  List<ColdRollMillingData> crmPlanelist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CrmProvider>(context, listen: false).gettingPlanListcrm().then((
      value,
    ) {
      if (value!.status == "success") {
        crmPlanelist.clear();
        crmPlanelist.addAll(value.data);
        print(" 78787z" + value.data[5].thickness);
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
        title: Text("CRM(Cold Rolling Mill)"),
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
              ? Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: crmPlanelist.length,
                  itemBuilder: (Context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Containerwidgetforcrm(
                        textnameforcrm: "Select",
                        batchNo: "${crmPlanelist[index].batchNo.toString()}",

                        supplierID: "${crmPlanelist[index].id.toString()}",
                        size: "${crmPlanelist[index].length.toString()}",
                        width: "${crmPlanelist[index].width}",
                        weight:
                            "${crmPlanelist[index].actualWeight.toString()}",
                        thickness: "${crmPlanelist[index].thickness}",
                      ),
                    );
                  },
                ),
              )
              : Container(child: Center(child: CircularProgressIndicator())),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
