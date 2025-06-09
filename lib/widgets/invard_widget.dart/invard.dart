import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/models/invard_model2.dart';

import 'package:inframat/widgets/invard_widget.dart/custome_textfield.dart';
import 'package:inframat/widgets/invard_widget.dart/gate_entry.dart';
import 'package:inframat/widgets/invard_widget.dart/invard2.dart';
import 'package:inframat/widgets/invard_widget.dart/invard_file_upload.dart';
import 'package:inframat/widgets/invard_widget.dart/next_container.dart';

class Invard extends StatefulWidget {
  const Invard({super.key});

  @override
  State<Invard> createState() => _InvardState();
}

class _InvardState extends State<Invard> {
  TextEditingController vehiclenumbercontroller = TextEditingController();
  TextEditingController vechilePhotoController = TextEditingController();
  //TextEditingController vehicleInTimeController = TextEditingController();
  TextEditingController transportNameController = TextEditingController();
  TextEditingController driverNameController = TextEditingController();
  TextEditingController driverMobileNumberController = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  //dynamic selectedImage;
  String? base64image = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey.withValues(alpha: .5),
        title: Text("Inward of goods"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Transportation",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            GateEntry(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 700,
                width: MediaQuery.of(context).size.width * 8,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Appcolor.greycolor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Vehicle No "),
                    ),
                    SizedBox(height: 7),

                    CustomeTextfield(
                      texthint: "Enter Vehicle No",
                      customTextcontroller: vehiclenumbercontroller,
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Vehicle Photo"),
                    ),

                    SizedBox(height: 7),

                    InvardFileUpload(
                      ongettingImage: (values) {
                        setState(() {
                          base64image = values;
                        });
                      },
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Vehicle In Time"),
                    ),
                    SizedBox(height: 6),
                    CustomeTextfield(
                      customTextcontroller: timecontroller,
                      texthint: "dd-mm-yyyy",
                      iconname: GestureDetector(
                        onTap: () {
                          datepicker();
                        },
                        child: Icon(Icons.date_range),
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Transport Name"),
                    ),
                    SizedBox(height: 8),
                    CustomeTextfield(
                      texthint: "Enter Transport Name",
                      customTextcontroller: transportNameController,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Driver Name"),
                    ),
                    SizedBox(height: 8),
                    CustomeTextfield(
                      texthint: "Enter Driver name",
                      customTextcontroller: driverNameController,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Driver Mobile No"),
                    ),
                    SizedBox(height: 8),
                    CustomeTextfield(
                      keyboardtype: TextInputType.phone,
                      texthint: "Enter Driver No",
                      customTextcontroller: driverMobileNumberController,
                    ),

                    SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        InvardModel invardModel1 = InvardModel(
                          vehicleNumber: vehiclenumbercontroller.text,
                          vehiclePhotoBase64: base64image,
                          vehicleInTime: timecontroller.text,
                          transpotName: transportNameController.text,
                          driverName: driverNameController.text,
                          driverMobileNumber: driverMobileNumberController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Invard2(invardvalue: invardModel1),
                          ),
                        );
                      },
                      child: Center(child: NextContainer(textname: "Next")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> datepicker() async {
    // Pick a date
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Pick a time
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine date and time
        final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Format the DateTime
        final String formattedDateTime =
            "${fullDateTime.day.toString().padLeft(2, '0')}-"
            "${fullDateTime.month.toString().padLeft(2, '0')}-"
            "${fullDateTime.year} "
            "${fullDateTime.hour.toString().padLeft(2, '0')}:"
            "${fullDateTime.minute.toString().padLeft(2, '0')}";

        setState(() {
          timecontroller.text = formattedDateTime;
        });
      }
    }
  }
}
