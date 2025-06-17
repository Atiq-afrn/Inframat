import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/screens/mini%20coil%20slitting/mini_coilslitting2.dart';

class ContainerWidgetForMiniCoilSlitting extends StatefulWidget {
  const ContainerWidgetForMiniCoilSlitting({
    super.key,
    this.textnameforcrm,
    this.batchNo,
    this.length,
    this.width,
    this.weight,
    this.inwardId,
    this.planId,
    this.image,
  });
  final String? textnameforcrm;
  final String? batchNo;
  final String? length;
  final String? width;
  final String? weight;
  final String? inwardId;
  final String? planId;
  final dynamic image;

  @override
  State<ContainerWidgetForMiniCoilSlitting> createState() =>
      _ContainerWidgetForMiniCoilSlittingState();
}

class _ContainerWidgetForMiniCoilSlittingState
    extends State<ContainerWidgetForMiniCoilSlitting> {
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
                  widget.batchNo.toString(),
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
                  widget.inwardId.toString(),
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
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
                  " ${widget.length}MM x ${widget.width} MM x GR-1 x TATA",
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
                  " ${widget.weight}",
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
                  "Planning :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  " ${widget.planId}",
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Minicoilslitting2(
                        batchNo: widget.batchNo,
                        inwardId: widget.inwardId,
                        length: widget.length,
                        width: widget.width,
                        weight: widget.weight,
                        planId: widget.planId,
                      ),
                ),
              );
            },
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
