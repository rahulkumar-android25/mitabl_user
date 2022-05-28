import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mitabl_user/helper/appconstants.dart';
import 'package:mitabl_user/helper/route_arguement.dart';
import 'package:mitabl_user/model/otp_response.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

import '../../../helper/helper.dart';
import '../../../model/otp.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.authenticationRepository, this.routeArguments)
      : super(OtpState());

  final AuthenticationRepository? authenticationRepository;
  final RouteArguments? routeArguments;

  onOtpChanged({String? value}) {
    var values = OTP.dirty(value!);
    emit(state.copyWith(otp: values, status: Formz.validate([values])));
  }

  onSubmitted() async {
    try {
      emit(state.copyWith(statusAPI: FormzStatus.submissionInProgress));
      Map<String, dynamic> map = {};
      map['id'] = routeArguments!.id;
      map['otp'] = state.otp!.value.toString();

      var response = await authenticationRepository!.otpVerify(data: map);
      if (response.statusCode == 200) {
        OTPResponse otpResponse =
            OTPResponse.fromJson(jsonDecode(response.body));
        emit(state.copyWith(statusAPI: FormzStatus.submissionSuccess));
        if (routeArguments!.role == AppConstants.FOODI) {
          navigatorKey.currentState!.popAndPushNamed('/HomePage');
        } else {
          //CookProfile
          navigatorKey.currentState!.popAndPushNamed('/CookProfile',
              arguments: RouteArguments(data: otpResponse.data));
        }
      } else {
        emit(state.copyWith(statusAPI: FormzStatus.submissionFailure));
        Helper.showToast('Something went wrong...');
      }
    } on Exception catch (e) {
      Helper.showToast('Something went wrong...');
      emit(state.copyWith(statusAPI: FormzStatus.submissionFailure));
    }
  }
}
