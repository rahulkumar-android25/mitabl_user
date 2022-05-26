import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mitabl_user/model/email.dart';

part 'forgot_state.dart';

class ForgotCubit extends Cubit<ForgotState> {
  ForgotCubit() : super(ForgotState());

  onEmailChanged({String? value}) {
    var email = Email.dirty(value!);
    emit(state.copyWith(email: email, status: Formz.validate([email])));
  }
}
