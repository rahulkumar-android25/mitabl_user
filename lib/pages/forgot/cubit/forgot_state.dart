part of 'forgot_cubit.dart';

class ForgotState extends Equatable {
  const ForgotState(
      {this.email = const Email.pure(), this.status = FormzStatus.pure});

  final Email? email;
  final FormzStatus? status;

  ForgotState copyWith({
    FormzStatus? status,
    Email? email,
  }) {
    return ForgotState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [status, email];
}
