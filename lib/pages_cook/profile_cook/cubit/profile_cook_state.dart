part of 'profile_cook_cubit.dart';

class ProfileCookState extends Equatable {
  const ProfileCookState({
    this.firstName = const Name.pure(),
    this.lastName = const Name.pure(),
    this.description = const Name.pure(),
    this.phoneNo = const Phone.pure(),
    this.email = const Email.pure(),
  });

  final Name? firstName;
  final Name? lastName;
  final Name? description;
  final Phone? phoneNo;
  final Email? email;

  @override
  List<Object?> get props => [];
}
