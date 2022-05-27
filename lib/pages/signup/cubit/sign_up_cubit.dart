import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:mitabl_user/helper/appconstants.dart';
import 'package:mitabl_user/model/email.dart';
import 'package:mitabl_user/model/name.dart';
import 'package:mitabl_user/model/password.dart';
import 'package:mitabl_user/model/phone.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authenticationRepository) : super(SignUpState());

  final AuthenticationRepository? authenticationRepository;

  onSignUp() async {
    Map<String, dynamic> map = {};
    map['first_name'] = state.nameFirst!.value;
    map['last_name'] = state.nameFirst!.value;
    map['email'] = state.nameFirst!.value;
    // map['password']=state.nameFirst!.value;
    map['role_id'] = state.nameFirst!.value;
    map['phone'] = state.nameFirst!.value;
    // map['address']=state.nameFirst!.value;

    await authenticationRepository!.signUp(data: map);
  }

  onFirstNameChanged({String? value}) {
    var name = Name.dirty(value!);
    emit(state.copyWith(
        nameFirst: name,
        status: Formz.validate(
            [name, state.phone, state.email!, state.nameLast!])));
  }

  onRoleChanged({int? role}) {
    emit(state.copyWith(selectedRole: role));
  }

  onLastNameChanged({String? value}) {
    var name = Name.dirty(value!);
    emit(state.copyWith(
        nameLast: name,
        status: Formz.validate(
            [name, state.phone, state.email!, state.nameFirst!])));
  }

  onEmailChanged({String? value}) {
    var email = Email.dirty(value!);
    emit(state.copyWith(
        email: email,
        status: Formz.validate(
            [state.nameFirst!, state.phone, email, state.nameFirst!])));
  }

  onPhoneChanged({String? value}) {
    var phone = Phone.dirty(value!);
    emit(state.copyWith(
        phone: phone,
        status: Formz.validate(
            [state.nameFirst!, phone, state.email!, state.nameFirst!])));
  }
}
