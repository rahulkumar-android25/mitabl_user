part of 'profile_cook_cubit.dart';

class ProfileCookState extends Equatable {
  const ProfileCookState(
      {this.firstName = const Name.pure(),
      this.lastName = const Name.pure(),
      this.description = const Name.pure(),
      this.phoneNo = const Phone.pure(),
      this.email = const Email.pure(),
      this.cookProfile,
      this.status = FormzStatus.pure,
      this.statusUpload = FormzStatus.pure,
      this.avatarPath = '',
      this.tabIndex = 0});

  final int? tabIndex;
  final Name? firstName;
  final Name? lastName;
  final Name? description;
  final Phone? phoneNo;
  final Email? email;
  final GetCookProfileModel? cookProfile;
  final FormzStatus? status;
  final FormzStatus? statusUpload;
  final String? avatarPath;

  ProfileCookState copyWith({
    int? tabIndex,
    String? avatarPath,
    FormzStatus? statusUpload,
    Name? firstName,
    Name? lastName,
    Name? description,
    Phone? phoneNo,
    Email? email,
    FormzStatus? status,
    GetCookProfileModel? cookProfile,
  }) {
    return ProfileCookState(
        tabIndex: tabIndex ?? this.tabIndex,
        statusUpload: statusUpload ?? this.statusUpload,
        avatarPath: avatarPath ?? this.avatarPath,
        status: status ?? this.status,
        email: email ?? this.email,
        description: description ?? this.description,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        cookProfile: cookProfile ?? this.cookProfile,
        phoneNo: phoneNo ?? this.phoneNo);
  }

  @override
  List<Object?> get props => [
        tabIndex,
        statusUpload,
        avatarPath,
        status,
        email,
        phoneNo,
        firstName,
        lastName,
        description,
        cookProfile
      ];
}
