import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inframat/provider/annealing_plan_list_provider.dart';
import 'package:inframat/provider/catagory_provider.dart';
import 'package:inframat/provider/cgl_plan_listing_provider.dart';
import 'package:inframat/provider/cgl_process_provider.dart';
import 'package:inframat/provider/coil_slitting_provider.dart';
import 'package:inframat/provider/coilslitting_plan_seaarch_provider.dart';
import 'package:inframat/provider/connection_provider.dart';
import 'package:inframat/provider/crm_process_provider.dart';
import 'package:inframat/provider/crm_provider.dart';
import 'package:inframat/provider/cutting_process2_provider.dart';
import 'package:inframat/provider/cutting_processplan_provider.dart';
import 'package:inframat/provider/dashboard_process_provider.dart';
import 'package:inframat/provider/forget_password_provider.dart';
import 'package:inframat/provider/invards_all_details_provider.dart';
import 'package:inframat/provider/login_provider.dart';
import 'package:inframat/provider/mini_coilSlittingPlan_provider.dart';
import 'package:inframat/provider/mini_coilsllitting_provider.dart';
import 'package:inframat/provider/new_password_provider.dart';
import 'package:inframat/provider/operator_login_provider.dart';
import 'package:inframat/provider/operator_logout_provider.dart';
import 'package:inframat/provider/opt_verify_provider.dart';
import 'package:inframat/provider/pausedata_send_provider.dart';
import 'package:inframat/provider/pauslist_provider.dart';
import 'package:inframat/provider/pickling_process_provider.dart';
import 'package:inframat/provider/picling_plan_list_provider.dart';
import 'package:inframat/provider/print_qr_coder_provider.dart';
import 'package:inframat/provider/punch_in_provider.dart';
import 'package:inframat/provider/punch_out_provider.dart';
import 'package:inframat/provider/qr_scann_provider.dart';
import 'package:inframat/provider/quality_check_provider.dart';
import 'package:inframat/provider/skin_pass_plan_provider.dart';
import 'package:inframat/provider/skinpass_process_provider.dart';
import 'package:inframat/provider/sub_category_provider.dart';
import 'package:inframat/provider/timellog_provider.dart';
import 'package:inframat/provider/tubemill_plan_provider.dart';
import 'package:inframat/provider/tubemillrecoveryprocess_provider.dart';
import 'package:inframat/provider/vendors_list_provider.dart';

import 'package:inframat/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ConnectionProvider()),
        ChangeNotifierProvider(create: (context) => OperatorLoginProvider()),
        ChangeNotifierProvider(create: (context) => OperatorLogOutProvider()),
        ChangeNotifierProvider(create: (context) => PunchInProvider()),
        ChangeNotifierProvider(create: (context) => PunchOutProvider()),
        ChangeNotifierProvider(create: (context) => QrScannProvider()),
        ChangeNotifierProvider(
          create: (context) => InvardsAllDetailsProvider(),
        ),
        ChangeNotifierProvider(create: (context) => QualityCheckProvider()),
        ChangeNotifierProvider(create: (context) => CatagoryProvider()),
        ChangeNotifierProvider(create: (context) => SubCategoryProvider()),
        ChangeNotifierProvider(create: (context) => CoilSlittingProvider()),
        ChangeNotifierProvider(create: (context) => ForgetpasswordProvider()),
        ChangeNotifierProvider(create: (context) => OptVerifyProvider()),
        ChangeNotifierProvider(create: (context) => NewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => VendorsListProvider()),
        ChangeNotifierProvider(
          create: (context) => CoilslittingPlanSeaarchProvider(),
        ),
        ChangeNotifierProvider(create: (context) => PicklingPlanProvider()),
        ChangeNotifierProvider(create: (context) => PicklingProcessProvider()),
        ChangeNotifierProvider(create: (context) => CrmProvider()),
        ChangeNotifierProvider(create: (context) => CrmProcessProvider()),
        ChangeNotifierProvider(create: (context) => CglPlanListingProvider()),
        ChangeNotifierProvider(create: (context) => CglProcessProvider()),
        ChangeNotifierProvider(
          create: (context) => AnnealingPlanListProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SkinPassPlanProvider()),
        ChangeNotifierProvider(create: (context) => SkinpassProcessProvider()),
        ChangeNotifierProvider(
          create: (context) => MiniCoilslittingplanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MiniCoilsllittingProcessProvider(),
        ),
        ChangeNotifierProvider(create: (context) => PrintQrCoderProvider()),
        ChangeNotifierProvider(create: (context) => TubemillPlanProvider()),
        ChangeNotifierProvider(
          create: (context) => CuttingProcessplanProvider(),
        ),
        ChangeNotifierProvider(create: (context) => CuttingProcess2Provider()),
        ChangeNotifierProvider(create: (context) => PauslistProvider()),
        ChangeNotifierProvider(create: (context) => PausedataSendProvider()),
        ChangeNotifierProvider(
          create: (context) => TubemillrecoveryprocessProvider(),
        ),
        ChangeNotifierProvider(create: (context) => DashboardProcessProvider()),
        ChangeNotifierProvider(create: (context) => TimellogProvider()),
      ],
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Inframat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
          // InvardBarcode(),
          //RewindingProcess(),
          SplashScreen(),
    );
  }
}
