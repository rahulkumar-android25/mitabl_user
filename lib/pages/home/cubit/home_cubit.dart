import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mitabl_user/model/user_model.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';
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
        super(const HomeState()) {}

  final AuthenticationRepository _authenticationRepository;
  final UserRepository userRepository;

  void doLogout() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      UserModel? userModel = await userRepository.getUser();
      print('userModel ${userModel!.data!.accessToken}');
      Response response =
          await _authenticationRepository.logOutApi(userModel: userModel);

      if (response.statusCode == 200) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            serverMessage: jsonDecode(response.body)['message']));
        _authenticationRepository.logOut();
      } else {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            serverMessage: 'Something went wrong...'));

        emit(state.copyWith(
          status: FormzStatus.pure,
        ));
      }
    } catch (e) {
      print('exceptionLogin $e');
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          serverMessage: 'Something went wrong...'));
    }
  }
}
