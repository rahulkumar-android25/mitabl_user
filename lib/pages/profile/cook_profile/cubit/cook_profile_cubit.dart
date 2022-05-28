import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mitabl_user/helper/helper.dart';

import 'package:mitabl_user/helper/route_arguement.dart';
import 'package:mitabl_user/model/name.dart';
import 'package:mitabl_user/model/phone.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

part 'cook_profile_state.dart';

class CookProfileCubit extends Cubit<CookProfileState> {
  CookProfileCubit(this.authenticationRepository, this.routeArguments)
      : super(CookProfileState()) {
    print(
        'Sunny ${routeArguments!.data!.user!.id} Access ${routeArguments!.data!.accessToken}');
  }

  final RouteArguments? routeArguments;
  AuthenticationRepository? authenticationRepository;

  onNewImageAdded({String? path}) {
    List<String> allPaths = [];
    if (state.pathFiles.isNotEmpty) {
      allPaths.addAll(state.pathFiles);
      allPaths.add(path!);
    } else {
      allPaths.add(path!);
    }

    emit(state.copyWith(pathFiles: allPaths));
  }

  onDeleteImage({String? path}) {
    List<String> allPaths = [];
    if (state.pathFiles.isNotEmpty) {
      allPaths.addAll(state.pathFiles);
      allPaths.removeWhere((element) => element.toString() == path.toString());
    } else {
      allPaths.removeWhere((element) => element.toString() == path.toString());
    }

    emit(state.copyWith(pathFiles: allPaths));
  }

  onKitchnUpload(  ) async {
    try {
      emit(state.copyWith(statusApi: FormzStatus.submissionInProgress));
      Map<String, dynamic> map = {};
      map['name'] = state.nameKitchn!.value;
      map['address'] = state.address!.value;
      map['no_of_seats'] = state.noOfSeats.value;
      map['phone'] = state.phone.value;
      map['user_id'] = routeArguments!.data!.user!.id;

      print('mapppss ${map.toString()}');


      var response = await authenticationRepository!.vendorKitchnUpload(
          data: map, routeArguments: routeArguments, filePaths: state.pathFiles);
      if (response.statusCode == 200) {
        jsonDecode(response.body);

        emit(state.copyWith(statusApi: FormzStatus.submissionSuccess));
        Helper.showToast('Success');
        navigatorKey.currentState!.popAndPushNamed(
          '/HomePage',
        );
      } else {
        Helper.showToast('Something went wrong...');
        emit(state.copyWith(statusApi: FormzStatus.submissionFailure));
      }
    } on Exception catch (e) {
      emit(state.copyWith(statusApi: FormzStatus.submissionFailure));
      Helper.showToast('Something went wrong...');
    }
  }

  onKitchnNameChanged({String? value}) {
    var name = Name.dirty(value!);
    emit(state.copyWith(
        nameKitchn: name,
        status: Formz.validate(
            [name, state.phone, state.noOfSeats, state.address!])));
  }

  onAddressChanged({String? value}) {
    var address = Name.dirty(value!);
    emit(state.copyWith(
        address: address,
        status: Formz.validate(
            [address, state.nameKitchn!, state.phone, state.noOfSeats])));
  }

  onPhoneChanged({String? value}) {
    var phone = Phone.dirty(value!);
    emit(state.copyWith(
        phone: phone,
        status: Formz.validate(
            [state.nameKitchn!, state.noOfSeats, phone, state.address!])));
  }

  onSeatChanged({String? value}) {
    var seat = Phone.dirty(value!);
    emit(state.copyWith(
        noOfSeats: seat,
        status: Formz.validate(
            [state.nameKitchn!, state.phone, seat, state.address!])));
  }
}
