import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/screens/crm_cold_mill/crm_cold_mill2.dart';
import 'package:inframat/screens/galvanizing_line/continous_g_l_2.dart';
import 'package:inframat/widgets/picklingprocess/pickling_process2.dart';

class Containerwidgetforcgl extends StatefulWidget {
  const Containerwidgetforcgl({
    super.key,
    this.batchNo,
    this.planningNo,
    this.size,
    this.lenght,
    this.supplierIdNo,
    this.weight,
    this.textnameforcrm,
  });
  final String? textnameforcrm;
  final String? batchNo;
  final String? supplierIdNo;
  final String? size;
  final String? lenght;
  final String? weight;
  final String? planningNo;

  @override
  State<Containerwidgetforcgl> createState() => _ContainerwidgetforcglState();
}

class _ContainerwidgetforcglState extends State<Containerwidgetforcgl> {
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
                  widget.supplierIdNo.toString(),
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
                  widget.size.toString(),
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
                  "${widget.weight}  MT",
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
                  "Planning No :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.planningNo!,
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
                      (context) => Continousgalvanizingline2(
                        batchNo: widget.batchNo,
                        supplierIdNo: widget.supplierIdNo,
                        size: widget.size,
                        length: widget.lenght,
                        weight: widget.weight,
                        planningNO: widget.planningNo,
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
