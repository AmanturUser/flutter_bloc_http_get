part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final UserModel users;
  UserLoadedState({required this.users});
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState{
  final String errorMessage;
  UserErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}


