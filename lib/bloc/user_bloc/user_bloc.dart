// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetUsersEvent>(_onGetUser);
  }
  _onGetUser(UserGetUsersEvent event, Emitter<UserState> state) async {
    emit(UserLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    final users = List.generate(
        event.count, (index) => User(name: 'user_name', id: index.toString()));
    emit(UesrLoadedState(users: users));
  }
}
