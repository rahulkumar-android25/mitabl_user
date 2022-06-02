part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.status = FormzStatus.pure,this.statusApi = FormzStatus.pure, this.serverMessage = ''});

  final FormzStatus? status;
  final FormzStatus? statusApi;

  final String? serverMessage;

  HomeState copyWith({FormzStatus? status,FormzStatus? statusApi, String? serverMessage}) {
    return HomeState(
        status: status ?? this.status,
        statusApi: status ?? this.statusApi,
        serverMessage: serverMessage ?? this.serverMessage);
  }

  @override
  List<Object?> get props => [status,statusApi, serverMessage];
}
