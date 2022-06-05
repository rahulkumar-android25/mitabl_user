part of 'dashboard_cook_cubit.dart';

class DashboardCookState extends Equatable {
  const DashboardCookState({this.selectedIndex = 0});

  final int? selectedIndex;

  DashboardCookState copyWith({int? selectedIndex}) {
    return DashboardCookState(
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object?> get props => [
        selectedIndex,
      ];
}
