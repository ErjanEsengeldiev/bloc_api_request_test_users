import 'package:dio/dio.dart';
import 'package:test_bloc_class_14_feb/models/user.dart';

class UserProvider {
  Future<List<User>> getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      final List< dynamic> listOfUsersjson = response.data;
      return listOfUsersjson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('ErorFetching');
    }
  }
}
