import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inframat/bottomnav_screen/bdocument.dart';
import 'package:inframat/bottomnav_screen/bhome.dart';
import 'package:inframat/bottomnav_screen/bprofile.dart';
import 'package:inframat/bottomnav_screen/bsearch.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/models/dashboard_model.dart';
import 'package:inframat/provider/dashboard_process_provider.dart';
import 'package:inframat/provider/operator_logout_provider.dart';
import 'package:inframat/screens/anneling/anneling_process.dart';

import 'package:inframat/screens/coil_slitting_screen.dart';
import 'package:inframat/screens/crm_cold_mill/crm_cold_rolling.dart';
import 'package:inframat/screens/cutting_process/cutting_process.dart';
import 'package:inframat/screens/galvanizing_line/continuous_galvanizing_line.dart';
import 'package:inframat/screens/mini%20coil%20slitting/mini_coil_slitting.dart';
import 'package:inframat/screens/skin_pass/skin_pass.dart';
import 'package:inframat/screens/splash_screen.dart';
import 'package:inframat/screens/tubemill/tube_mill_process.dart';
import 'package:inframat/widgets/invard_widget.dart/invard.dart';
import 'package:inframat/widgets/picklingprocess/piickling_process.dart';
import 'package:inframat/screens/punch_out.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:inframat/widgets/dashboard_widget.dart';
import 'package:provider/provider.dart';

class Dashboard2 extends StatefulWidget {
  const Dashboard2({super.key});

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  int index = 0;
  List scnees = [Bhome(sessionId: ""), Bprofile(), Bsearch(), Bdocument()];
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.whitecolor,
        drawer: Drawer(
          backgroundColor: Appcolor.deepPurple,
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  height: 40,
                  width: 40,
                  AppImages.appbarlogo,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * .3),
              ListTile(
                leading: Icon(
                  Icons.manage_accounts_sharp,
                  size: 30,
                  color: Appcolor.whitecolor,
                ),
                title: Text(
                  "Profile ",
                  style: TextStyle(color: Appcolor.whitecolor, fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 30,
                  color: Appcolor.whitecolor,
                ),
                title: Text(
                  "Performance DashBoard",
                  style: TextStyle(color: Appcolor.whitecolor, fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 30,
                  color: Appcolor.whitecolor,
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(color: Appcolor.whitecolor, fontSize: 20),
                ),
                onTap: () async {
                  Provider.of<OperatorLogOutProvider>(
                    context,
                    listen: false,
                  ).getoperatorLogout().then((value) async {
                    if (value!.status == "success") {
                      AppStorage.remAuthcode();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    }
                  });
                },
              ),
            ],
          ),
        ),

        appBar: AppBar(
          backgroundColor: Colors.transparent,

          flexibleSpace: Container(
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Appcolor.lightpurple, Appcolor.deepPurple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),

            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * .15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppImages.appbarlogo),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .064),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Punchout()),
                    );
                  },
                  child: Container(
                    height: 34,
                    width: MediaQuery.of(context).size.width * .196,
                    decoration: BoxDecoration(
                      color: Appcolor.gcol,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 4),
                        Text(
                          "ON",
                          style: TextStyle(
                            fontSize: 16,
                            color: Appcolor.whitecolor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * .001,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Appcolor.whitecolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(indicatorColor: Appcolor.deepPurple),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected:
                (index) => setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.edit_document, color: Appcolor.whitecolor),
                label: "Document",
              ),
              NavigationDestination(
                icon: Icon(Icons.search, color: Appcolor.whitecolor),
                label: "Search",
              ),
              NavigationDestination(
                icon: Icon(Icons.home, color: Appcolor.whitecolor),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.people, color: Appcolor.whitecolor),
                label: "account",
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invard()),
                      );
                    },
                    child: DashboardWidget(
                      imagename: "${data?[0].image}",
                      textname: "${data?[0].title}",
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoilSlittingScreen(),
                        ),
                      );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PiicklingProcess()),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    DashboardWidget(
                      imagename: "${data?[2].image}",
                      textname: "${data?[2].title}",
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Crmcoldmill(),
                          ),
                        );
                      },
                      child: DashboardWidget(
                        imagename: "${data?[3].image}",
                        textname: "${data?[3].title}",
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Continousgalvanizingline(),
                        ),
                      );
                    },
                    child: DashboardWidget(
                      imagename: "${data?[4].image}",
                      textname: "${data?[4].title}",
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnnelingProcess(),
                        ),
                      );
                    },
                    child: DashboardWidget(
                      imagename: "${data?[5].image}",
                      textname: "${data?[5].title}",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SkinPass()),
                      );
                    },
                    child: DashboardWidget(
                      imagename: "${data?[6].image}",
                      textname: "${data?[6].title}",
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MinicoilSlitting(),
                        ),
                      );
                    },
                    child: DashboardWidget(
                      imagename: "${data?[7].image}",
                      textname: "${data?[7].title}",
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TubemillProcess(),
                        ),
                      );
                    },
                    child: DashboardWidget(
                      imagename: "${data?[8].image}",
                      textname: "${data?[8].title}",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cuttingprocess(),
                        ),
                      );
                    },
                    child: DashboardWidget(
                      imagename: "${data?[9].image}",
                      textname: "${data?[9].title}",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
