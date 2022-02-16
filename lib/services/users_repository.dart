import 'package:test_bloc_class_14_feb/services/user_api_request.dart';

import '../models/user.dart';

class UsersRepository {
  Future<List<User>> getAllUsers = UserProvider().getUsers();
}
