import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:mitabl_user/repos/user_repository.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

final navigatorKey = GlobalKey<NavigatorState>();

class AuthenticationRepository {
  final controller = StreamController<AuthenticationStatus>();
  final UserRepository _userRepository = UserRepository();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 3));

    final user = await _userRepository.getUser();

    if (user != null) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }

    yield* controller.stream;
  }

  Future<dynamic?> logIn({
    required Map<String, dynamic> data,
  }) async {
    // try {
    final url =
        '${GlobalConfiguration().getValue<String>('api_base_url')}login';

    print(url);

    final client = http.Client();

    final response = await client.post(Uri.parse(url),
        // headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data));

    if (response.statusCode == 200) {
      return response;
    }
    return response;
    // } catch (e) {
    //   print('exception $e');
    // }
  }

  Future<dynamic?> logOutApi() async {
    // try {
    final url =
        '${GlobalConfiguration().getValue<String>('api_base_url')}logout';

    print(url);

    final client = http.Client();

    final response = await client.post(
      Uri.parse(url),
      // headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      this.logOut();
      return response;
    }
    return response;
  }

  void logOut() {
    _userRepository.clearuserData();
    //print('app:-unauthenticated_logOut');
    controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<dynamic?> signUp({
    required Map<String, dynamic> data,
  }) async {
    try {
      final url =
          '${GlobalConfiguration().getValue<String>('api_base_url')}register';

      print(url);
      print(data);

      final client = http.Client();

      final response = await client.post(Uri.parse(url),
          // headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          headers: {
            'Content-Type': 'application/json',
            // 'Content-Type': 'multipart/form-data',
            // 'accept': 'application/json',
            // 'X-CSRF-TOKEN':''
          },
          body: json.encode(data));

      print('response ${response.body}');
      if (response.statusCode == 200) {
        return response;
      }
      return response;
    } catch (e) {
      print('exception $e');
    }
  }

  Future<dynamic?> otpVerify({
    required Map<String, dynamic> data,
  }) async {
    try {
      final url =
          '${GlobalConfiguration().getValue<String>('api_base_url')}verifyOtp';

      print(url);
      print(data);

      final client = http.Client();

      final response = await client.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(data));

      print('response ${response.body}');
      if (response.statusCode == 200) {
        return response;
      }
      return response;
    } catch (e) {
      print('exception $e');
    }
  }

  void dispose() => controller.close();
}
