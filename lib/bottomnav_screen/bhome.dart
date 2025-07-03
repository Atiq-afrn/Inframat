import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/dashboard_model.dart';
import 'package:inframat/provider/dashboard_process_provider.dart';
import 'package:inframat/widgets/dashboard_widget.dart';
import 'package:provider/provider.dart';

class Bhome extends StatefulWidget {
  const Bhome({super.key, required this.sessionId});
  final String sessionId;

  @override
  State<Bhome> createState() => _BhomeState();
}

class _BhomeState extends State<Bhome> {
  @override
  List<StageData>? data;
  Future<void> gettingDashboarditems() async {
    Provider.of<DashboardProcessProvider>(
      context,
      listen: false,
    ).gettingDashBoardItems().then((value) {
      if (value != null) {
        data = value.data;
        setState(() {});
      } else {
        print("error ");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingDashboarditems();
  }

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
                    imagename: "${data?[0].image}",
                    textname: "${data?[0].title}",
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
                    imagename: "${data?[1].image}",
                    textname: "${data?[1].title}",
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
                    imagename: "${data?[2].image}",
                    textname: "${data?[2].title}",
                  ),

                  DashboardWidget(
                    imagename: "${data?[3].image}",
                    textname: "${data?[3].title}",
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
                    imagename: "${data?[4].image}",
                    textname: "${data?[4].title}",
                  ),

                  DashboardWidget(
                    imagename: "${data?[5].image}",
                    textname: "${data?[5].title}",
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 5),
                DashboardWidget(
                  imagename: "${data?[6].image}",
                  textname: "${data?[6].title}",
                ),

                DashboardWidget(
                  imagename: "${data?[7].image}",
                  textname: "${data?[7].title}",
                ),
              ],
            ),

            Row(
              children: [
                SizedBox(width: 5),
                DashboardWidget(
                  imagename: "${data?[8].image}",
                  textname: "${data?[8].title}",
                ),

                DashboardWidget(
                  imagename: "${data?[9].image}",
                  textname: "${data?[9].title}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
