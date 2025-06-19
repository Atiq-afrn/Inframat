import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/provider/print_qr_coder_provider.dart';
import 'package:provider/provider.dart';

class InvardBarcode extends StatefulWidget {
  const InvardBarcode({super.key,this.batchNo});
  final String? batchNo;

  @override
  State<InvardBarcode> createState() => _InvardBarcodeState();
}

class _InvardBarcodeState extends State<InvardBarcode> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PrintQrCoderProvider>(context).gettingqrCodeData(widget.batchNo!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey.withValues(alpha: 0.5),
        title: Text("Home"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              height: 31,
              width: MediaQuery.of(context).size.width * .95,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Appcolor.deepPurple),
              ),
              child: Center(
                child: Text(
                  "Printing",
                  style: TextStyle(fontSize: 17, color: Appcolor.deepPurple),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * .95,

            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Appcolor.greycolor),
            ),
            child: Column(
              children: [
                Container(
                  height: 49,
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    color: Appcolor.lightgrey2,
                    border: Border(
                      bottom: BorderSide(width: 1, color: Appcolor.greycolor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * .02,
                        ),
                        child: Text("Batch No"),
                      ),
                      Text("Coil No"),
                      Text("QR Code"),
                      Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * .02,
                        ),
                        child: Text("View"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.width * .6,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      "03-25A-0651",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),

                                  Text("1", style: TextStyle(fontSize: 12)),
                                  Container(
                                    height: 24,
                                    width:
                                        MediaQuery.of(context).size.width * .23,
                                    decoration: BoxDecoration(
                                      color: Appcolor.lightred2,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Print",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(Icons.print, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      openDialoge4();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          color: Appcolor.deepPurple,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Appcolor.whitecolor,
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
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * .9),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .9,
                  color: Appcolor.deepPurple,
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * .05),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future openDialoge4() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Appcolor.whitecolor,
            actions: [
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Batch /ID no.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(": 03-25B-0651"),
                ],
              ),

              Row(
                children: [
                  Text(
                    "size Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("  :250 MM x 0.70 MM x\n   GR-1 x TATA"),
                ],
              ),

              Row(
                children: [
                  Text(
                    "Mill Wt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" :  13.456"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "No Of Pices",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" : 140"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Qty Mt",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" : 21.056"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "W/P",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(" : 3.65"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Supplier MRN Coil ID :",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text("294834343"),
                ],
              ),
              SizedBox(height: 10),

              Container(
                height: 150,
                width: double.infinity,
                color: Appcolor.lightgrey,
                child: Image.asset(fit: BoxFit.fill, AppImages.coilstock),
              ),

              SizedBox(height: 30),
            ],
          ),
    );
  }
}
