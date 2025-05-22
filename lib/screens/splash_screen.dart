import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inframat/bottomnav_screen/bhome.dart';
import 'package:inframat/const/Color.dart';
import 'package:inframat/const/imageconst.dart';
import 'package:inframat/provider/connection_provider.dart';
import 'package:inframat/screens/dashboard.dart';
import 'package:inframat/screens/login.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getConnectionId1() async {
    // Delay for demonstration or splash screen timing
    await Future.delayed(Duration(seconds: 2));

    // Get stored connection ID and auth ID
    final storedConnectionId = await AppStorage.getConnectionId();
    // final authId = await AppStorage.gettingAuthId();

    // If no connection ID, try to fetch and store it
    if (storedConnectionId == null) {
      final values =
          await Provider.of<ConnectionProvider>(
            context,
            listen: false,
          ).getconnectionId();

      if (values?.connectionId != null) {
        await AppStorage.storeConnectionId(values!.connectionId!);
        print("Generated connection_id: ${values.connectionId}");
      } else {
        print("Failed to generate connection ID.");
      }
    }

    // Check again for both connection ID and auth ID
    final currentConnectionId = await AppStorage.getConnectionId();
    final currentAuthId = await AppStorage.gettingAuthId();

    if (currentConnectionId != null && currentAuthId != null) {
      print("${currentAuthId} Auth code");
      print("${currentConnectionId} connection id");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConnectionId1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Appcolor.deepPurple],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * .6),
            Center(child: SvgPicture.asset(AppImages.logoinframat)),
          ],
        ),
      ),
    );
  }
}
