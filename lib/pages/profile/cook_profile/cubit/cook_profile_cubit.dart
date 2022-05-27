import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

part 'cook_profile_state.dart';

class CookProfileCubit extends Cubit<CookProfileState> {
  CookProfileCubit( this.authenticationRepository) : super(CookProfileInitial());

  AuthenticationRepository? authenticationRepository;

}
