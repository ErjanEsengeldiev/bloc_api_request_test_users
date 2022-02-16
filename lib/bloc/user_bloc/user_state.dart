import 'package:test_bloc_class_14_feb/models/user.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> listOfUsers;

  UserLoadedState({required this.listOfUsers});
}

class UserErorState extends UserState {}
