import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_mvvm/user_list/views_models/user_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text(
                userViewModel.selectedUser.name ?? '',
              ),
              Text(
                userViewModel.selectedUser.email ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
