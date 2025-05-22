import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
    required this.imagename,
    required this.textname,
  });
  final String textname;
  final String imagename;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * .49,

      child: Card(
        elevation: 6,
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              child: Image.asset(fit: BoxFit.fill, imagename),
            ),
            SizedBox(height: 6),
            Text(textname, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
