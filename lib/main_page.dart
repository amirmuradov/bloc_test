import 'package:bloc_test/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_bloc/user_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final counterbloc = CounterBloc()..add(CounterDecEvent());
    final userbloc = UserBloc();

    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<CounterBloc>(
                create: (context) => counterbloc,
              ),
              BlocProvider<UserBloc>(
                create: (context) => UserBloc(),
              )
            ],
            child: Scaffold(
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      counterbloc.add(CounterIncEvent());
                    },
                    icon: const Icon(Icons.plus_one),
                  ),
                  IconButton(
                    onPressed: () {
                      counterbloc.add(CounterDecEvent());
                    },
                    icon: const Icon(Icons.exposure_minus_1),
                  ),
                  IconButton(
                    onPressed: () {
                      userbloc.add(UserGetUsersEvent(count: counterbloc.state));
                    },
                    icon: const Icon(Icons.person_2_outlined),
                  ),
                ],
              ),
              appBar: AppBar(
                title: const Text('Flutter Bloc learning'),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      BlocBuilder<CounterBloc, int>(
                        bloc: counterbloc,
                        builder: (context, state) {
                          return Text(
                            state.toString(),
                            style: const TextStyle(fontSize: 33),
                          );
                        },
                      ),
                      BlocBuilder<UserBloc, UserState>(
                        bloc: userbloc,
                        builder: (context, state) {
                          return Column(
                            children: [
                              if (state is UserLoadingState)
                                const CircularProgressIndicator(),
                              if (state is UesrLoadedState)
                                ...state.users.map((e) => Text(e.name))
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
