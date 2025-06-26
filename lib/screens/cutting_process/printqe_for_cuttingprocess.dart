import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/cuttingprocess_model.dart';
import 'package:inframat/provider/print_qr_coder_provider.dart';
import 'package:inframat/screens/dashboard2.dart';
import 'package:provider/provider.dart';

class PrintqrforCuttingProcess extends StatefulWidget {
  const PrintqrforCuttingProcess({super.key, this.batchNo, this.coilno});
  final CuttingProcessSaveData? batchNo;
  final String? coilno;

  @override
  State<PrintqrforCuttingProcess> createState() =>
      _PrintqrforCuttingProcessState();
}

class _PrintqrforCuttingProcessState extends State<PrintqrforCuttingProcess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? apiImageUrl;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${widget.batchNo}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),

                    Text(
                      "${widget.batchNo?.id} ",
                      style: TextStyle(fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<PrintQrCoderProvider>(
                          context,
                          listen: false,
                        ).gettingqrCodeData(widget.batchNo!.batchNo!).then((
                          value,
                        ) {
                          if (value != null) {
                            apiImageUrl = value.imageUrl;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("QR Code not found")),
                            );
                          }
                        });
                      },
                      child: Container(
                        height: 24,
                        width: MediaQuery.of(context).size.width * .21,
                        decoration: BoxDecoration(
                          color: Appcolor.lightred2,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    ),
                    GestureDetector(
                      onTap: () {
                        openDialoge4(apiImageUrl ?? "not found");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
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
                SizedBox(height: 15),
                SizedBox(height: 15),

                SizedBox(height: MediaQuery.of(context).size.width * .9),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard2()),
                    );
                  },
                  child: Container(
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
                ),
                SizedBox(height: MediaQuery.of(context).size.width * .05),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future openDialoge4(String imageUrl) async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Appcolor.whitecolor,
            actions: [
              SizedBox(height: 30),

              SizedBox(height: 20),

              Center(
                child: Text(
                  "Print QR Code",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              Container(
                height: 150,
                width: double.infinity,
                color: Appcolor.lightgrey,
                child: Center(
                  child:
                      imageUrl == "not found"
                          ? Text("QR Code not found press print to generate")
                          : Image.network(imageUrl, fit: BoxFit.fill),
                ),
                //Image.asset(fit: BoxFit.fill, AppImages.coilstock),
              ),

              SizedBox(height: 30),
            ],
          ),
    );
  }
}
