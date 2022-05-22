import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

final navigatorKeyHome = GlobalKey<NavigatorState>();

class UserRepository {
  UserModel? user;


  Future<UserModel?> getUser() async {
    var prefs = await SharedPreferences.getInstance();
    //await prefs.clear();
    if (/*user == null &&*/ prefs.containsKey('current_user')) {
      //  _user =User.fromJson( json.decode(await prefs.get('current_user'));
      var userMap =
          jsonDecode(prefs.getString('current_user')!) as Map<String, dynamic>;
      user = UserModel.fromJson(userMap);

      //print("userfound ${user!.toJson()}");
    } else {
      // print("user null");
      return user;
    }
    return user;
  }

  Future<void> setCurrentUser(String jsonString) async {
    try {
      if (json.decode(jsonString) != null) {
        var prefs = await SharedPreferences.getInstance();
        // var user = User.fromJson(json.decode(jsonString)['result']);
        // await prefs.setString("apiKey", user.apiKey!);

        await prefs
            .setString('current_user', json.encode(json.decode(jsonString)))
            .then((value) {
          //print('user saved ');
          updateUserInstance();
        });
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  void updateUserInstance() {
    user = null;
    getCurrentUser();
  }

  void clearuserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('current_user')) {
      prefs.remove('current_user');
      // prefs.remove(AppConstants.VERSION_INFO);
    }
    /* if (prefs.containsKey('disclosure')) {
      prefs.remove('disclosure');
    }*/
    // prefs.clear();
  }

  Future<UserModel?> getCurrentUser() async {
    return user;
  }



}
