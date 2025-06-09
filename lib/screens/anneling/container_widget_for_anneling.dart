import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';

class ContainerWidgetforAnneling extends StatefulWidget {
  const ContainerWidgetforAnneling({
    super.key,
    this.textnameforcrm,
    this.ontap,
    this.batchNo,
    this.supplierIdNo,
    this.length,
    this.widht,
    this.weight,
    this.boundlNo,
  });
  final String? textnameforcrm;
  final VoidCallback? ontap;

  final String? batchNo;
  final String? supplierIdNo;
  final String? length;
  final String? widht;
  final String? weight;
  final String? boundlNo;
  @override
  State<ContainerWidgetforAnneling> createState() =>
      _ContainerWidgetforAnnelingState();
}

class _ContainerWidgetforAnnelingState
    extends State<ContainerWidgetforAnneling> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Appcolor.whitecolor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            offset: Offset(0, 5),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Batch no  : ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  " ${widget.batchNo}",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Supplier Id no : ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.supplierIdNo} ",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Size :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),

                Text(
                  " ${widget.length} MM x ${widget.widht}   MM x GR-1 x TATA",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Weight :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.weight}",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Bundle no:",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  " ${widget.boundlNo}",
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Plans Details :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolor.lightred,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text("Planning details as given planning department"),
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: widget.ontap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolor.deepPurple,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    widget.textnameforcrm.toString(),
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.whitecolor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
