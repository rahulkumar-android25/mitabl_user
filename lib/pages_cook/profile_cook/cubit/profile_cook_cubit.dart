import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mitabl_user/model/email.dart';
import 'package:mitabl_user/model/phone.dart';
import 'package:mitabl_user/repos/user_repository.dart';

import '../../../model/name.dart';

part 'profile_cook_state.dart';

class ProfileCookCubit extends Cubit<ProfileCookState> {
  ProfileCookCubit({this.userRepository}) : super(ProfileCookState());

  final UserRepository? userRepository;

  getCookProfile() async {
    await userRepository!.getCookProfile();
  }
}
