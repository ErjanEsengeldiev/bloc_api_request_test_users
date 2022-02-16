import 'package:flutter/material.dart';
import 'package:test_bloc_class_14_feb/models/user.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name.toString())),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30,
              child: Text(
                  user.name!.split(' ').map((e) => e.split('').first).join()),
            ),
            const SizedBox(height: 20),
            Text('name: ${user.name}'),
            Text('phone: ${user.phone!.split(' ').first}'),
            Text('website: ${user.website}'),
            Text(
                'address: ${user.address!.city} ${user.address!.street} ${user.address!.suite} '),
            Text('company: ${user.company!.name}'),
          ],
        ),
      ),
    );
  }
}
