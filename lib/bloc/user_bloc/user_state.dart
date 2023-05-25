part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UesrLoadedState extends UserState {
  final List<User> users;

  UesrLoadedState({required this.users});
}

class UserLoadingState extends UserState {}

class User {
  final String name;
  final String id;
  User({required this.name, required this.id});
}
