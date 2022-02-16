import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_bloc.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_event.dart';
import 'package:test_bloc_class_14_feb/bloc/user_bloc/user_state.dart';
import 'package:test_bloc_class_14_feb/pages/user_page.dart';

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
                                  child:
                                      UserPage(user: state.listOfUsers[index]),
                                )));
                  },
                  child: ListTile(
                    trailing: Text('id: ${state.listOfUsers[index].id}'),
                    subtitle: Text('email:${state.listOfUsers[index].email}'),
                    title:
                        Text('Username: ${state.listOfUsers[index].username}'),
                    leading: Text('name: ${state.listOfUsers[index].name}'),
                  ),
                ),
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
      floatingActionButton: Padding(
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
                userBloc.add(UserRequestEvent());
              },
              child: const Icon(Icons.download),
            ),
          ],
        ),
      ),
    );
  }
}
