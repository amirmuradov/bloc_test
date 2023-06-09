part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserGetUsersEvent extends UserEvent {
  final int count;

  UserGetUsersEvent({required this.count});
}
