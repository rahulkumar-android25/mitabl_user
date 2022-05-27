part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = FormzStatus.pure,
  });

  final FormzStatus? status;

  HomeState copyWith({
    FormzStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
