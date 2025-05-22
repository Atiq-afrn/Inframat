import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/widgets/dashboard_widget.dart';

class Bhome extends StatefulWidget {
  const Bhome({super.key, required this.sessionId});
  final String sessionId;

  @override
  State<Bhome> createState() => _BhomeState();
}

class _BhomeState extends State<Bhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Invard()),
                    // );
                  },
                  child: DashboardWidget(
                    imagename: AppImages.invardimage,
                    textname: "Inward",
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    //  Navigator.push(
                    //  context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CoilSlittingScreen(),
                    //   ),
                    // );
                  },
                  child: DashboardWidget(
                    imagename: AppImages.coilslittingDash,
                    textname: "coil slitting",
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PiicklingProcess()),
                // );
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  DashboardWidget(
                    imagename: AppImages.picklingprocess,
                    textname: "Pickling Process",
                  ),

                  DashboardWidget(
                    imagename: AppImages.crmcoldrolling,
                    textname: "CRM (Cold rolling mill)",
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ContinuousGalvanizingline(),
                //   ),
                // );
              },
              child: Row(
                children: [
                  SizedBox(width: 5),
                  DashboardWidget(
                    imagename: AppImages.continuousgalvanizingline,
                    textname: "Continuous Ganlvanizing \nLine",
                  ),

                  DashboardWidget(
                    imagename: AppImages.anneling,
                    textname: "Anneling",
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 5),
                DashboardWidget(
                  imagename: AppImages.skinpass,
                  textname: "Sking Pass",
                ),

                DashboardWidget(
                  imagename: AppImages.tubemill,
                  textname: "Tube Mill",
                ),
              ],
            ),

            Row(
              children: [
                SizedBox(width: 5),
                DashboardWidget(
                  imagename: AppImages.cuttingprocess,
                  textname: "Cutting Process",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
