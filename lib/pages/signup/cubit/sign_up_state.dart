part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState(
      {this.phone = const Phone.pure(),
      this.email = const Email.pure(),
      this.nameFirst = const Name.pure(),
      this.nameLast = const Name.pure(),
      this.status = FormzStatus.pure,
      this.selectedRole=AppConstants.FOODI
      });

  final Name? nameFirst;
  final Name? nameLast;
  final Email? email;
  final Phone phone;
  final FormzStatus? status;
  final int selectedRole;

  SignUpState copyWith(
      {int? selectedRole,
      FormzStatus? status,
      Name? nameFirst,
      Name? nameLast,
      Email? email,
      Phone? phone}) {
    return SignUpState(
        selectedRole: selectedRole ?? this.selectedRole,
        status: status ?? this.status,
        email: email ?? this.email,
        nameFirst: nameFirst ?? this.nameFirst,
        nameLast: nameLast ?? this.nameLast,
        phone: phone ?? this.phone);
  }

  @override
  List<Object?> get props =>
      [selectedRole, status, nameLast, nameFirst, phone, email];
}
