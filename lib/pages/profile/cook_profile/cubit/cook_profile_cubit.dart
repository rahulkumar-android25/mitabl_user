import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mitabl_user/helper/route_arguement.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

part 'cook_profile_state.dart';

class CookProfileCubit extends Cubit<CookProfileState> {
  CookProfileCubit(this.authenticationRepository, this.routeArguments)
      : super(CookProfileInitial()) {
    print('Sunny ${routeArguments!.data!.user!.id}');
  }

  final RouteArguments? routeArguments;
  AuthenticationRepository? authenticationRepository;
}
