import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/models/annealing_plan_listmodel.dart';
import 'package:inframat/provider/annealing_plan_list_provider.dart';
import 'package:inframat/screens/anneling/anneling_process2.dart';
import 'package:inframat/screens/anneling/container_widget_for_anneling.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:provider/provider.dart';

class AnnelingProcess extends StatefulWidget {
  const AnnelingProcess({super.key});

  @override
  State<AnnelingProcess> createState() => _AnnelingProcessState();
}

class _AnnelingProcessState extends State<AnnelingProcess> {
  TextEditingController alertDialog3controller = TextEditingController();
  TextEditingController searchbyplancontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    searchbyplancontroller.dispose();
    super.dispose();
  }

  List<AnnealingPlanData?> annealingPlanListdata = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AnnealingPlanListProvider>(
      context,
      listen: false,
    ).gettingAnnealingPlanList().then((value) {
      if (value?.data != null) {
        annealingPlanListdata.clear();
        annealingPlanListdata.addAll(value!.data!);
        print("  245c ${annealingPlanListdata.length}");
      } else {
        print(annealingPlanListdata.length);
      }
    });
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
              ? Expanded(
                child: ListView.builder(
                  itemCount: annealingPlanListdata.length,
                  itemBuilder: (BuildContext, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: ContainerWidgetforAnneling(
                            textnameforcrm: "Select",
                            batchNo:
                                annealingPlanListdata[index]?.batchNo
                                    .toString(),
                            supplierIdNo:
                                annealingPlanListdata[index]?.inwardId,
                            length: annealingPlanListdata[index]?.length,
                            widht: annealingPlanListdata[index]?.width,
                            weight: annealingPlanListdata[index]?.weight,
                            boundlNo: annealingPlanListdata[index]?.id,
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnnelingProcess2(),
                                ),
                              );
                            },
                          ),
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
