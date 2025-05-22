import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';

class RecoveryProcessCustomeWidget extends StatefulWidget {
  const RecoveryProcessCustomeWidget({super.key, this.buttonName});
  final String? buttonName;

  @override
  State<RecoveryProcessCustomeWidget> createState() =>
      _RecoveryProcessCustomeWidgetState();
}

class _RecoveryProcessCustomeWidgetState
    extends State<RecoveryProcessCustomeWidget> {
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * .39,

          child: Row(
            children: [
              Checkbox(
                value: ischecked,

                activeColor: Appcolor.deepPurple,
                onChanged: (values) {
                  setState(() {
                    ischecked = values;
                  });
                },
              ),

              Text(
                widget.buttonName!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            height: 55,
            width: MediaQuery.of(context).size.width * .5,
            decoration: BoxDecoration(
              color: Appcolor.lightgrey,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width * .48,
                decoration: BoxDecoration(
                  color: Appcolor.whitecolor,
                  border: Border.all(width: 1, color: Appcolor.greycolor),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "000",
                        hintStyle: TextStyle(color: Appcolor.greycolor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
