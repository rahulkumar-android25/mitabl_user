import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';
import 'package:mitabl_user/repos/user_repository.dart';

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
}
