part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.status = FormzStatus.pure,
      this.statusApi = FormzStatus.pure,
      this.statusTopRes = FormzStatus.pure,
      this.serverMessage = '',
      this.nearByRestaurants
      , this.topReatedRestResponse});

  final FormzStatus? status;
  final FormzStatus? statusApi;
  final FormzStatus? statusTopRes;

  final String? serverMessage;
  final NearByRestaurantsResponse? nearByRestaurants;
  final TopReatedRestResponse? topReatedRestResponse;

  HomeState copyWith(
      {FormzStatus? status,
      FormzStatus? statusApi,
      FormzStatus? statusTopRes,
      String? serverMessage,
      NearByRestaurantsResponse? nearByRestaurants,
        TopReatedRestResponse? topReatedRestResponse}) {
    return HomeState(
        status: status ?? this.status,
        statusTopRes: statusTopRes ?? this.statusTopRes,
        statusApi: statusApi ?? this.statusApi,
        nearByRestaurants: nearByRestaurants ?? this.nearByRestaurants,
        topReatedRestResponse: topReatedRestResponse ?? this.topReatedRestResponse,
        serverMessage: serverMessage ?? this.serverMessage);
  }

  @override
  List<Object?> get props =>
      [status, statusApi, serverMessage,statusTopRes,
        topReatedRestResponse,  nearByRestaurants];
}
