import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/screens/coil_sliting_screen2.dart';
import 'package:inframat/screens/coil_slitting_screen.dart';
import 'package:inframat/screens/coilsliting_open_camera.dart';
import 'package:inframat/screens/mini%20coil%20slitting/mini_coil_slitting3.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Minicoilslitting2 extends StatefulWidget {
  const Minicoilslitting2({super.key});

  @override
  State<Minicoilslitting2> createState() => _Minicoilslitting2State();
}

class _Minicoilslitting2State extends State<Minicoilslitting2> {
  TextEditingController alertDialog3controller = TextEditingController();
  TextEditingController searchbyplancontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    searchbyplancontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        title: Text("Mini Coil slitting"),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Appcolor.greycolor,
        actions: [Icon(Icons.date_range_outlined)],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    border: Border.all(width: 1, color: Appcolor.greycolor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Plan", style: TextStyle(fontSize: 18)),
                  ),
                ),
                Container(
                  height: 31,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: BoxDecoration(
                    color: Appcolor.deepPurple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Issue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.whitecolor,
                      ),
                    ),
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
            ContainerWidget(onSelect: () {}),
          ],
        ),
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

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key, required Null Function() onSelect});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Planning :",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text("01", style: TextStyle(color: Appcolor.greycolor)),
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
              _showAlertDialog();
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
                    "Proceed",
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

  List<File?> selectedImages = [];
  TextEditingController searchcontroller = TextEditingController();
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: Appcolor.whitecolor,
              contentPadding: const EdgeInsets.all(10),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.9, // reduced width
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 27,
                            width: MediaQuery.of(context).size.width * .18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Appcolor.greycolor,
                                width: 1,
                              ),
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
                              border: Border.all(
                                color: Appcolor.lightpurple,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              border: Border.all(
                                color: Appcolor.greycolor,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                            "ADD NEW IM COIL SLITTING NO",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ...List.generate(selectedImages.length, (index) {
                        return buildItemBlock(
                          index,
                          selectedImages[index],
                          (newImage) {
                            setState(() => selectedImages[index] = newImage);
                            setDialogState(() {});
                          },
                          index == selectedImages.length - 1 &&
                                  selectedImages.length < 3
                              ? () {
                                setState(() => selectedImages.add(null));
                                setDialogState(() {});
                              }
                              : null,
                        );
                      }),
                      if (selectedImages.isEmpty)
                        buildItemBlock(
                          0,
                          null,
                          (newImage) {
                            setState(() => selectedImages.add(newImage));
                            setDialogState(() {});
                          },
                          () {
                            setState(() => selectedImages.add(null));
                            setDialogState(() {});
                          },
                        ),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Scrap",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                              color: Colors.white,
                              child: const TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "00.00",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const Text("MT"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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

                          searchcontroller.text.isNotEmpty
                              ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CoilSlitingScreen2(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width * .3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Appcolor.deepPurple,
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
                              )
                              : GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CoilSlitingScreen2(),
                                    ),
                                  );
                                },
                                child: Container(
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
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildItemBlock(
    int index,
    File? selectedImage,
    Function(File) onImageSelected,
    VoidCallback? onAddPressed,
    //  TextEditingController? actualWeightController
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              String.fromCharCode(65 + index), // A, B, C...
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            if (onAddPressed != null)
              GestureDetector(
                onTap: onAddPressed,
                child: const Icon(Icons.add_circle_outline, size: 25),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 43,
          width: double.infinity,
          color: Colors.grey[300],
          child: Container(
            height: 43,
            width: double.infinity,
            color: Appcolor.lightgrey,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                // First TextField
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Appcolor.whitecolor,
                      border: Border.all(color: Appcolor.greycolor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "00.00",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(width: 6),
                const Text("MM x"),

                const SizedBox(width: 6),

                // Second TextField
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Appcolor.whitecolor,
                      border: Border.all(color: Appcolor.greycolor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "3.00",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(width: 6),
                const Text("MM x CR-2 x SAIL"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
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
                color: Colors.white,
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "00.00",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Text("MT"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Actual Weight",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * .37,
              color: Appcolor.lightgrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * .17,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: TextField(
                        textAlign: TextAlign.center,

                        // controller: actualWeightController,
                        decoration: InputDecoration(
                          hintText: "00.00",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Text("(in MT)"),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        selectedImage == null
            ? GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedImage = await picker.pickImage(
                  source: ImageSource.camera,
                );
                if (pickedImage != null) {
                  onImageSelected(File(pickedImage.path));
                }
              },
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey[200],
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: 8),
                      Text("Take Picture"),
                    ],
                  ),
                ),
              ),
            )
            : Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(selectedImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
        const Divider(thickness: 1),
      ],
    );
  }
}
