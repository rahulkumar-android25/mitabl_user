part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.status = FormzStatus.pure, this.serverMessage = ''});

  final FormzStatus? status;

  final String? serverMessage;

  HomeState copyWith({FormzStatus? status, String? serverMessage}) {
    return HomeState(
        status: status ?? this.status,
        serverMessage: serverMessage ?? this.serverMessage);
  }

  @override
  List<Object?> get props => [status, serverMessage];
}
