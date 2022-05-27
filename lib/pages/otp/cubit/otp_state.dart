part of 'otp_cubit.dart';

class OtpState extends Equatable {
  const OtpState({this.otp, this.status=FormzStatus.pure, this.statusAPI=FormzStatus.pure});

  final OTP? otp;
  final FormzStatus? status;
  final FormzStatus? statusAPI;

  OtpState copyWith({OTP? otp, FormzStatus? status, FormzStatus? statusAPI}) {
    return OtpState(
      otp: otp ?? this.otp,
      status: status ?? this.status,
      statusAPI: statusAPI ?? this.statusAPI,
    );
  }

  @override
  List<Object?> get props => [otp, statusAPI, status];
}
