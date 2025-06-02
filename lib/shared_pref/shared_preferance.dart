import 'package:flutter/cupertino.dart';
import 'package:inframat/models/contractor_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  // session id storage

  static storeSessionId(String sessionId) async {
    final pref = await SharedPreferences.getInstance();

    pref.setString("fcm_token", sessionId);
  }

  static Future<String?> getSessionId() async {
    final fetchsessionId = await SharedPreferences.getInstance();
    return fetchsessionId.getString("fcm_token");
  }

  static Future<bool> removeUser() async {
    final remuser = await SharedPreferences.getInstance();
    remuser.remove("fmc_token");
    remuser.clear();

    return true;
  }

  // connection id storage
  static storeConnectionId(String connectionId) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("connection_id", connectionId);
  }

  static Future<String?> getConnectionId() async {
    final fetchconnectionId = await SharedPreferences.getInstance();
    return fetchconnectionId.getString("connection_id");
  }

  // auth_id Storage

  static storeAuthId(String authid) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("auth_code", authid);
  }

  // getting auth_id

  static Future<String?> gettingAuthId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("auth_code");
  }

  static Future<bool> remAuthcode() async {
    final remuser = await SharedPreferences.getInstance();
    remuser.remove("auth_code");
    remuser.remove("connection_id");
    remuser.clear();

    return true;
  }

  // storing latitude
  static storeLat(String lat) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("lat", lat);
  }

  // storing longitude
  static storeLong(String long) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("long", long);
  }

  // getting latitude of user
  static Future<String?> gettingLatitude() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("lat");
  }

  // getting longitude  of

  static Future<String?> gettingLongitude() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("long");
  }

  // store punch in image base64encode
  static storeImageBase64(String image1) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("image", image1);
  }

  // getting punchin image base64encoded

  static Future<String?> gettingImageBase64Encoded() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("image");
  }

  // storing the base64 punchOut image
  static storepunchOutImage(String image64) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("image", image64);
  }

  static Future<String?> gettingPunchOutImage() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("image");
  }

  static storeInwardId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('inward_id', id);
  }

  static Future<String?> gettinginwardId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("inward_id");
  }

  static storeCategoryId(String id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("id", id);
  }

  static Future<String?> gettingCategoryId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("id");
  }

  // id store and get methods for plant, machine, and site
  static storeplantId(String id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("plant_id", id);
  }

  static Future<String?> gettingPlantId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("plant_id");
  }

  static storemachineId(String id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("machine_id", id);
  }

  static Future<String?> gettingMachineId() async {
    final pref = await SharedPreferences.getInstance();
    print("${pref.getString("machine_id")}");
    return pref.getString("machine_id");
  }

  static storesiteId(String id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("site_id", id);
  }

  static Future<String?> gettingSiteId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("site_id");
  }
}
