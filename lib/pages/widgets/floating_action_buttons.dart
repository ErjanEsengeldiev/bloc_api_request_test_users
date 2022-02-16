import 'package:flutter/material.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_bloc.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_event.dart';

class FloatingActionButtonsRow extends StatelessWidget {
  const FloatingActionButtonsRow({
    Key? key,
    required this.userBloc,
  }) : super(key: key);

  final UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              userBloc.add(UserClearEvent());
            },
            child: const Icon(Icons.clear),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              userBloc.add(UserRequestEvent('name'));
            },
            child: const Icon(Icons.download),
          ),
        ],
      ),
    );
  }
}
