part of 'cook_profile_cubit.dart';

class CookProfileState extends Equatable {
  const CookProfileState({
    this.phone = const Phone.pure(),
    this.nameKitchn = const Name.pure(),
    this.address = const Name.pure(),
    this.status = FormzStatus.pure,
    this.statusApi = FormzStatus.pure,
    this.serverMessage = '',
    this.noOfSeats = const Phone.pure(),
    this.pathFiles = const [],
    this.days = const [],
    this.daysTiming = const [],
  });

  final Name? nameKitchn;
  final Name? address;
  final Phone phone;
  final Phone noOfSeats;
  final FormzStatus? status;
  final FormzStatus? statusApi;
  final String? serverMessage;
  final List<String> pathFiles;
  final List<String>? days;
  final List<Days> daysTiming;

  CookProfileState copyWith(
      {List<Days>? daysTiming,
      List<String>? days,
      FormzStatus? status,
      List<String>? pathFiles,
      FormzStatus? statusApi,
      Name? nameKitchn,
      Name? address,
      Phone? noOfSeats,
      String? serverMessage,
      Phone? phone}) {
    return CookProfileState(
        daysTiming: daysTiming ?? this.daysTiming,
        pathFiles: pathFiles ?? this.pathFiles,
        statusApi: statusApi ?? this.statusApi,
        status: status ?? this.status,
        address: address ?? this.address,
        nameKitchn: nameKitchn ?? this.nameKitchn,
        noOfSeats: noOfSeats ?? this.noOfSeats,
        serverMessage: serverMessage ?? this.serverMessage,
        phone: phone ?? this.phone);
  }

  @override
  List<Object?> get props => [
        daysTiming,
        pathFiles,
        noOfSeats,
        statusApi,
        address,
        status,
        nameKitchn,
        phone,
        serverMessage
      ];
}
