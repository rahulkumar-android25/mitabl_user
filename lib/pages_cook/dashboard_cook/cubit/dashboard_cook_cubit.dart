import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mitabl_user/repos/user_repository.dart';

part 'dashboard_cook_state.dart';

class DashboardCookCubit extends Cubit<DashboardCookState> {
  DashboardCookCubit({UserRepository? userRepository})
      : super(DashboardCookState());

  onTabChange({int? index}) {
    emit(state.copyWith(selectedIndex: index));
  }
}
