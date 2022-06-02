import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mitabl_user/helper/helper.dart';
import 'package:mitabl_user/model/user_model.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';
import 'package:mitabl_user/repos/home_repository.dart';
import 'package:mitabl_user/repos/user_repository.dart';
import 'package:http/http.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        userRepository = userRepository,
        super(const HomeState()) {
    onTopratedRestaurants();
    onNearByRestaurants();
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository userRepository;

  void onTopratedRestaurants() async {
    try {
      emit(state.copyWith(statusApi: FormzStatus.submissionInProgress));
      UserModel? userModel = await userRepository.getUser();

      print(userModel!.data!.accessToken);

      Map<String, dynamic> map = {};
      map['lat'] = '30.6754';
      map['lon'] = '76.7405';
      map['max_distance'] = '15';
      print('mapppss ${map.toString()}');

      Response response = await new HomeRepository()
          .topRatedRestaurants(data: map, userModel: userModel);
      if (response.statusCode == 200) {
        jsonDecode(response.body);

        emit(state.copyWith(statusApi: FormzStatus.submissionSuccess));
        Helper.showToast('Success');
        // navigatorKey.currentState!.popAndPushNamed(
        //   '/HomePage',
        // );
      } else {
        jsonDecode(response.body);
        Helper.showToast('Something went wrong...');
        emit(state.copyWith(statusApi: FormzStatus.submissionFailure));
      }
    } on Exception catch (e) {
      emit(state.copyWith(statusApi: FormzStatus.submissionFailure));
      Helper.showToast('Something went wrong...');
    }
  }

  void onNearByRestaurants() async {
    try {
      emit(state.copyWith(statusApi: FormzStatus.submissionInProgress));
      UserModel? userModel = await userRepository.getUser();

      print(userModel!.data!.accessToken);

      Map<String, dynamic> map = {};
      map['lat'] = '30.6754';
      map['lon'] = '76.7405';
      map['dine_in'] = '1';
      map['take_away'] = '1';
      map['max_distance'] = '15';
      print('mapppss ${map.toString()}');

      Response response = await new HomeRepository()
          .nearByRestaurants(data: map, userModel: userModel);
      if (response.statusCode == 200) {
        jsonDecode(response.body);

        emit(state.copyWith(statusApi: FormzStatus.submissionSuccess));
        Helper.showToast('Success');
        // navigatorKey.currentState!.popAndPushNamed(
        //   '/HomePage',
        // );
      } else {
        jsonDecode(response.body);
        Helper.showToast('Something went wrong...');
        emit(state.copyWith(statusApi: FormzStatus.submissionFailure));
      }
    } on Exception catch (e) {
      emit(state.copyWith(statusApi: FormzStatus.submissionFailure));
      Helper.showToast('Something went wrong...');
    }
  }

  void doLogout() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      UserModel? userModel = await userRepository.getUser();
      print('userModel ${userModel!.data!.accessToken}');
      Response response =
          await _authenticationRepository.logOutApi(userModel: userModel);

      print('Respomse ${jsonDecode(response.body)}');

      if (response.statusCode == 200) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            serverMessage: jsonDecode(response.body)['message']));
        _authenticationRepository.logOut();
      } else {
        // emit(state.copyWith(
        //     status: FormzStatus.submissionFailure,
        //     serverMessage: 'Something went wrong...'));

        emit(state.copyWith(
          status: FormzStatus.pure,
        ));
        _authenticationRepository.logOut();
      }
    } catch (e) {
      print('exceptionLogin $e');
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          serverMessage: 'Something went wrong...'));
    }
  }
}
