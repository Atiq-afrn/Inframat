import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/models/invard_model2.dart';
import 'package:inframat/provider/invards_all_details_provider.dart';
import 'package:inframat/screens/vendors_search_list.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:inframat/widgets/invard_widget.dart/invard4.dart';
import 'package:inframat/widgets/invard_widget.dart/custome_textfield.dart';
import 'package:inframat/widgets/invard_widget.dart/gate_entry.dart';
import 'package:inframat/widgets/invard_widget.dart/invard_file_upload.dart';
import 'package:inframat/widgets/invard_widget.dart/next_container.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class Invard3 extends StatefulWidget {
  Invard3({super.key, this.invardAllPageValue});
  InvardModel? invardAllPageValue;

  @override
  State<Invard3> createState() => _Invard3State();
}

class _Invard3State extends State<Invard3> {
  TextEditingController vendorsNameController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController docNoController = TextEditingController();
  TextEditingController poNoController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController vendorsTicketNo = TextEditingController();
  TextEditingController vendorsNameController1 = TextEditingController();
  String? invoiceImageBase64 = "";
  String? pieces = "";
  String? inwardId;
  Future<String?> getinwardId() async {
    inwardId = await AppStorage.gettinginwardId();
    return inwardId;
  }

  getvalue() {
    print("${widget.invardAllPageValue!.netWeight} netwight");
    print("${widget.invardAllPageValue!.catagory}");
    print("${widget.invardAllPageValue!.subCatagory} subcat");
    print("${widget.invardAllPageValue!.itemName} xyz");
    print("${widget.invardAllPageValue!.itemQuantity}");
    print("${widget.invardAllPageValue!.recievedQty}");
    print("${widget.invardAllPageValue!.pices}");
    print("${widget.invardAllPageValue!.ticketNo}");
    print("${widget.invardAllPageValue!.loadedWeight}");
    print("${widget.invardAllPageValue!.emptyWeight}");
    print("${widget.invardAllPageValue!.gooodsPhotoBase64}");
  }

  // List<String> vendorsList = ["Atiq", "abhishek", "John Doe"];
  // List<String> filteredVendorsList = [];
  // FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: .5),
        title: Text("Inward Good 3"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Vendor Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GateEntry(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 800,
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
                        child: Text("Vendor Name"),
                      ),

                      SizedBox(height: 8),
                      // CustomeTextfield(
                      //   texthint: "Enter Vendor name",
                      //   suffixIconName: Icon(Icons.search),
                      // ),
                      VendorsSearchDropdown(
                        onVendorSelected: (vendorId, vendorName) {
                          setState(() {
                            vendorsNameController.text = vendorName;
                            widget.invardAllPageValue!.vendorsName = vendorName;
                          });

                          print("Selected Vendor ID: $vendorId");
                        },
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Invoice Photo "),
                      ),
                      SizedBox(height: 7),

                      InvardFileUpload(
                        ongettingImage: (values) {
                          setState(() {
                            invoiceImageBase64 = values;
                          });
                        },
                      ),
                      SizedBox(height: 15),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Invoice Date)"),
                      ),
                      CustomeTextfield(
                        customTextcontroller: dateController,
                        texthint: "dd-mm-yyyy",
                        iconname: GestureDetector(
                          onTap: () {
                            datepicker();
                          },
                          child: Icon(Icons.date_range),
                        ),
                      ),
                      SizedBox(height: 8),

                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Item Description"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter description",
                        customTextcontroller: itemDescriptionController,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Doc No"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter Doc number",
                        customTextcontroller: docNoController,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("PO NO"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter PO Number",
                        customTextcontroller: poNoController,
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Remark"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter Remark",
                        customTextcontroller: remarkController,
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Ticket NO"),
                      ),
                      SizedBox(height: 8),
                      CustomeTextfield(
                        texthint: "Enter Ticket No",
                        customTextcontroller: vendorsNameController,
                      ),
                      SizedBox(height: 20),

                      SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          InvardModel invardModel3 = InvardModel(
                            vehicleNumber:
                                widget.invardAllPageValue!.vehicleNumber,
                            vehiclePhotoBase64:
                                widget.invardAllPageValue!.vehiclePhotoBase64,
                            vehicleInTime:
                                widget.invardAllPageValue!.vehicleInTime,
                            transpotName:
                                widget.invardAllPageValue?.transpotName,
                            driverName: widget.invardAllPageValue!.driverName,
                            driverMobileNumber:
                                widget.invardAllPageValue!.driverMobileNumber
                                    .toString(),

                            catagory: widget.invardAllPageValue!.catagory,
                            subCatagory: widget.invardAllPageValue!.subCatagory,
                            gooodsPhotoBase64:
                                widget.invardAllPageValue!.gooodsPhotoBase64,
                            itemName: widget.invardAllPageValue!.itemName,
                            itemQuantity:
                                widget.invardAllPageValue!.itemQuantity,
                            recievedQty: widget.invardAllPageValue!.recievedQty,
                            pices: widget.invardAllPageValue!.pices,
                            ticketNo: widget.invardAllPageValue!.ticketNo,
                            loadedWeight:
                                widget.invardAllPageValue!.loadedWeight,
                            emptyWeight: widget.invardAllPageValue!.emptyWeight,
                            netWeight: widget.invardAllPageValue!.netWeight,

                            vendorsName: vendorsNameController.text,
                            invoiceImageBase64: invoiceImageBase64,
                            invoiceDate: dateController.text,
                            itemDescription: itemDescriptionController.text,
                            docNo: docNoController.text,
                            poNo: poNoController.text,
                            remark: remarkController.text,
                            vendorsTicketNo: vendorsTicketNo.text,
                          );
                          Provider.of<InvardsAllDetailsProvider>(
                            context,
                            listen: false,
                          ).getInertInvardsDetails(invardModel3).then((
                            value,
                          ) async {
                            if (value?.status == "success") {
                              _storeInward(value!.inwardId.toString());

                              pieces = value.pieces.toString();
                              print("data inserted successfully");
                              print(
                                " inward id ==${value.inwardId.toString()}",
                              );
                            } else {
                              print("error");
                            }
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Invard4(pieces: pieces),
                            ),
                          );
                        },
                        child: Center(
                          child: NextContainer(textname: "Submit your Request"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [const SizedBox(height: 8)],
          ),
        ),
      ),
    );
  }

  Future<void> datepicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = pickedDate.toString().split(" ")[0];
      });
    }
  }

  void _storeInward(String string) async {
    print("009 $string");
    await AppStorage.storeInwardId(string);
  }
}
