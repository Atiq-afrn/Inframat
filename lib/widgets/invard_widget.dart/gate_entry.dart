import 'package:flutter/material.dart';
import 'package:inframat/const/Color.dart';

class GateEntry extends StatelessWidget {
  const GateEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 27,
              width: 27,
              decoration: BoxDecoration(
                color: Appcolor.deepPurple,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.info_outlined, color: Appcolor.whitecolor),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: 1,
              color: Colors.black,
            ),
            Container(
              height: 27,
              width: 27,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Appcolor.greycolor),
              ),
              child: Center(
                child: Icon(Icons.circle, size: 5, color: Appcolor.greycolor),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20),
            Text("Gate Entry"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text("Quality Check"),
            ),
          ],
        ),
      ],
    );
  }
}
