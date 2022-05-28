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
  });

  final Name? nameKitchn;
  final Name? address;
  final Phone phone;
  final Phone noOfSeats;
  final FormzStatus? status;
  final FormzStatus? statusApi;
  final String? serverMessage;

  CookProfileState copyWith(
      {FormzStatus? status,
      FormzStatus? statusApi,
      Name? nameKitchn,
      Name? address,
      Phone? noOfSeats,
      String? serverMessage,
      Phone? phone}) {
    return CookProfileState(
        statusApi: statusApi ?? this.statusApi,
        status: status ?? this.status,
        address: address ?? this.address,
        nameKitchn: nameKitchn ?? this.nameKitchn,
        noOfSeats: noOfSeats ?? this.noOfSeats,
        serverMessage: serverMessage ?? this.serverMessage,
        phone: phone ?? this.phone);
  }

  @override
  List<Object?> get props =>
      [noOfSeats, statusApi, address, status, nameKitchn, phone, serverMessage];
}
