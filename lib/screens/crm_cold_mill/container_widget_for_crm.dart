import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/screens/crm_cold_mill/crm_cold_mill2.dart';

class Containerwidgetforcrm extends StatefulWidget {
  const Containerwidgetforcrm({
    super.key,
    this.textnameforcrm,
    this.batchNo,
    this.supplierID,
    this.size,
    this.width,
    this.weight,
  });
  final String? textnameforcrm;
  final String? batchNo;
  final String? supplierID;
  final String? size;
  final String? width;
  final String? weight;

  @override
  State<Containerwidgetforcrm> createState() => _ContainerwidgetforcrmState();
}

class _ContainerwidgetforcrmState extends State<Containerwidgetforcrm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
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
                  widget.batchNo!,
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
                  widget.supplierID!,
                  style: TextStyle(color: Appcolor.greycolor),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 43,
              width: double.infinity,
              color: Appcolor.lightgrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,

                    width: MediaQuery.of(context).size.width * .11,

                    decoration: BoxDecoration(
                      color: Appcolor.whitecolor,
                      border: Border.all(color: Appcolor.greycolor),
                    ),
                    child: Center(child: Text(widget.size!)),
                  ),
                  Text("MM x"),
                  Container(
                    height: 30,

                    width: MediaQuery.of(context).size.width * .11,

                    decoration: BoxDecoration(
                      color: Appcolor.whitecolor,
                      border: Border.all(color: Appcolor.greycolor),
                    ),
                    child: Center(child: Text(widget.width!)),
                  ),

                  Text("MMX CR-2 x SAIL"),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),

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
                  widget.weight!,
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

          SizedBox(height: MediaQuery.of(context).size.width * .05),
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
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Crmcoldmill2(
                        batchno: widget.batchNo,
                        supplieridNO: widget.supplierID,
                        size: widget.size,
                        width: widget.width,
                        actualWeight: widget.weight,
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
