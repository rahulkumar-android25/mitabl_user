part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState(
      {this.phone = const Phone.pure(),
        this.email = const Email.pure(),
        this.nameFirst = const Name.pure(),
        this.nameLast = const Name.pure(),
        this.status = FormzStatus.pure});

  final Name? nameFirst;
  final Name? nameLast;
  final Email? email;
  final Phone phone;
  final FormzStatus? status;

  SignUpState copyWith(
      {FormzStatus? status,
        Name? nameFirst,
        Name? nameLast,
        Email? email,
        Phone? phone}) {
    return SignUpState(
        status: status ?? this.status,
        email: email ?? this.email,
        nameFirst: nameFirst ?? this.nameFirst,
        nameLast: nameLast ?? this.nameLast,
        phone: phone ?? this.phone);
  }

  @override
  List<Object?> get props => [status, nameLast, nameFirst, phone, email];
}
