import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_bloc.dart';
import 'package:test_bloc_class_14_feb/pages/user_page.dart';

class LIstViewSeparated extends StatelessWidget {
  const LIstViewSeparated({
    Key? key,
    required this.userBloc,
    required this.state,
  }) : super(key: key);

  final UserBloc userBloc;

  // ignore: prefer_typing_uninitialized_variables
  final state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: state.listOfUsers.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                        value: userBloc,
                        child: UserPage(user: state.listOfUsers[index]),
                      )));
        },
        child: ListTile(
          trailing: Text('id: ${state.listOfUsers[index].id}'),
          subtitle: Text('email:${state.listOfUsers[index].email}'),
          title: Text('Username: ${state.listOfUsers[index].username}'),
          leading: Text('name: ${state.listOfUsers[index].name}'),
        ),
      ),
    );
  }
}
