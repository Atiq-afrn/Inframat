import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';

class CustomeTextfield extends StatelessWidget {
  CustomeTextfield({
    super.key,
    required this.texthint,
    this.iconname,
    this.customTextcontroller,
  });
  final String texthint;
  final Widget? iconname;

  TextEditingController? customTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * .85,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Appcolor.greycolor)),
          color: Appcolor.lightgrey2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: TextField(
              controller: customTextcontroller,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                suffixIcon: iconname,
                hintText: texthint,
                hintStyle: TextStyle(color: Appcolor.greycolor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
