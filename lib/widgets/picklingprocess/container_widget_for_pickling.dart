import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/widgets/picklingprocess/pickling_process2.dart';

class ContainerWidgetforpickling extends StatefulWidget {
  const ContainerWidgetforpickling({super.key, this.textnameforpickling});
  final String? textnameforpickling;

  @override
  State<ContainerWidgetforpickling> createState() =>
      _ContainerWidgetforpicklingState();
}

class _ContainerWidgetforpicklingState
    extends State<ContainerWidgetforpickling> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                Text(" 230948 ", style: TextStyle(color: Appcolor.greycolor)),
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
                  "(We need to bring from MRN screen) ",
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
                  "  250 MM x 0.70 MM x GR-1 x TATA",
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
                Text(" 7.56 MT", style: TextStyle(color: Appcolor.greycolor)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Plan no :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(" 01", style: TextStyle(color: Appcolor.greycolor)),
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
                MaterialPageRoute(builder: (context) => PiicklingProcess2()),
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
                    widget.textnameforpickling.toString(),
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

  Future alertDialog1() async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Appcolor.whitecolor,
            actions: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 27,
                    width: MediaQuery.of(context).size.width * .18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Appcolor.greycolor, width: 1),
                    ),
                    child: Center(
                      child: Text(
                        "Started 9 P.M",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  Container(
                    height: 27,
                    width: MediaQuery.of(context).size.width * .18,
                    decoration: BoxDecoration(
                      color: Appcolor.lightpurple,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Appcolor.lightpurple, width: 1),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "00:30 :55",
                            style: TextStyle(
                              fontSize: 10,
                              color: Appcolor.whitecolor,
                            ),
                          ),
                          Icon(
                            Icons.watch_later_outlined,
                            color: Appcolor.whitecolor,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 27,
                    width: MediaQuery.of(context).size.width * .18,
                    decoration: BoxDecoration(
                      color: Appcolor.gcol,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: Appcolor.greycolor, width: 1),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.pause,
                            color: Appcolor.whitecolor,
                            size: 15,
                          ),
                          Text(
                            "Pause",
                            style: TextStyle(
                              fontSize: 10,
                              color: Appcolor.whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "ADD New IM pickiling No",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Container(
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
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "00.00",
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Text("MM x"),
                    Container(
                      height: 30,

                      width: MediaQuery.of(context).size.width * .11,

                      decoration: BoxDecoration(
                        color: Appcolor.whitecolor,
                        border: Border.all(color: Appcolor.greycolor),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "3.300",

                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    Text("MMX CR-2 x SAIL"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 43,
                width: double.infinity,
                color: Appcolor.lightgrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * .5,
                      color: Appcolor.whitecolor,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "00.00",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Text("MT"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Actual Weight",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .37,
                    color: Appcolor.lightgrey2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * .17,
                          color: Appcolor.whitecolor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Text("(in MT)"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pickling Loss",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .37,
                    color: Appcolor.lightgrey2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * .17,
                          color: Appcolor.whitecolor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Text("(in MT)"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width * .8,
                color: Appcolor.lightgrey2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    SizedBox(width: 6),
                    Text("Take Pickture"),
                  ],
                ),
              ),
              SizedBox(height: 120),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Appcolor.red,
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Appcolor.whitecolor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.greycolor,
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,

                          color: Appcolor.whitecolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
