import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/models/invard_model2.dart';
import 'package:inframat/models/invards_model.dart';
import 'package:inframat/models/sub_category_model.dart';
import 'package:inframat/provider/sub_category_provider.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:inframat/widgets/invard_widget.dart/custome_textfield.dart';
import 'package:inframat/widgets/invard_widget.dart/drop_down1_catagory.dart';
import 'package:inframat/widgets/invard_widget.dart/drop_down2_catagory.dart';
import 'package:inframat/widgets/invard_widget.dart/gate_entry.dart';
import 'package:inframat/widgets/invard_widget.dart/invard3.dart';
import 'package:inframat/widgets/invard_widget.dart/invard_file_upload.dart';
import 'package:inframat/widgets/invard_widget.dart/next_container.dart';
import 'package:provider/provider.dart';

class Invard2 extends StatefulWidget {
  Invard2({super.key, this.invardvalue});
  InvardModel? invardvalue;

  @override
  State<Invard2> createState() => _Invard2State();
}

class _Invard2State extends State<Invard2> {
  TextEditingController goodPhototcontroller = TextEditingController();
  TextEditingController itemQtyController = TextEditingController();
  TextEditingController recieveqtyController = TextEditingController();
  TextEditingController picesController = TextEditingController();
  TextEditingController goodsTicketNoController = TextEditingController();
  TextEditingController loadedWeightController = TextEditingController();
  TextEditingController emptyWeightController = TextEditingController();
  TextEditingController netWeightController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();

  dynamic dropDownVal1 = "";
  String? dropDownVal2 = "";
  String? imageValue = "";
  String? catid = "";
  getvalues() async {
    print("${widget.invardvalue!.vehicleNumber}");

    print("${widget.invardvalue!.vehicleInTime}");
    print("${widget.invardvalue!.transpotName}");
    print("${widget.invardvalue!.driverName}");
    print("${widget.invardvalue!.driverMobileNumber}");
  }

  @override
  void initState() {
    getvalues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey.withValues(alpha: .6),
        title: Text("Inward Goods 2"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "General Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GateEntry(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                // height: 800,
                width: MediaQuery.of(context).size.width * 8,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Appcolor.greycolor),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Catagory"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * .85,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Appcolor.greycolor),
                            ),
                            color: Appcolor.lightgrey2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: DropDown1Catagory(
                                  onSelected: (value) async {
                                    // _gettingSubCategory();
                                    // setState(() {
                                    //   dropDownVal1 = value;
                                    // });
                                    print(value!.id);
                                    setState(() {
                                      catid = value.id.toString();
                                      dropDownVal1 = value.id.toString();
                                    });
                                    // await AppStorage.storeCategoryId(
                                    //   value.id.toString(),
                                    // );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Sub_Catagory "),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * .85,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Appcolor.greycolor),
                            ),
                            color: Appcolor.lightgrey2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: DropDownCatagory(
                                  id: catid,

                                  onSelected: (value) {
                                    setState(() {
                                      dropDownVal2 = value!.id.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Goods Photo "),
                      ),
                      SizedBox(height: 7),

                      InvardFileUpload(
                        ongettingImage: (values) {
                          setState(() {
                            imageValue = values;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Item Name"),
                          Text("Qty mty"),
                          Text("Recieved Qty"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * .85,
                          color: Appcolor.lightgrey2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * .2,
                                decoration: BoxDecoration(
                                  color: Appcolor.whitecolor,
                                ),
                                child: TextField(
                                  controller: itemNameController,
                                  decoration: InputDecoration(
                                    hintText: "item name",
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * .2,
                                decoration: BoxDecoration(
                                  color: Appcolor.whitecolor,
                                  border: Border.all(
                                    width: 1,
                                    color: Appcolor.greycolor,
                                  ),
                                ),
                                child: TextField(
                                  controller: itemQtyController,
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: "Enter Qty",
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * .2,
                                decoration: BoxDecoration(
                                  color: Appcolor.whitecolor,
                                  border: Border.all(
                                    width: 1,
                                    color: Appcolor.greycolor,
                                  ),
                                ),
                                child: Center(
                                  child: TextField(
                                    controller: recieveqtyController,
                                    decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: "Enter Unit",
                                      hintStyle: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Pices (PCS)"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter Pices(PCS)",
                        customTextcontroller: picesController,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Ticket No"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter Ticket No",
                        customTextcontroller: goodsTicketNoController,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Loaded Weight"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter Loaded Weight",
                        customTextcontroller: loadedWeightController,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Empty Weight"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter Empty Weight",
                        customTextcontroller: emptyWeightController,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Net Weight"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter net Weight",
                        customTextcontroller: netWeightController,
                      ),

                      SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          InvardModel invardModel2 = InvardModel(
                            vehicleNumber: widget.invardvalue!.vehicleNumber,
                            vehiclePhotoBase64:
                                widget.invardvalue!.vehiclePhotoBase64,
                            vehicleInTime: widget.invardvalue?.vehicleInTime,
                            transpotName: widget.invardvalue?.transpotName,
                            driverName: widget.invardvalue?.driverName,
                            driverMobileNumber:
                                widget.invardvalue?.driverMobileNumber,
                            catagory: dropDownVal1,
                            subCatagory: dropDownVal2,
                            gooodsPhotoBase64: imageValue,
                            itemQuantity: itemQtyController.text,
                            recievedQty: recieveqtyController.text,
                            pices: picesController.text,
                            ticketNo: goodsTicketNoController.text,
                            loadedWeight: loadedWeightController.text,
                            emptyWeight: emptyWeightController.text,
                            netWeight: netWeightController.text,
                            itemName: itemNameController.text,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      Invard3(invardAllPageValue: invardModel2),
                            ),
                          );
                        },
                        child: Center(child: NextContainer(textname: "Next")),
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
