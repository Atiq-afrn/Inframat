import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inframat/bottomnav_screen/bdocument.dart';
import 'package:inframat/bottomnav_screen/bhome.dart';
import 'package:inframat/bottomnav_screen/bprofile.dart';
import 'package:inframat/bottomnav_screen/bsearch.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/provider/operator_logout_provider.dart';
import 'package:inframat/screens/login.dart';

import 'package:inframat/screens/punchnow.dart';
import 'package:inframat/screens/splash_screen.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:inframat/widgets/dashboard_widget.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;

  List screens = [Bdocument(), Bprofile(), Bhome(sessionId: ""), Bsearch()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  final logoutProvider = Provider.of<OperatorLogOutProvider>(
                    context,
                    listen: false,
                  );

                  final value = await logoutProvider.getoperatorLogout();

                  if (value != null && value.status == "success") {
                    await AppStorage.remAuthcode();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Appcolor.deepPurple,
                        content: Center(child: Text("Logout successful.")),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    await Future.delayed(Duration(milliseconds: 500));

                    if (!context.mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  } else {
                    print("AuthCode: ${await AppStorage.gettingAuthId()}");
                    print(
                      "ConnectionID: ${await AppStorage.getConnectionId()}",
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Logout failed. Please try again."),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
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

            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .14,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppImages.appbarlogo),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .064),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Punchnow()),
                      );
                    },
                    child: Container(
                      height: 34,
                      width: MediaQuery.of(context).size.width * .2,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 0),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: CircleAvatar(
                              backgroundColor: Appcolor.whitecolor,
                            ),
                          ),
                          Text(
                            "OFF",
                            style: TextStyle(
                              fontSize: 12,
                              color: Appcolor.whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .05),

                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert, color: Colors.white),
                    ),
                  ),
                ],
              ),
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
        body: screens[index],
      ),
    );
  }
}
