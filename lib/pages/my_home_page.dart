import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_bloc.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_state.dart';
import 'package:test_bloc_class_14_feb/pages/widgets/floating_action_buttons.dart';
import 'package:test_bloc_class_14_feb/pages/widgets/list_view_separated.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocProvider(
        create: (context) => userBloc,
        child: BlocConsumer<UserBloc, UserState>(
          bloc: userBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserLoadedState) {
              return LIstViewSeparated(
                userBloc: userBloc,
                state: state,
              );
            } else if (state is UserErorState) {
              return const Center(
                child: Text('Eror fitching users'),
              );
            } else if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is UserEmptyState) {
              return const Center(child: Text('Import users'));
            } else {
              return const Center(child: Text('Eror State'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButtonsRow(userBloc: userBloc),
    );
  }
}
